class Api::V1::ItemsMerchantsController < ApplicationController
  respond_to :json

  def items
    @merchant = Merchant.find_by(id: params[:id])
    @merchant_items = @merchant.items
    respond_with @merchant_items
  end

end
