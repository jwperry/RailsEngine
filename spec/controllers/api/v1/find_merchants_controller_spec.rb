require "rails_helper"

RSpec.describe Api::V1::FindMerchantsController, type: :controller do
  describe "merchants" do
    describe "GET find" do
      it "returns the matching merchant by id" do
        merchant = create(:merchant)
        get :find, id: merchant.id, format: :json
        merchant_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(merchant_json["id"]).to eq merchant.id
        expect(merchant_json["name"]).to eq merchant.name
      end

      it "returns the matching merchant by name" do
        merchant = create(:merchant)
        get :find, name: merchant.name, format: :json
        merchant_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(merchant_json["id"]).to eq merchant.id
        expect(merchant_json["name"]).to eq merchant.name
      end

      it "returns the matching merchant by name case insensitively" do
        merchant = create(:merchant, name: "NAME1")
        get :find, name: "name1", format: :json
        merchant_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(merchant_json["id"]).to eq merchant.id
        expect(merchant_json["name"]).to eq merchant.name
      end
    end
  end
end
