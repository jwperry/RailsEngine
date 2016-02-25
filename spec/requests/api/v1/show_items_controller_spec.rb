require "rails_helper"

describe "items" do
  describe "GET show" do
    it "returns the specified item" do
      item = create(:item)
      get "/api/v1/items/#{item.id}"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end
  end
end
