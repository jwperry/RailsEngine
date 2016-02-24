class Api::V1::FindAllMerchantsController < ApplicationController
  respond_to :json

  def find_all
    @merchant = Merchant.where(find_all_params)
    respond_with @merchant
  end

  private

  def find_all_params
    params.permit(:id, :name)
  end

end
