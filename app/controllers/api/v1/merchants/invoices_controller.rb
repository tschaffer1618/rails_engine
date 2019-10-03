class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    render json: InvoiceSerializer.new(Invoice.where(merchant_id: merchant.id))
  end
end
