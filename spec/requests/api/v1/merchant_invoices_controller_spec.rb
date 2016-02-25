require "rails_helper"

describe "invoices" do
  describe "GET merchant" do
    it "returns the merchant for the specified invoice" do
      merchant = create(:merchant_with_invoices)
      invoice = merchant.invoices.first
      get "/api/v1/invoices/#{invoice.id}/merchant"
      invoice_merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_merchant_json["id"]).to eq invoice.merchant_id
      expect(invoice_merchant_json["id"]).to eq invoice.merchant.id
      expect(invoice_merchant_json["name"]).to eq invoice.merchant.name
    end
  end
end
