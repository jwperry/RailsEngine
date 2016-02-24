require "rails_helper"

describe "transactions" do
  describe "GET find_all" do
    it "returns all matching transactions by id" do
      transaction = create(:transaction)
      get "/api/v1/transactions/find_all?id=#{transaction.id}"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_json.first["id"]).to eq transaction.id
      expect(transaction_json.first["credit_card_number"]).to eq transaction.credit_card_number
      expect(transaction_json.first["result"]).to eq transaction.result
    end

    it "returns all matching transactions by credit_card_number" do
      transaction1 = create(:transaction, credit_card_number: "transaction_dup_credit_card_number")
      transaction2 = create(:transaction, credit_card_number: "transaction_dup_credit_card_number")
      get "/api/v1/transactions/find_all?credit_card_number=#{transaction1.credit_card_number}"
      transactions_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transactions_json.count).to eq 2
      expect(transactions_json.first["id"]).to eq transaction1.id
      expect(transactions_json.first["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transactions_json.first["result"]).to eq transaction1.result
      expect(transactions_json.last["id"]).to eq transaction2.id
      expect(transactions_json.last["credit_card_number"]).to eq transaction2.credit_card_number
      expect(transactions_json.last["result"]).to eq transaction2.result
    end

    it "returns all matching transactions by result" do
      transaction1 = create(:transaction, result: "transaction_dup_result")
      transaction2 = create(:transaction, result: "transaction_dup_result")
      get "/api/v1/transactions/find_all?result=#{transaction1.result}"
      transactions_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transactions_json.count).to eq 2
      expect(transactions_json.first["id"]).to eq transaction1.id
      expect(transactions_json.first["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transactions_json.first["result"]).to eq transaction1.result
      expect(transactions_json.last["id"]).to eq transaction2.id
      expect(transactions_json.last["credit_card_number"]).to eq transaction2.credit_card_number
      expect(transactions_json.last["result"]).to eq transaction2.result
    end

    it "returns all matching transactions by result case insensitively" do
      transaction1 = create(:transaction, result: "result1")
      transaction2 = create(:transaction, result: "RESULT1")
      get "/api/v1/transactions/find_all?result=Result1"
      transactions_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transactions_json.count).to eq 2
      expect(transactions_json.first["id"]).to eq transaction1.id
      expect(transactions_json.first["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transactions_json.first["result"]).to eq transaction1.result
      expect(transactions_json.last["id"]).to eq transaction2.id
      expect(transactions_json.last["credit_card_number"]).to eq transaction2.credit_card_number
      expect(transactions_json.last["result"]).to eq transaction2.result
    end
  end
end
