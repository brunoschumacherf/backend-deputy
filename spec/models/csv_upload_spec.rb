require 'rails_helper'

RSpec.describe CsvUpload, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:file_path) }
    it { should validate_presence_of(:state) }
  end

  describe 'associations' do
    it { should have_many(:csv_uploads_deputies).dependent(:destroy) }
    it { should have_many(:deputies).through(:csv_uploads_deputies) }
  end

  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:csv_upload)).to be_valid
    end
  end
end
