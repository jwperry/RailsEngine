class Api::V1::FindItemsController < ApplicationController
  respond_to :json

  def find
    @item = Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    @item = Item.find_by(description: params[:description]) if params[:description]
    @item = Item.find_by(name: params[:name]) if params[:name]
    @item = Item.find_by(id: params[:id]) if params[:id]
    respond_with @item
  end

end
