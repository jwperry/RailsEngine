require "rails_helper"

RSpec.describe Api::V1::IndexMerchantsController, type: :controller do
  describe "merchants" do
    describe "GET index" do
      it "returns all merchants" do
        create_list(:merchant, 2)
        merchant = Merchant.last
        get :index, format: :json
        merchants_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(merchants_json.count).to eq 2
        expect(merchants_json.last["id"]).to eq merchant.id
        expect(merchants_json.last["name"]).to eq merchant.name
      end
    end
  end
end
