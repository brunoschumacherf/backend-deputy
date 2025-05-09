FactoryBot.define do
  factory :expense do
    deputy
    document_number { "DOC123" }
    issue_date { Date.today }
    supplier { "Fornecedor XYZ" }
    cnpj_cpf { "12.345.678/0001-90" }
    subquota_number { 1 }
    subquota_description { "Descrição" }
    subquota_specification { "Especificação" }
    value { 100.50 }
    value_glosa { 0 }
    value_net { 100.50 }
    document_url { "http://example.com/doc.pdf" }
  end
end
