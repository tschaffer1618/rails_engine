class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_id: invoice.id))
  end
end
