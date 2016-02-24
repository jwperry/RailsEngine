class Api::V1::RandomTransactionsController < ApplicationController
  respond_to :json

  def random
    offset = rand(Transaction.count)
    @transaction = Transaction.offset(offset).first
    respond_with @transaction
  end

end
