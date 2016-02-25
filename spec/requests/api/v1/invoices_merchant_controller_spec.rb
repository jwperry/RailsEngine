require "rails_helper"

describe "merchants" do
  describe "GET invoices" do
    it "returns all all invoices for the specified merchant" do
      merchant = create(:merchant_with_invoices)
      get "/api/v1/merchants/#{merchant.id}/invoices"
      merchant_invoices_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_invoices_json.count).to eq merchant.invoices.count
      expect(merchant_invoices_json.first["id"]).to eq merchant.invoices.first.id
      expect(merchant_invoices_json.first["status"]).to eq merchant.invoices.first.status
    end
  end
end
