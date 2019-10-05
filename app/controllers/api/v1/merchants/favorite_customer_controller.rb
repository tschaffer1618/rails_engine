class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def show
    merchant = Merchant.find(params)
    render json: CustomerSerializer.new(merchant.favorite_customer)
  end
end
