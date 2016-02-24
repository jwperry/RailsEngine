class Api::V1::IndexInvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

end
