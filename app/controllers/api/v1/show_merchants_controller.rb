class Api::V1::ShowMerchantsController < ApplicationController
  respond_to :json

  def show
    @merchant = Merchant.find(params[:id])
    respond_with @merchant
  end

end
