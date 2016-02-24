require "rails_helper"

RSpec.describe Api::V1::FindCustomersController, type: :controller do
  describe "customers" do
    describe "GET find" do
      it "returns the matching customer by id" do
        customer = create(:customer)
        get :find, id: customer.id, format: :json
        customer_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(customer_json["id"]).to eq customer.id
        expect(customer_json["first_name"]).to eq customer.first_name
        expect(customer_json["last_name"]).to eq customer.last_name
      end

      it "returns the matching customer by first_name" do
        customer = create(:customer)
        get :find, first_name: customer.first_name, format: :json
        customer_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(customer_json["id"]).to eq customer.id
        expect(customer_json["first_name"]).to eq customer.first_name
        expect(customer_json["last_name"]).to eq customer.last_name
      end

      it "returns the matching customer by last_name" do
        customer = create(:customer)
        get :find, last_name: customer.last_name, format: :json
        customer_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(customer_json["id"]).to eq customer.id
        expect(customer_json["first_name"]).to eq customer.first_name
        expect(customer_json["last_name"]).to eq customer.last_name
      end

      it "returns the matching customer by first_name case insensitively" do
        customer = create(:customer, first_name: "FIRST_NAME1")
        get :find, first_name: "first_name1", format: :json
        customer_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(customer_json["id"]).to eq customer.id
        expect(customer_json["first_name"].downcase).to eq customer.first_name.downcase
        expect(customer_json["last_name"].downcase).to eq customer.last_name.downcase
      end

      it "returns the matching customer by last_name case insensitively" do
        customer = create(:customer, last_name: "LAST_NAME1")
        get :find, last_name: "last_name1", format: :json
        customer_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(customer_json["id"]).to eq customer.id
        expect(customer_json["first_name"].downcase).to eq customer.first_name.downcase
        expect(customer_json["last_name"].downcase).to eq customer.last_name.downcase
      end
    end
  end
end
