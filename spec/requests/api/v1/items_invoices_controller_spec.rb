require "rails_helper"

describe "invoices" do
  describe "GET items" do
    it "returns all items for the specified invoice" do
      invoice = create(:invoice_with_items)
      get "/api/v1/invoices/#{invoice.id}/items"
      invoice_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_items_json.count).to eq invoice.items.count
      expect(invoice_items_json.first["id"]).to eq invoice.items.first.id
      expect(invoice_items_json.first["name"]).to eq invoice.items.first.name
      expect(invoice_items_json.first["description"]).to eq invoice.items.first.description
      expect(invoice_items_json.first["unit_price"].to_d).to eq invoice.items.first.unit_price
    end
  end
end
