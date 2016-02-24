require "rails_helper"

RSpec.describe Api::V1::IndexInvoicesController, type: :controller do
  describe "invoices" do
    describe "GET index" do
      it "returns all invoices" do
        create_list(:invoice, 2)
        invoice = Invoice.last
        get :index, format: :json
        invoices_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(invoices_json.count).to eq 2
        expect(invoices_json.last["id"]).to eq invoice.id
        expect(invoices_json.last["status"]).to eq invoice.status
      end
    end
  end
end
