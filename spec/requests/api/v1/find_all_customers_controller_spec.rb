require "rails_helper"

describe "customers" do
  describe "GET find_all" do
    it "returns all matching customers by id" do
      customer = create(:customer)
      get "/api/v1/customers/find_all?id=#{customer.id}"
      customer_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customer_json.first["id"]).to eq customer.id
      expect(customer_json.first["first_name"]).to eq customer.first_name
      expect(customer_json.first["last_name"]).to eq customer.last_name
    end

    it "returns all matching customers by first_name" do
      customer1 = create(:customer, first_name: "customer_dup_first_name")
      customer2 = create(:customer, first_name: "customer_dup_first_name")
      get "/api/v1/customers/find_all?first_name=#{customer1.first_name}"
      customers_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customers_json.count).to eq 2
      expect(customers_json.first["id"]).to eq customer1.id
      expect(customers_json.first["first_name"]).to eq customer1.first_name
      expect(customers_json.first["last_name"]).to eq customer1.last_name
      expect(customers_json.last["id"]).to eq customer2.id
      expect(customers_json.last["first_name"]).to eq customer2.first_name
      expect(customers_json.last["last_name"]).to eq customer2.last_name
    end

    it "returns all matching customers by last_name" do
      customer1 = create(:customer, last_name: "customer_dup_last_name")
      customer2 = create(:customer, last_name: "customer_dup_last_name")
      get "/api/v1/customers/find_all?last_name=#{customer1.last_name}"
      customers_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customers_json.count).to eq 2
      expect(customers_json.first["id"]).to eq customer1.id
      expect(customers_json.first["first_name"]).to eq customer1.first_name
      expect(customers_json.first["last_name"]).to eq customer1.last_name
      expect(customers_json.last["id"]).to eq customer2.id
      expect(customers_json.last["first_name"]).to eq customer2.first_name
      expect(customers_json.last["last_name"]).to eq customer2.last_name
    end

    it "returns all matching customers by first_name case insensitively" do
      customer1 = create(:customer, first_name: "FIRST_NAME1")
      customer2 = create(:customer, first_name: "first_name1")
      get "/api/v1/customers/find_all?first_name=First_Name1"
      customers_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customers_json.count).to eq 2
      expect(customers_json.first["id"]).to eq customer1.id
      expect(customers_json.first["first_name"]).to eq customer1.first_name
      expect(customers_json.first["last_name"]).to eq customer1.last_name
      expect(customers_json.last["id"]).to eq customer2.id
      expect(customers_json.last["first_name"]).to eq customer2.first_name
      expect(customers_json.last["last_name"]).to eq customer2.last_name
    end

    it "returns all matching customers by last_name case insensitively" do
      customer1 = create(:customer, last_name: "LAST_NAME1")
      customer2 = create(:customer, last_name: "last_name1")
      get "/api/v1/customers/find_all?last_name=Last_Name1"
      customers_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(customers_json.count).to eq 2
      expect(customers_json.first["id"]).to eq customer1.id
      expect(customers_json.first["first_name"]).to eq customer1.first_name
      expect(customers_json.first["last_name"]).to eq customer1.last_name
      expect(customers_json.last["id"]).to eq customer2.id
      expect(customers_json.last["first_name"]).to eq customer2.first_name
      expect(customers_json.last["last_name"]).to eq customer2.last_name
    end
  end
end
