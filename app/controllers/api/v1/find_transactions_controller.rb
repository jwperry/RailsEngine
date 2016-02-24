class Api::V1::FindTransactionsController < ApplicationController
  respond_to :json

  def find
    @transaction = Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    @transaction = Transaction.find_by(result: params[:result]) if params[:result]
    @transaction = Transaction.find_by(id: params[:id]) if params[:id]
    respond_with @transaction
  end

end
