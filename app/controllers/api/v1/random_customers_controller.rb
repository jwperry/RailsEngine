class Api::V1::RandomCustomersController < ApplicationController
  respond_to :json

  def random
    offset = rand(Customer.count)
    @customer = Customer.offset(offset).first
    respond_with @customer
  end

end
