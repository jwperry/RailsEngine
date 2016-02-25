require "rails_helper"

describe "items" do
  describe "GET find_all" do
    it "returns all matching items by id" do
      item = create(:item)
      get "/api/v1/items/find_all?id=#{item.id}"
      item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_json.first["id"]).to eq item.id
      expect(item_json.first["name"]).to eq item.name
      expect(item_json.first["description"]).to eq item.description
      expect(item_json.first["unit_price"].to_d).to eq item.unit_price
    end

    it "returns all matching items by name" do
      item1 = create(:item, name: "item_dup_name")
      item2 = create(:item, name: "item_dup_name")
      get "/api/v1/items/find_all?name=#{item1.name}"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(items_json.count).to eq 2
      expect(items_json.first["id"]).to eq item1.id
      expect(items_json.first["name"]).to eq item1.name
      expect(items_json.first["description"]).to eq item1.description
      expect(items_json.first["unit_price"].to_d).to eq item1.unit_price
      expect(items_json.last["id"]).to eq item2.id
      expect(items_json.last["name"]).to eq item2.name
      expect(items_json.last["description"]).to eq item2.description
      expect(items_json.last["unit_price"].to_d).to eq item2.unit_price
    end

    it "returns all matching items by description" do
      item1 = create(:item, description: "item_dup_description")
      item2 = create(:item, description: "item_dup_description")
      get "/api/v1/items/find_all?description=#{item1.description}"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(items_json.count).to eq 2
      expect(items_json.first["id"]).to eq item1.id
      expect(items_json.first["name"]).to eq item1.name
      expect(items_json.first["description"]).to eq item1.description
      expect(items_json.first["unit_price"].to_d).to eq item1.unit_price
      expect(items_json.last["id"]).to eq item2.id
      expect(items_json.last["name"]).to eq item2.name
      expect(items_json.last["description"]).to eq item2.description
      expect(items_json.last["unit_price"].to_d).to eq item2.unit_price
    end

    it "returns all matching items by unit_price" do
      item1 = create(:item, unit_price: 123.45.to_d)
      item2 = create(:item, unit_price: 123.45.to_d)
      get "/api/v1/items/find_all?unit_price=#{item1.unit_price}"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(items_json.count).to eq 2
      expect(items_json.first["id"]).to eq item1.id
      expect(items_json.first["name"]).to eq item1.name
      expect(items_json.first["description"]).to eq item1.description
      expect(items_json.first["unit_price"].to_d).to eq item1.unit_price
      expect(items_json.last["id"]).to eq item2.id
      expect(items_json.last["name"]).to eq item2.name
      expect(items_json.last["description"]).to eq item2.description
      expect(items_json.last["unit_price"].to_d).to eq item2.unit_price
    end

    it "returns all matching items by name case insensitively" do
      item1 = create(:item, name: "name1")
      item2 = create(:item, name: "NAME1")
      get "/api/v1/items/find_all?name=Name1"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(items_json.count).to eq 2
      expect(items_json.first["id"]).to eq item1.id
      expect(items_json.first["name"]).to eq item1.name
      expect(items_json.first["description"]).to eq item1.description
      expect(items_json.first["unit_price"].to_d).to eq item1.unit_price
      expect(items_json.last["id"]).to eq item2.id
      expect(items_json.last["name"]).to eq item2.name
      expect(items_json.last["description"]).to eq item2.description
      expect(items_json.last["unit_price"].to_d).to eq item2.unit_price
    end

    it "returns all matching items by description case insensitively" do
      item1 = create(:item, description: "description1")
      item2 = create(:item, description: "DESCRIPTION1")
      get "/api/v1/items/find_all?description=Description1"
      items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(items_json.count).to eq 2
      expect(items_json.first["id"]).to eq item1.id
      expect(items_json.first["name"]).to eq item1.name
      expect(items_json.first["description"]).to eq item1.description
      expect(items_json.first["unit_price"].to_d).to eq item1.unit_price
      expect(items_json.last["id"]).to eq item2.id
      expect(items_json.last["name"]).to eq item2.name
      expect(items_json.last["description"]).to eq item2.description
      expect(items_json.last["unit_price"].to_d).to eq item2.unit_price
    end
  end
end
