class Api::V1::FindItemsController < ApplicationController
  respond_to :json

  def find
    @item = Item.find_by(created_at: params[:created_at]) if params[:created_at]
    @item = Item.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    @item = Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    @item = Item.find_by(description: params[:description]) if params[:description]
    @item = Item.find_by(name: params[:name]) if params[:name]
    @item = Item.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    @item = Item.find_by(id: params[:id]) if params[:id]
    respond_with @item
  end

end
