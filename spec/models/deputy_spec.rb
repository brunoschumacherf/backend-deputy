require 'rails_helper'

RSpec.describe Deputy, type: :model do
  describe 'associations' do
    it { should have_many(:expenses) }
    it { should have_many(:csv_uploads_deputies).dependent(:destroy) }
    it { should have_many(:csv_uploads).through(:csv_uploads_deputies) }
  end

  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:deputy)).to be_valid
    end
  end
end
