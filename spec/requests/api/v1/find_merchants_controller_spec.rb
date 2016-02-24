require "rails_helper"

describe "merchants" do
  describe "GET find" do
    it "returns the matching merchant by id" do
      merchant = create(:merchant)
      get "/api/v1/merchants/find?id=#{merchant.id}"
      merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_json["id"]).to eq merchant.id
      expect(merchant_json["name"]).to eq merchant.name
    end

    it "returns the matching merchant by name" do
      merchant = create(:merchant)
      get "/api/v1/merchants/find?name=#{merchant.name}"
      merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_json["id"]).to eq merchant.id
      expect(merchant_json["name"]).to eq merchant.name
    end

    it "returns the matching merchant by name case insensitively" do
      merchant = create(:merchant, name: "NAME1")
      get "/api/v1/merchants/find?name=Name1"
      merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_json["id"]).to eq merchant.id
      expect(merchant_json["name"]).to eq merchant.name
    end
  end
end
