require "rails_helper"

describe "items" do
  describe "GET random" do
    it "returns a random item" do
      item1, item2 = create_list(:item, 2)
      get "/api/v1/items/random"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect([item1.id, item2.id]).to include item_json["id"]
      expect([item1.name, item2.name]).to include item_json["name"]
      expect([item1.description, item2.description]).to include item_json["description"]
      expect([item1.unit_price, item2.unit_price]).to include item_json["unit_price"].to_d
    end
  end
end
