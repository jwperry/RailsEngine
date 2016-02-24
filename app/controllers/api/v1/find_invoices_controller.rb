class Api::V1::FindInvoicesController < ApplicationController
  respond_to :json

  def find
    @invoice = Invoice.find_by(created_at: params[:created_at]) if params[:created_at]
    @invoice = Invoice.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    @invoice = Invoice.find_by(status: params[:status]) if params[:status]
    @invoice = Invoice.find_by(customer_id: params[:customer_id]) if params[:customer_id]
    @invoice = Invoice.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    @invoice = Invoice.find_by(id: params[:id]) if params[:id]
    respond_with @invoice
  end

end
