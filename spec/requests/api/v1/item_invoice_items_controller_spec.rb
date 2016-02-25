require "rails_helper"

describe "invoice_items" do
  describe "GET item" do
    it "returns the item for the specified invoice_item" do
      item = create(:item_with_invoice_items)
      invoice_item = item.invoice_items.first
      get "/api/v1/invoice_items/#{invoice_item.id}/item"
      invoice_item_item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_item_item_json["id"]).to eq invoice_item.item_id
      expect(invoice_item_item_json["id"]).to eq item.id
      expect(invoice_item_item_json["name"]).to eq invoice_item.item.name
      expect(invoice_item_item_json["description"]).to eq invoice_item.item.description
      expect(invoice_item_item_json["unit_price"].to_d).to eq invoice_item.item.unit_price
    end
  end
end
