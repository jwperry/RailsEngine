class Api::V1::RandomItemsController < ApplicationController
  respond_to :json

  def random
    offset = rand(Item.count)
    @item = Item.offset(offset).first
    respond_with @item
  end

end
