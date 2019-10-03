class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    selected_invoice_items = InvoiceItem.where(invoice_id: invoice.id).pluck(:item_id)
    render json: ItemSerializer.new(Item.where(id: selected_invoice_items))
  end
end
