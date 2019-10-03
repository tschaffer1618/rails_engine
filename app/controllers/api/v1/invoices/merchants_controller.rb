class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    render json: MerchantSerializer.new(Merchant.find(invoice.merchant_id))
  end
end
