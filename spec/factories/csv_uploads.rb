FactoryBot.define do
  factory :csv_upload do
    file_path { "path/to/file.csv" }
    state { "SP" }
    status { :pending }
  end
end
