require "rails_helper"

RSpec.describe Api::V1::IndexTransactionsController, type: :controller do
  describe "transactions" do
    describe "GET index" do
      it "returns all transactions" do
        create_list(:transaction, 2)
        transaction = Transaction.last
        get :index, format: :json
        transactions_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(transactions_json.count).to eq 2
        expect(transactions_json.last["credit_card_number"]).to eq transaction.credit_card_number
        expect(transactions_json.last["result"]).to eq transaction.result
      end
    end
  end
end
