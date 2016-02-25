class Api::V1::TransactionsInvoicesController < ApplicationController
  respond_to :json

  def transactions
    @invoice = Invoice.find_by(id: params[:id])
    @invoice_transactions = @invoice.transactions
    respond_with @invoice_transactions
  end

end
