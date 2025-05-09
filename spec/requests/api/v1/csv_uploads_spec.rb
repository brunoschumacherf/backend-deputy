require 'rails_helper'

RSpec.describe "Api::V1::CsvUploads", type: :request do
  describe "GET /api/v1/csv_uploads" do
    it "returns a list of CSV uploads" do
      create_list(:csv_upload, 3)

      get '/api/v1/csv_uploads'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /api/v1/csv_uploads/:id" do
    it "returns the deputies of a CSV upload" do
      csv_upload = create(:csv_upload)
      deputies = create_list(:deputy, 2)
      csv_upload.deputies << deputies

      get "/api/v1/csv_uploads/#{csv_upload.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
      expect(json.first).to include("name" => deputies.first.name)
    end
  end
end
