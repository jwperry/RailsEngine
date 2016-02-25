class Api::V1::InvoiceTransactionsController < ApplicationController
  respond_to :json

  def invoice
    @transaction = Transaction.find_by(id: params[:id])
    @transaction_invoice = @transaction.invoice
    respond_with @transaction_invoice
  end

end
