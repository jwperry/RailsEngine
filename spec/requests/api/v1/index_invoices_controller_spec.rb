require "rails_helper"

describe "invoices" do
  describe "GET index" do
    it "returns all invoices" do
      create_list(:invoice, 2)
      invoice = Invoice.last
      get "/api/v1/invoices"
      invoices_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoices_json.count).to eq 2
      expect(invoices_json.last["id"]).to eq invoice.id
      expect(invoices_json.last["status"]).to eq invoice.status
    end
  end
end
