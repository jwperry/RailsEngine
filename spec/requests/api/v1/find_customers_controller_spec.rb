require "rails_helper"

describe "customers" do
  describe "GET find" do
    it "returns the matching customer by id" do
      customer = create(:customer)
      get "/api/v1/customers/find?id=#{customer.id}"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json["id"]).to eq customer.id
      expect(customer_json["first_name"]).to eq customer.first_name
      expect(customer_json["last_name"]).to eq customer.last_name
    end

    it "returns the matching customer by first_name" do
      customer = create(:customer)
      get "/api/v1/customers/find?first_name=#{customer.first_name}"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json["id"]).to eq customer.id
      expect(customer_json["first_name"]).to eq customer.first_name
      expect(customer_json["last_name"]).to eq customer.last_name
    end

    it "returns the matching customer by last_name" do
      customer = create(:customer)
      get "/api/v1/customers/find?last_name=#{customer.last_name}"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json["id"]).to eq customer.id
      expect(customer_json["first_name"]).to eq customer.first_name
      expect(customer_json["last_name"]).to eq customer.last_name
    end

    it "returns the matching customer by first_name case insensitively" do
      customer = create(:customer, first_name: "FIRST_NAME1")
      get "/api/v1/customers/find?first_name=First_Name1"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json["id"]).to eq customer.id
      expect(customer_json["first_name"]).to eq customer.first_name
      expect(customer_json["last_name"]).to eq customer.last_name
    end

    it "returns the matching customer by last_name case insensitively" do
      customer = create(:customer, last_name: "LAST_NAME1")
      get "/api/v1/customers/find?last_name=Last_Name1"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json["id"]).to eq customer.id
      expect(customer_json["first_name"]).to eq customer.first_name
      expect(customer_json["last_name"]).to eq customer.last_name
    end
  end
end
