FactoryBot.define do
  factory :deputy do
    name { "João Silva" }
    cpf { "123.456.789-00" }
    external_id { 12345 }
    party { "ABC" }
    state { "SP" }
    legislature { 2023 }
  end
end
