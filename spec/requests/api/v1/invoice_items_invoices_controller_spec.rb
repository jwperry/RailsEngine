require "rails_helper"

describe "invoices" do
  describe "GET invoice_items" do
    it "returns all invoice_items for the specified invoice" do
      invoice = create(:invoice_with_invoice_items)
      get "/api/v1/invoices/#{invoice.id}/invoice_items"
      invoice_invoice_items_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_invoice_items_json.count).to eq invoice.invoice_items.count
      expect(invoice_invoice_items_json.first["id"]).to eq invoice.invoice_items.first.id
      expect(invoice_invoice_items_json.first["quantity"]).to eq invoice.invoice_items.first.quantity
      expect(invoice_invoice_items_json.first["unit_price"].to_d).to eq invoice.invoice_items.first.unit_price
    end
  end
end
