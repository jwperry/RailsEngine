require "rails_helper"

describe "merchants" do
  describe "GET index" do
    it "returns all merchants" do
      create_list(:merchant, 2)
      merchant = Merchant.last
      get "/api/v1/merchants"
      merchants_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchants_json.count).to eq 2
      expect(merchants_json.last["id"]).to eq merchant.id
      expect(merchants_json.last["name"]).to eq merchant.name
    end
  end
end
