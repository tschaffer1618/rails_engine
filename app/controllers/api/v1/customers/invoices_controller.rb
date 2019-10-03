class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    render json: InvoiceSerializer.new(Invoice.where(customer_id: customer.id))
  end
end
