class Api::V1::Items::MerchantsController < ApplicationController

  def show
    item = Item.find(params[:id])
    render json: MerchantSerializer.new(Merchant.find(item.merchant_id))
  end
end
