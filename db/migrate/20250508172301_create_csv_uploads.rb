class CreateCsvUploads < ActiveRecord::Migration[7.2]
  def change
    create_table :csv_uploads do |t|
      t.string :file_path
      t.string :state
      t.string :status
      t.text :error_message

      t.timestamps
    end
  end
end
