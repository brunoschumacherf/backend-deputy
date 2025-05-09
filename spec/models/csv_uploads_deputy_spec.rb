require 'rails_helper'

RSpec.describe CsvUploadsDeputy, type: :model do
  describe 'associations' do
    it { should belong_to(:csv_upload) }
    it { should belong_to(:deputy) }
  end

  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:csv_uploads_deputy)).to be_valid
    end
  end
end
