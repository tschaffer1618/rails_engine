class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    quantity = params[:quantity]
    render json: MerchantSerializer.new(Merchant.most_revenue(quantity))
  end
end
