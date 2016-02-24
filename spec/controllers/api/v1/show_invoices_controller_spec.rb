require "rails_helper"

RSpec.describe Api::V1::ShowInvoicesController, type: :controller do
  describe "invoices" do
    describe "GET show" do
      it "returns the specified invoice" do
        invoice = create(:invoice)
        get :show, id: invoice.id, format: :json
        invoice_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(invoice_json["id"]).to eq invoice.id
        expect(invoice_json["status"]).to eq invoice.status
      end
    end
  end
end
