class Api::V1::ShowItemsController < ApplicationController
  respond_to :json

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end

end
