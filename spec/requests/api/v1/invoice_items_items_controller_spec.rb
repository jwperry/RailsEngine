require "rails_helper"

describe "items" do
  describe "GET invoice_items" do
    it "returns all invoice_items for the specified item" do
      item = create(:item_with_invoice_items)
      get "/api/v1/items/#{item.id}/invoice_items"
      item_invoice_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(item_invoice_items_json.count).to eq item.invoice_items.count
      expect(item_invoice_items_json.first["id"]).to eq item.invoice_items.first.id
      expect(item_invoice_items_json.first["quantity"]).to eq item.invoice_items.first.quantity
      expect(item_invoice_items_json.first["unit_price"].to_d).to eq item.invoice_items.first.unit_price
    end
  end
end
