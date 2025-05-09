class ExpenseSerializer < ActiveModel::Serializer
  attributes :issue_date, :supplier, :value_net, :document_url
end
