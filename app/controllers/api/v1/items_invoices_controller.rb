class Api::V1::ItemsInvoicesController < ApplicationController
  respond_to :json

  def items
    @invoice = Invoice.find_by(id: params[:id])
    @items = @invoice.items
    respond_with @items
  end

end
