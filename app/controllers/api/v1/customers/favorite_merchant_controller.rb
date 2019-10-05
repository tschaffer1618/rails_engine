class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    customer = Customer.find(params)
    render json: MerchantSerializer.new(customer.favorite_merchant)
  end
end
