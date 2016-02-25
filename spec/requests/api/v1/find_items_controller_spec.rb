require "rails_helper"

describe "items" do
  describe "GET find" do
    it "returns the matching item by id" do
      item = create(:item)
      get "/api/v1/items/find?id=#{item.id}"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end

    it "returns the matching item by name" do
      item = create(:item)
      get "/api/v1/items/find?name=#{item.name}"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end

    it "returns the matching item by description" do
      item = create(:item)
      get "/api/v1/items/find?description=#{item.description}"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end

    it "returns the matching item by unit_price" do
      item = create(:item)
      get "/api/v1/items/find?unit_price=#{item.unit_price}"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end

    it "returns the matching item by name case insensitively" do
      item = create(:item, name: "name1")
      get "/api/v1/items/find?name=Name1"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end

    it "returns the matching item by description case insensitively" do
      item = create(:item, description: "description1")
      get "/api/v1/items/find?description=Description1"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json["id"]).to eq item.id
      expect(item_json["name"]).to eq item.name
      expect(item_json["description"]).to eq item.description
      expect(item_json["unit_price"].to_d).to eq item.unit_price
    end
  end
end
