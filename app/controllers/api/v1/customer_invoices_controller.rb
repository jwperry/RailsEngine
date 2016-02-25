class Api::V1::CustomerInvoicesController < ApplicationController
  respond_to :json

  def customer
    @invoice = Invoice.find_by(id: params[:id])
    @invoice_customer = @invoice.customer
    respond_with @invoice_customer
  end

end
