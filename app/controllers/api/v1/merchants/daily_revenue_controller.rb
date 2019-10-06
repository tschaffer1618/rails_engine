class Api::V1::Merchants::DailyRevenueController < ApplicationController

  def show
    date = params[:date]
    revenue = 
    render json: RevenueSerializer.new(Merchant.total_daily_revenue(date))
  end
end
