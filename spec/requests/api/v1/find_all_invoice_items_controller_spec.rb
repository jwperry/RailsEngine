require "rails_helper"

describe "invoice_items" do
  describe "GET find_all" do
    it "returns all matching invoice_items by id" do
      invoice_item = create(:invoice_item)
      get "/api/v1/invoice_items/find_all?id=#{invoice_item.id}"
      invoice_item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_item_json.first["id"]).to eq invoice_item.id
      expect(invoice_item_json.first["quantity"]).to eq invoice_item.quantity
      expect(invoice_item_json.first["unit_price"].to_d).to eq invoice_item.unit_price
    end

    it "returns all matching invoice_items by quantity" do
      invoice_item1 = create(:invoice_item, quantity: 123456)
      invoice_item2 = create(:invoice_item, quantity: 123456)
      get "/api/v1/invoice_items/find_all?quantity=#{invoice_item1.quantity}"
      invoice_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_items_json.count).to eq 2
      expect(invoice_items_json.first["id"]).to eq invoice_item1.id
      expect(invoice_items_json.first["quantity"]).to eq invoice_item1.quantity
      expect(invoice_items_json.first["unit_price"].to_d).to eq invoice_item1.unit_price
      expect(invoice_items_json.last["id"]).to eq invoice_item2.id
      expect(invoice_items_json.last["quantity"]).to eq invoice_item2.quantity
      expect(invoice_items_json.last["unit_price"].to_d).to eq invoice_item2.unit_price
    end

    it "returns all matching invoice_items by unit_price" do
      invoice_item1 = create(:invoice_item, unit_price: 123.45.to_d)
      invoice_item2 = create(:invoice_item, unit_price: 123.45.to_d)
      get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item1.unit_price}"
      invoice_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_items_json.count).to eq 2
      expect(invoice_items_json.first["id"]).to eq invoice_item1.id
      expect(invoice_items_json.first["quantity"]).to eq invoice_item1.quantity
      expect(invoice_items_json.first["unit_price"].to_d).to eq invoice_item1.unit_price
      expect(invoice_items_json.last["id"]).to eq invoice_item2.id
      expect(invoice_items_json.last["quantity"]).to eq invoice_item2.quantity
      expect(invoice_items_json.last["unit_price"].to_d).to eq invoice_item2.unit_price
    end
  end
end
