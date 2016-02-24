require "rails_helper"

describe "transactions" do
  describe "GET random" do
    it "returns a random transaction" do
      transaction1, transaction2 = create_list(:transaction, 2)
      get "/api/v1/transactions/random"
      transaction_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect([transaction1.id, transaction2.id]).to include transaction_json["id"]
      expect([transaction1.credit_card_number, transaction2.credit_card_number]).to include transaction_json["credit_card_number"]
      expect([transaction1.result, transaction2.result]).to include transaction_json["result"]
    end
  end
end
