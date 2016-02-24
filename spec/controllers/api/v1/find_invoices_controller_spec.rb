require "rails_helper"

RSpec.describe Api::V1::FindInvoicesController, type: :controller do
  describe "invoices" do
    describe "GET find" do
      it "returns the matching invoice by id" do
        invoice = create(:invoice)
        get :find, id: invoice.id, format: :json
        invoice_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(invoice_json["id"]).to eq invoice.id
        expect(invoice_json["status"]).to eq invoice.status
      end

      it "returns the matching invoice by status" do
        invoice = create(:invoice)
        get :find, status: invoice.status, format: :json
        invoice_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(invoice_json["id"]).to eq invoice.id
        expect(invoice_json["status"]).to eq invoice.status
      end

      it "returns the matching invoice by status case insensitively" do
        invoice = create(:invoice, status: "status1")
        get :find, status: "STATUS1", format: :json
        invoice_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(invoice_json["id"]).to eq invoice.id
        expect(invoice_json["status"]).to eq invoice.status
      end
    end
  end
end
