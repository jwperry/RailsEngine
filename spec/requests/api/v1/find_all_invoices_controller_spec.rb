require "rails_helper"

describe "invoices" do
  describe "GET find_all" do
    it "returns all matching invoices by id" do
      invoice = create(:invoice)
      get "/api/v1/invoices/find_all?id=#{invoice.id}"
      invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_json.first["id"]).to eq invoice.id
      expect(invoice_json.first["status"]).to eq invoice.status
    end

    it "returns all matching invoices by status" do
      invoice1 = create(:invoice, status: "invoice_dup_status")
      invoice2 = create(:invoice, status: "invoice_dup_status")
      get "/api/v1/invoices/find_all?status=#{invoice1.status}"
      invoices_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoices_json.count).to eq 2
      expect(invoices_json.first["id"]).to eq invoice1.id
      expect(invoices_json.first["status"]).to eq invoice1.status
      expect(invoices_json.last["id"]).to eq invoice2.id
      expect(invoices_json.last["status"]).to eq invoice2.status
    end

    it "returns all matching invoices by status case insensitively" do
      invoice1 = create(:invoice, status: "status1")
      invoice2 = create(:invoice, status: "STATUS1")
      get "/api/v1/invoices/find_all?status=Status1"
      invoices_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoices_json.count).to eq 2
      expect(invoices_json.first["id"]).to eq invoice1.id
      expect(invoices_json.first["status"]).to eq invoice1.status
      expect(invoices_json.last["id"]).to eq invoice2.id
      expect(invoices_json.last["status"]).to eq invoice2.status
    end
  end
end
