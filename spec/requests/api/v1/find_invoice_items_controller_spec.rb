require "rails_helper"

describe "invoice_items" do
  describe "GET find" do
    it "returns the matching invoice_item by id" do
      invoice_item = create(:invoice_item)
      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"
      invoice_item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_item_json["id"]).to eq invoice_item.id
      expect(invoice_item_json["quantity"]).to eq invoice_item.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item.unit_price
    end

    it "returns the matching invoice_item by quantity" do
      invoice_item = create(:invoice_item)
      get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"
      invoice_item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_item_json["id"]).to eq invoice_item.id
      expect(invoice_item_json["quantity"]).to eq invoice_item.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item.unit_price
    end

    it "returns the matching invoice_item by unit_price" do
      invoice_item = create(:invoice_item)
      get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"
      invoice_item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_item_json["id"]).to eq invoice_item.id
      expect(invoice_item_json["quantity"]).to eq invoice_item.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item.unit_price
    end
  end
end
