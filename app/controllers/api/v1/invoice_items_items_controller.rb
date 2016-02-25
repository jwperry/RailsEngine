class Api::V1::InvoiceItemsItemsController < ApplicationController
  respond_to :json

  def invoice_items
    @item = Item.find_by(id: params[:id])
    @item_invoice_items = @item.invoice_items
    respond_with @item_invoice_items
  end

end
