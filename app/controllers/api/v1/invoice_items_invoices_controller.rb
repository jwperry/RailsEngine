class Api::V1::InvoiceItemsInvoicesController < ApplicationController
  respond_to :json

  def invoice_items
    @invoice = Invoice.find_by(id: params[:id])
    @invoice_invoice_items = @invoice.invoice_items
    respond_with @invoice_invoice_items
  end

end
