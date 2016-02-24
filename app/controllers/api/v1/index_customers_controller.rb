class Api::V1::IndexCustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

end
