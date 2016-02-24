class Api::V1::IndexMerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

end
