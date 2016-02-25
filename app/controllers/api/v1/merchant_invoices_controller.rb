class Api::V1::MerchantInvoicesController < ApplicationController
  respond_to :json

  def merchant
    @invoice = Invoice.find_by(id: params[:id])
    @invoice_merchant = @invoice.merchant
    respond_with @invoice_merchant
  end

end
