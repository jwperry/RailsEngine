require "rails_helper"

describe "transactions" do
  describe "GET find" do
    it "returns the matching transaction by id" do
      transaction = create(:transaction)
      get "/api/v1/transactions/find?id=#{transaction.id}"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_json["id"]).to eq transaction.id
      expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
      expect(transaction_json["result"]).to eq transaction.result
    end

    it "returns the matching transaction by credit_card_number" do
      transaction = create(:transaction)
      get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_json["id"]).to eq transaction.id
      expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
      expect(transaction_json["result"]).to eq transaction.result
    end

    it "returns the matching transaction by result" do
      transaction = create(:transaction)
      get "/api/v1/transactions/find?result=#{transaction.result}"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_json["id"]).to eq transaction.id
      expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
      expect(transaction_json["result"]).to eq transaction.result
    end

    it "returns the matching transaction by result case insensitively" do
      transaction = create(:transaction, result: "result1")
      get "/api/v1/transactions/find?result=RESULT1"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_json["id"]).to eq transaction.id
      expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
      expect(transaction_json["result"]).to eq transaction.result
    end
  end
end
