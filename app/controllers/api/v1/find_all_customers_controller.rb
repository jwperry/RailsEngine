class Api::V1::FindAllCustomersController < ApplicationController
  respond_to :json

  def find_all
    @customer = Customer.where(find_all_params)
    respond_with @customer
  end

  private

  def find_all_params
    params.permit(:id, :first_name, :last_name)
  end

end
