require "rails_helper"

describe "merchants" do
  describe "GET show" do
    it "returns the specified merchant" do
      merchant = create(:merchant)
      get "/api/v1/merchants/#{merchant.id}"
      merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_json["id"]).to eq merchant.id
      expect(merchant_json["name"]).to eq merchant.name
    end
  end
end
