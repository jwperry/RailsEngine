class Api::V1::RandomInvoiceItemsController < ApplicationController
  respond_to :json

  def random
    offset = rand(InvoiceItem.count)
    @invoice_item = InvoiceItem.offset(offset).first
    respond_with @invoice_item
  end

end
