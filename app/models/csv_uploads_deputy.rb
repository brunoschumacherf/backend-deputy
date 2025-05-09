class CsvUploadsDeputy < ApplicationRecord
  belongs_to :csv_upload
  belongs_to :deputy
end
