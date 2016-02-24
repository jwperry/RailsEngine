class Api::V1::FindAllInvoiceItemsController < ApplicationController
  respond_to :json

  def find_all
    @invoice_items = InvoiceItem.where(find_all_params)
    respond_with @invoice_items
  end

  private

  def find_all_params
    params.permit(:id, :quantity, :unit_price, :created_at, :updated_at, :item_id, :invoice_id)
  end

end
