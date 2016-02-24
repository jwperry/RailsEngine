require "rails_helper"

describe "transactions" do
  describe "GET show" do
    it "returns the specified transaction" do
      transaction = create(:transaction)
      get "/api/v1/transactions/#{transaction.id}"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_json["id"]).to eq transaction.id
      expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
      expect(transaction_json["result"]).to eq transaction.result
    end
  end
end
