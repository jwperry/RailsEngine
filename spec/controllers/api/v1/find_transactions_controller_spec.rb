require "rails_helper"

RSpec.describe Api::V1::FindTransactionsController, type: :controller do
  describe "transactions" do
    describe "GET find" do
      it "returns the matching transaction by id" do
        transaction = create(:transaction)
        get :find, id: transaction.id, format: :json
        transaction_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(transaction_json["id"]).to eq transaction.id
        expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
        expect(transaction_json["result"]).to eq transaction.result
      end

      it "returns the matching transaction by credit_card_number" do
        transaction = create(:transaction)
        get :find, credit_card_number: transaction.credit_card_number, format: :json
        transaction_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(transaction_json["id"]).to eq transaction.id
        expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
        expect(transaction_json["result"]).to eq transaction.result
      end

      it "returns the matching transaction by result" do
        transaction = create(:transaction)
        get :find, result: transaction.result, format: :json
        transaction_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(transaction_json["id"]).to eq transaction.id
        expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
        expect(transaction_json["result"]).to eq transaction.result
      end

      it "returns the matching transaction by result case insensitively" do
        transaction = create(:transaction, result: "result1")
        get :find, result: "RESULT1", format: :json
        transaction_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(transaction_json["id"]).to eq transaction.id
        expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
        expect(transaction_json["result"]).to eq transaction.result
      end
    end
  end
end
