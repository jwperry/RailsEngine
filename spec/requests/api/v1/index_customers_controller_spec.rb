require "rails_helper"

describe "customers" do
  describe "GET index" do
    it "returns all customers" do
      create_list(:customer, 2)
      customer = Customer.last
      get "/api/v1/customers"
      customers_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customers_json.count).to eq 2
      expect(customers_json.last["id"]).to eq customer.id
      expect(customers_json.last["first_name"]).to eq customer.first_name
      expect(customers_json.last["last_name"]).to eq customer.last_name
    end
  end
end
