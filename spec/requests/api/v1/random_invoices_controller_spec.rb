require "rails_helper"

describe "invoices" do
  describe "GET random" do
    it "returns a random invoice" do
      invoice1, invoice2 = create_list(:invoice, 2)
      get "/api/v1/invoices/random"
      invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect([invoice1.id, invoice2.id]).to include invoice_json["id"]
      expect([invoice1.status, invoice2.status]).to include invoice_json["status"]
    end
  end
end
