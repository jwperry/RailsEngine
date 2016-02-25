class Api::V1::MerchantItemsController < ApplicationController
  respond_to :json

  def merchant
    @item = Item.find_by(id: params[:id])
    @item_merchant = @item.merchant
    respond_with @item_merchant
  end

end
