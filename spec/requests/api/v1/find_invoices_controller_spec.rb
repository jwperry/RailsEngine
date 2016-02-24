require "rails_helper"

describe "invoices" do
  describe "GET find" do
    it "returns the matching invoice by id" do
      invoice = create(:invoice)
      get "/api/v1/invoices/find?id=#{invoice.id}"
      invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_json["id"]).to eq invoice.id
      expect(invoice_json["status"]).to eq invoice.status
    end

    it "returns the matching invoice by status" do
      invoice = create(:invoice)
      get "/api/v1/invoices/find?status=#{invoice.status}"
      invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_json["id"]).to eq invoice.id
      expect(invoice_json["status"]).to eq invoice.status
    end

    it "returns the matching invoice by status case insensitively" do
      invoice = create(:invoice, status: "status1")
      get "/api/v1/invoices/find?status=Status1"
      invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_json["id"]).to eq invoice.id
      expect(invoice_json["status"]).to eq invoice.status
    end
  end
end
