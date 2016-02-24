class Api::V1::FindAllTransactionsController < ApplicationController
  respond_to :json

  def find_all
    @transactions = Transaction.where(find_all_params)
    respond_with @transactions
  end

  private

  def find_all_params
    params.permit(:credit_card_number, :result)
  end

end
