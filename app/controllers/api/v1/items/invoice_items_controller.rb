class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    item = Item.find(params[:id])
    render json: InvoiceItemSerializer.new(InvoiceItem.where(item_id: item.id))
  end
end
