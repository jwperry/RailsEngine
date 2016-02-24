class Api::V1::ShowInvoicesController < ApplicationController
  respond_to :json

  def show
    @invoice = Invoice.find(params[:id])
    respond_with @invoice
  end

end
