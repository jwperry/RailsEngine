require "rails_helper"

describe "invoices" do
  describe "GET customer" do
    it "returns the customer for the specified invoice" do
      customer = create(:customer_with_invoices)
      invoice = customer.invoices.first
      get "/api/v1/invoices/#{invoice.id}/customer"
      invoice_customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_customer_json["id"]).to eq invoice.customer_id
      expect(invoice_customer_json["id"]).to eq invoice.customer.id
      expect(invoice_customer_json["first_name"]).to eq invoice.customer.first_name
      expect(invoice_customer_json["last_name"]).to eq invoice.customer.last_name
    end
  end
end
