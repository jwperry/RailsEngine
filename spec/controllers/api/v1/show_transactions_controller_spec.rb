require "rails_helper"

RSpec.describe Api::V1::ShowTransactionsController, type: :controller do
  describe "transactions" do
    describe "GET show" do
      it "returns the specified transaction" do
        transaction = create(:transaction)
        get :show, id: transaction.id, format: :json
        transaction_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(transaction_json["id"]).to eq transaction.id
        expect(transaction_json["credit_card_number"]).to eq transaction.credit_card_number
        expect(transaction_json["result"]).to eq transaction.result
      end
    end
  end
end
