class Api::V1::Invoices::FindController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(invoice_params))
  end

  private

  def invoice_params
    params.permit(:id,:customer_id,:merchant_id,:status,:created_at,:updated_at)
  end
end
