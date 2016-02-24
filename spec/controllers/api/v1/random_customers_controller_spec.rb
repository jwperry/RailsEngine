require "rails_helper"

RSpec.describe Api::V1::RandomCustomersController, type: :controller do
  describe "customers" do
    describe "GET random" do
      it "returns a random customer" do
        customer1, customer2 = create_list(:customer, 2)
        get :random, format: :json
        customer_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect([customer1.id, customer2.id]).to include customer_json["id"]
        expect([customer1.first_name, customer2.first_name]).to include customer_json["first_name"]
        expect([customer1.last_name, customer2.last_name]).to include customer_json["last_name"]
      end
    end
  end
end
