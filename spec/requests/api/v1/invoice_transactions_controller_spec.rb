require "rails_helper"

describe "transactions" do
  describe "GET invoice" do
    it "returns the invoice for the specified transaction" do
      invoice = create(:invoice_with_transactions)
      transaction = invoice.transactions.first
      get "/api/v1/transactions/#{transaction.id}/invoice"
      transaction_invoice_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(transaction_invoice_json["id"]).to eq transaction.invoice_id
      expect(transaction_invoice_json["id"]).to eq transaction.invoice.id
      expect(transaction_invoice_json["status"]).to eq transaction.invoice.status
    end
  end
end
