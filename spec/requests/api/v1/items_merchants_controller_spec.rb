require "rails_helper"

describe "merchants" do
  describe "GET items" do
    it "returns all all items for the specified merchant" do
      merchant = create(:merchant_with_items)
      get "/api/v1/merchants/#{merchant.id}/items"
      merchant_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_items_json.count).to eq merchant.items.count
      expect(merchant_items_json.first["id"]).to eq merchant.items.first.id
      expect(merchant_items_json.first["name"]).to eq merchant.items.first.name
      expect(merchant_items_json.first["description"]).to eq merchant.items.first.description
    end
  end
end
