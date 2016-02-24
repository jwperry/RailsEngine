class Api::V1::FindInvoicesController < ApplicationController
  respond_to :json

  def find
    @invoice = Invoice.find_by(status: params[:status]) if params[:status]
    @invoice = Invoice.find_by(id: params[:id]) if params[:id]
    respond_with @invoice
  end

end
