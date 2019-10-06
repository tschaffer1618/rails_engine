class Api::V1::Invoices::FindAllController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.where(invoice_params).order(:id))
  end

  private

  def invoice_params
    params.permit(:id,:customer_id,:merchant_id,:status,:created_at,:updated_at)
  end
end
