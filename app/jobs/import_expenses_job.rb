require 'csv'

class ImportExpensesJob < ApplicationJob
  queue_as :default

  def perform(file_path, state)
    file_record = CsvUpload.create!(file_path: File.basename(file_path), state: state, status: :processing)

    CSV.foreach(file_path, col_sep: ";", headers: true, encoding: "bom|utf-8") do |row|
      next unless row["sgUF"] == state

      deputy = Deputy.find_or_create_by!(external_id: row["ideCadastro"]) do |d|
        d.name = row["txNomeParlamentar"]
        d.cpf = row["cpf"]
        d.party = row["sgPartido"]
        d.state = row["sgUF"]
        d.legislature = row["nuLegislatura"]
      end

      # Associa o deputado ao CSV upload, se ainda não associado
      file_record.deputies << deputy unless file_record.deputies.exists?(deputy.id)

      # Cria a despesa
      deputy.expenses.create!(
        document_number: row["txtNumero"],
        issue_date: parse_date(row["datEmissao"]),
        supplier: row["txtFornecedor"],
        cnpj_cpf: row["txtCNPJCPF"],
        subquota_number: row["numSubCota"],
        subquota_description: row["txtDescricao"],
        subquota_specification: row["txtDescricaoEspecificacao"],
        value: parse_decimal(row["vlrDocumento"]),
        value_glosa: parse_decimal(row["vlrGlosa"]),
        value_net: parse_decimal(row["vlrLiquido"]),
        document_url: row["urlDocumento"]
      )
    end

    file_record.update!(status: :completed)
  rescue => e
    file_record.update!(status: :failed) if file_record&.persisted?
    Rails.logger.error("Erro ao importar CSV: #{e.message}")
    Rails.logger.error(e.backtrace.join("\n"))
  end

  private

  def parse_decimal(value)
    value.to_s.gsub(",", ".").to_d rescue 0.to_d
  end

  def parse_date(value)
    return nil if value.blank?
    Date.parse(value) rescue nil
  end
end
