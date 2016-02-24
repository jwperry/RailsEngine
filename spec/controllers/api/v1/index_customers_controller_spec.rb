require "rails_helper"

RSpec.describe Api::V1::IndexCustomersController, type: :controller do
  describe "customers" do
    describe "GET index" do
      it "returns all customers" do
        create_list(:customer, 2)
        customer = Customer.last
        get :index, format: :json
        customers_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(customers_json.count).to eq 2
        expect(customers_json.last["first_name"]).to eq customer.first_name
        expect(customers_json.last["last_name"]).to eq customer.last_name
      end
    end
  end
end
