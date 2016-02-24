require "rails_helper"

describe "merchants" do
  describe "GET find_all" do
    it "returns all matching merchants by id" do
      merchant = create(:merchant)
      get "/api/v1/merchants/find_all?id=#{merchant.id}"
      merchant_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchant_json.first["id"]).to eq merchant.id
      expect(merchant_json.first["name"]).to eq merchant.name
    end

    it "returns all matching merchants by name" do
      merchant1 = create(:merchant, name: "merchant_dup_name")
      merchant2 = create(:merchant, name: "merchant_dup_name")
      get "/api/v1/merchants/find_all?name=#{merchant1.name}"
      merchants_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchants_json.count).to eq 2
      expect(merchants_json.first["id"]).to eq merchant1.id
      expect(merchants_json.first["name"]).to eq merchant1.name
      expect(merchants_json.last["id"]).to eq merchant2.id
      expect(merchants_json.last["name"]).to eq merchant2.name
    end

    it "returns all matching merchants by name case insensitively" do
      merchant1 = create(:merchant, name: "NAME1")
      merchant2 = create(:merchant, name: "name1")
      get "/api/v1/merchants/find_all?name=Name1"
      merchants_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(merchants_json.count).to eq 2
      expect(merchants_json.first["id"]).to eq merchant1.id
      expect(merchants_json.first["name"]).to eq merchant1.name
      expect(merchants_json.last["id"]).to eq merchant2.id
      expect(merchants_json.last["name"]).to eq merchant2.name
    end
  end
end
