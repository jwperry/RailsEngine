require "rails_helper"

describe "invoice_items" do
  describe "GET invoice" do
    it "returns the invoice for the specified invoice_item" do
      invoice = create(:invoice_with_invoice_items)
      invoice_item = invoice.invoice_items.first
      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
      invoice_item_invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_item_invoice_json["id"]).to eq invoice_item.invoice_id
      expect(invoice_item_invoice_json["id"]).to eq invoice.id
      expect(invoice_item_invoice_json["status"]).to eq invoice_item.invoice.status
    end
  end
end
