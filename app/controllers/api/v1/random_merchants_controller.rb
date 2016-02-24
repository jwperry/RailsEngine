class Api::V1::RandomMerchantsController < ApplicationController
  respond_to :json

  def random
    offset = rand(Merchant.count)
    @merchant = Merchant.offset(offset).first
    respond_with @merchant
  end

end
