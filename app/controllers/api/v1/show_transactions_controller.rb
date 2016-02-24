class Api::V1::ShowTransactionsController < ApplicationController
  respond_to :json

  def show
    @transaction = Transaction.find(params[:id])
    respond_with @transaction
  end

end
