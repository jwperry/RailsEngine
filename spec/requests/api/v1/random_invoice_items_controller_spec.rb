require "rails_helper"

describe "invoice_items" do
  describe "GET random" do
    it "returns a random invoice_item" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      get "/api/v1/invoice_items/random"
      invoice_item_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect([invoice_item1.id, invoice_item2.id]).to include invoice_item_json["id"]
      expect([invoice_item1.quantity, invoice_item2.quantity]).to include invoice_item_json["quantity"]
      expect([invoice_item1.unit_price, invoice_item2.unit_price]).to include invoice_item_json["unit_price"]
    end
  end
end
