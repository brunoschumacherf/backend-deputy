class Expense < ApplicationRecord
  belongs_to :deputy

  validates :supplier, :value_net, presence: true
end
