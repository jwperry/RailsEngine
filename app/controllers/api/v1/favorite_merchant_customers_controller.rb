class Api::V1::FavoriteMerchantCustomersController < ApplicationController
  respond_to :json

  def favorite_merchant
    @customer = Customer.find_by(id: params[:id])
    @favorite_merchant = @customer.favorite_merchant
    respond_with @favorite_merchant
  end

end
