class Api::V1::FindCustomersController < ApplicationController
  respond_to :json

  def find
    @customer = Customer.find_by(created_at: params[:created_at]) if params[:created_at]
    @customer = Customer.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    @customer = Customer.find_by(first_name: params[:first_name]) if params[:first_name]
    @customer = Customer.find_by(last_name: params[:last_name]) if params[:last_name]
    @customer = Customer.find_by(id: params[:id]) if params[:id]
    respond_with @customer
  end

end
