class Api::V1::FindAllInvoicesController < ApplicationController
  respond_to :json

  def find_all
    @invoices = Invoice.where(find_all_params)
    respond_with @invoices
  end

  private

  def find_all_params
    params.permit(:id, :status, :created_at, :updated_at, :customer_id, :merchant_id)
  end

end
