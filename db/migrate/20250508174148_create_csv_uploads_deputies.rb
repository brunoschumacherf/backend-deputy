class CreateCsvUploadsDeputies < ActiveRecord::Migration[7.2]
  def change
    create_table :csv_uploads_deputies do |t|
      t.references :csv_upload, null: false, foreign_key: true
      t.references :deputy, null: false, foreign_key: true

      t.timestamps
    end

    add_index :csv_uploads_deputies, [:csv_upload_id, :deputy_id], unique: true
  end
end
