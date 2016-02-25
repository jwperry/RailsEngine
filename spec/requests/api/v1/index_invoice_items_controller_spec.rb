require "rails_helper"

describe "invoice_items" do
  describe "GET index" do
    it "returns all invoice_items" do
      create_list(:invoice_item, 2)
      invoice_item = InvoiceItem.last
      get "/api/v1/invoice_items"
      invoice_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_items_json.count).to eq 2
      expect(invoice_items_json.last["id"]).to eq invoice_item.id
      expect(invoice_items_json.last["quantity"]).to eq invoice_item.quantity
      expect(invoice_items_json.last["unit_price"].to_d).to eq invoice_item.unit_price
    end
  end
end
