require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:supplier) }
    it { should validate_presence_of(:value_net) }
  end

  describe 'associations' do
    it { should belong_to(:deputy) }
  end

  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:expense)).to be_valid
    end
  end
end
