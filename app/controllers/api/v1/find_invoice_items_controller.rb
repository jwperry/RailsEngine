class Api::V1::FindInvoiceItemsController < ApplicationController
  respond_to :json

  def find
    @invoice_item = InvoiceItem.find_by(created_at: params[:created_at]) if params[:created_at]
    @invoice_item = InvoiceItem.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    @invoice_item = InvoiceItem.find_by(quantity: params[:quantity]) if params[:quantity]
    @invoice_item = InvoiceItem.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    @invoice_item = InvoiceItem.find_by(item_id: params[:item_id]) if params[:item_id]
    @invoice_item = InvoiceItem.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    @invoice_item = InvoiceItem.find_by(id: params[:id]) if params[:id]
    respond_with @invoice_item
  end

end
