class Api::V1::RandomInvoicesController < ApplicationController
  respond_to :json

  def random
    offset = rand(Invoice.count)
    @invoice = Invoice.offset(offset).first
    respond_with @invoice
  end

end
