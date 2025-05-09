require 'rails_helper'

RSpec.describe "Api::V1::Uploads", type: :request do
  describe "POST /api/v1/upload" do
    let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/files/sample.csv'), 'text/csv') }

    it "uploads a file successfully" do
      expect {
        post '/api/v1/upload', params: { file: file, state: 'SP' }
      }.to have_enqueued_job(ImportExpensesJob)

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["message"]).to eq('Arquivo enviado com sucesso. A importação está em andamento.')
    end

    it "returns an error if file is missing" do
      post '/api/v1/upload', params: { state: 'SP' }

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["error"]).to eq('Arquivo ou estado ausente.')
    end

    it "returns an error if state is missing" do
      post '/api/v1/upload', params: { file: file }

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["error"]).to eq('Arquivo ou estado ausente.')
    end
  end
end
