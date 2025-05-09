class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.references :deputy, null: false, foreign_key: true
      t.string :document_number
      t.date :issue_date
      t.string :supplier
      t.string :cnpj_cpf
      t.integer :subquota_number
      t.string :subquota_description
      t.string :subquota_specification
      t.decimal :value
      t.decimal :value_glosa
      t.decimal :value_net
      t.string :document_url

      t.timestamps
    end
  end
end
