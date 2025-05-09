class Deputy < ApplicationRecord
  has_many :expenses
  has_many :csv_uploads_deputies, dependent: :destroy
  has_many :csv_uploads, through: :csv_uploads_deputies
end
