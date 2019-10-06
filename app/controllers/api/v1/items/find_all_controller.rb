class Api::V1::Items::FindAllController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.where(item_params).order(:id))
  end

  private

  def item_params
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round.to_i
    end
    params.permit(:id,:name,:description,:unit_price,:merchant_id,:created_at,:updated_at)
  end
end
