require "rails_helper"

describe "transactions" do
  describe "GET index" do
    it "returns all transactions" do
      create_list(:transaction, 2)
      transaction = Transaction.last
      get "/api/v1/transactions"
      transactions_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transactions_json.count).to eq 2
      expect(transactions_json.last["id"]).to eq transaction.id
      expect(transactions_json.last["credit_card_number"]).to eq transaction.credit_card_number
      expect(transactions_json.last["result"]).to eq transaction.result
    end
  end
end
