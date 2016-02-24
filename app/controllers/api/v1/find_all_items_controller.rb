class Api::V1::FindAllItemsController < ApplicationController
  respond_to :json

  def find_all
    @items = Item.where(find_all_params)
    respond_with @items
  end

  private

  def find_all_params
    params.permit(:id, :name, :description, :unit_price)
  end

end
