class Api::V1::ShowInvoiceItemsController < ApplicationController
  respond_to :json

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    respond_with @invoice_item
  end

end
