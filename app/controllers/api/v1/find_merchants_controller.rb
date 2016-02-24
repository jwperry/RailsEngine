class Api::V1::FindMerchantsController < ApplicationController
  respond_to :json

  def find
    @merchant = Merchant.find_by(created_at: params[:created_at]) if params[:created_at]
    @merchant = Merchant.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    @merchant = Merchant.find_by(name: params[:name]) if params[:name]
    @merchant = Merchant.find_by(id: params[:id]) if params[:id]
    respond_with @merchant
  end

end
