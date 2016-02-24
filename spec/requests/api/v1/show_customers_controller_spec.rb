require "rails_helper"

describe "customers" do
  describe "GET show" do
    it "returns the specified customer" do
      customer = create(:customer)
      get "/api/v1/customers/#{customer.id}"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json["id"]).to eq customer.id
      expect(customer_json["first_name"]).to eq customer.first_name
      expect(customer_json["last_name"]).to eq customer.last_name
    end
  end
end
