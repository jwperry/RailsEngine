class Api::V1::FindInvoiceItemsController < ApplicationController
  respond_to :json

  def find
    @invoice_item = InvoiceItem.find_by(quantity: params[:quantity]) if params[:quantity]
    @invoice_item = InvoiceItem.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    @invoice_item = InvoiceItem.find_by(id: params[:id]) if params[:id]
    respond_with @invoice_item
  end

end
