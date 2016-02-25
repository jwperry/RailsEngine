require "rails_helper"

describe "customers" do
  describe "GET transactions" do
    it "returns all transactions for the specified customer" do
      customer = create(:customer_with_invoices)
      get "/api/v1/customers/#{customer.id}/transactions"
      customer_transactions_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      transaction_count = customer.invoices.map { |invoice| invoice.transactions.count }
      transaction_count = transaction_count.reduce(:+)
      expect(customer_transactions_json.count).to eq transaction_count
      expect(customer_transactions_json.first["id"]).to eq customer.invoices.first.transactions.first.id
      expect(customer_transactions_json.first["credit_card_number"]).to eq customer.invoices.first.transactions.first.credit_card_number
      expect(customer_transactions_json.first["result"]).to eq customer.invoices.first.transactions.first.result
    end
  end
end
