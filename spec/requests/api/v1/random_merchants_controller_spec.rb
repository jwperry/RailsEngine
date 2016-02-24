require "rails_helper"

describe "merchants" do
  describe "GET random" do
    it "returns a random merchant" do
      merchant1, merchant2 = create_list(:merchant, 2)
      get "/api/v1/merchants/random"
      merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect([merchant1.id, merchant2.id]).to include merchant_json["id"]
      expect([merchant1.name, merchant2.name]).to include merchant_json["name"]
    end
  end
end
