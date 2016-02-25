class Api::V1::InvoiceInvoiceItemsController < ApplicationController
  respond_to :json

  def invoice
    @invoice_item = InvoiceItem.find_by(id: params[:id])
    @invoice = @invoice_item.invoice
    respond_with @invoice
  end

end
