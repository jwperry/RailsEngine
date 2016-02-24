class Api::V1::FindAllMerchantsController < ApplicationController
  respond_to :json

  def find_all
    @merchants = Merchant.where(find_all_params)
    respond_with @merchants
  end

  private

  def find_all_params
    params.permit(:id, :name)
  end

end
