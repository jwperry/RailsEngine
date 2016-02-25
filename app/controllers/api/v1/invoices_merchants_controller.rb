class Api::V1::InvoicesMerchantsController < ApplicationController
  respond_to :json

  def invoices
    @merchant = Merchant.find_by(id: params[:id])
    @merchant_invoices = @merchant.invoices
    respond_with @merchant_invoices
  end

end
