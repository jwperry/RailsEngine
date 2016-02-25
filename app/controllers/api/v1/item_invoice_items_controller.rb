class Api::V1::ItemInvoiceItemsController < ApplicationController
  respond_to :json

  def item
    @invoice_item = InvoiceItem.find_by(id: params[:id])
    @item = @invoice_item.item
    respond_with @item
  end

end
