class Api::V1::FindMerchantsController < ApplicationController
  respond_to :json

  def find
    @merchant = Merchant.find_by(name: params[:name]) if params[:name]
    @merchant = Merchant.find_by(id: params[:id]) if params[:id]
    respond_with @merchant
  end

end
