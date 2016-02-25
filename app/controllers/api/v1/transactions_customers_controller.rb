class Api::V1::TransactionsCustomersController < ApplicationController
  respond_to :json

  def transactions
    customer = Customer.find_by(id: params[:id])
    customer_invoices = customer.invoices
    @customer_transactions = customer_invoices.map { |invoice| invoice.transactions }
    @customer_transactions = @customer_transactions.flatten
    respond_with @customer_transactions
  end

end
