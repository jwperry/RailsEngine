class Api::V1::InvoicesCustomersController < ApplicationController
  respond_to :json

  def invoices
    @customer = Customer.find_by(id: params[:id])
    @customer_invoices = @customer.invoices
    respond_with @customer_invoices
  end

end
