class Api::V1::FindTransactionsController < ApplicationController
  respond_to :json

  def find
    @transaction = Transaction.find_by(created_at: params[:created_at]) if params[:created_at]
    @transaction = Transaction.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    @transaction = Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    @transaction = Transaction.find_by(result: params[:result]) if params[:result]
    @transaction = Transaction.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    @transaction = Transaction.find_by(id: params[:id]) if params[:id]
    respond_with @transaction
  end

end
