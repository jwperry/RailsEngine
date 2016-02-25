require "rails_helper"

describe "customers" do
  describe "GET invoices" do
    it "returns all invoices for the specified customer" do
      customer = create(:customer_with_invoices)
      get "/api/v1/customers/#{customer.id}/invoices"
      customer_invoices_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_invoices_json.count).to eq customer.invoices.count
      expect(customer_invoices_json.first["id"]).to eq customer.invoices.first.id
      expect(customer_invoices_json.first["status"]).to eq customer.invoices.first.status
    end
  end
end
