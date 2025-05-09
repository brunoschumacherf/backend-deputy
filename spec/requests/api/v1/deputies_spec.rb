require 'rails_helper'

RSpec.describe "Api::V1::Deputies", type: :request do
  describe "GET /api/v1/deputies/:id" do
    it "returns the deputy with expenses" do
      deputy = create(:deputy)
      create_list(:expense, 2, deputy: deputy)

      get "/api/v1/deputies/#{deputy.id}"
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["deputy"]["id"]).to eq(deputy.id)
      expect(json["expenses"].size).to eq(2)
    end
  end


  describe "GET /api/v1/deputies" do
    it "returns 404 if no deputies exist" do
      create_list(:deputy, 3)

      get "/api/v1/deputies"
      expect(response).to have_http_status(404)
    end
  end
end
