# app/serializers/deputy_with_expenses_serializer.rb
class DeputyWithExpensesSerializer < ActiveModel::Serializer
  attributes :deputy, :expenses

  def deputy
    DeputySerializer.new(object).as_json
  end

  def expenses
    object.expenses.order(value_net: :desc).map do |expense|
      ExpenseSerializer.new(expense).as_json
    end
  end
end
