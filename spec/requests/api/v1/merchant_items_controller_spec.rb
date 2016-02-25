require "rails_helper"

describe "items" do
  describe "GET merchant" do
    it "returns the merchant for the specified item" do
      merchant = create(:merchant_with_items)
      item = merchant.items.first
      get "/api/v1/items/#{item.id}/merchant"
      item_merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_merchant_json["id"]).to eq item.merchant_id
      expect(item_merchant_json["id"]).to eq item.merchant.id
      expect(item_merchant_json["name"]).to eq item.merchant.name
    end
  end
end
