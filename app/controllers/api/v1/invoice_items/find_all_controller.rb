class Api::V1::InvoiceItems::FindAllController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params).order(:id))
  end

  private

  def invoice_item_params
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round.to_i
    end
    params.permit(:id,:item_id,:invoice_id,:quantity,:unit_price,:created_at,:updated_at)
  end
end
