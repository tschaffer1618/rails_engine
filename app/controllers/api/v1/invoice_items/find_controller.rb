class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.order(:id).find_by(invoice_item_params))
  end

  private

  def invoice_item_params
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round.to_i
    end
    params.permit(:id,:item_id,:invoice_id,:quantity,:unit_price,:created_at,:updated_at)
  end

end
