class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    selected_invoices = Invoice.where(customer_id: customer.id).pluck(:id)
    render json: TransactionSerializer.new(Transaction.where(invoice_id: selected_invoices))
  end
end
