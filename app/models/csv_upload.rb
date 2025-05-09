class CsvUpload < ApplicationRecord
  enum status: { pending: "pending", processing: "processing", completed: "completed", failed: "failed" }

  has_many :expenses
  has_many :csv_uploads_deputies, dependent: :destroy
  has_many :deputies, through: :csv_uploads_deputies

  validates :file_path, :state, presence: true
end
