class Api::V1::FindAllCustomersController < ApplicationController
  respond_to :json

  def find_all
    @customers = Customer.where(find_all_params)
    respond_with @customers
  end

  private

  def find_all_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
