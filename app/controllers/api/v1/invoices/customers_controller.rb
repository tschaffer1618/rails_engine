class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    render json: CustomerSerializer.new(Customer.find(invoice.customer_id))
  end
end
