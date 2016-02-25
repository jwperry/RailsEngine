require "rails_helper"

describe "invoices" do
  describe "GET transactions" do
    it "returns all transactions for the specified invoice" do
      invoice = create(:invoice_with_transactions)
      get "/api/v1/invoices/#{invoice.id}/transactions"
      invoice_transactions_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(invoice_transactions_json.count).to eq invoice.transactions.count
      expect(invoice_transactions_json.first["id"]).to eq invoice.transactions.first.id
      expect(invoice_transactions_json.first["credit_card_number"]).to eq invoice.transactions.first.credit_card_number
      expect(invoice_transactions_json.first["result"]).to eq invoice.transactions.first.result
    end
  end
end
