class Api::V1::IndexTransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

end
