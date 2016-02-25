require "rails_helper"

describe "items" do
  describe "GET index" do
    it "returns all items" do
      create_list(:item, 2)
      item = Item.last
      get "/api/v1/items"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(items_json.count).to eq 2
      expect(items_json.last["id"]).to eq item.id
      expect(items_json.last["name"]).to eq item.name
      expect(items_json.last["description"]).to eq item.description
      expect(items_json.last["unit_price"].to_d).to eq item.unit_price
    end
  end
end
