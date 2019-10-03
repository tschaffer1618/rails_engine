class Api::V1::Merchants::FindAllController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.where(merchant_params))
  end

  private

  def merchant_params
    params.permit(:id,:name,:created_at,:updated_at)
  end
end
