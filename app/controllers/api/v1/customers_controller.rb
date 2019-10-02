class Api::V1::CustomersController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.all)
  end

  def show
    if params[:id] == "find"
      values = request.fullpath.split("?")[1].split("=")
      if values[0] == "id"
        customer = Customer.find_by(id: values[1].to_i)
      elsif values[0] == "first_name"
        customer = Customer.find_by(first_name: values[1])
      elsif values[0] == "last_name"
        customer = Customer.find_by(last_name: values[1])
      elsif values[0] == "created_at"
        customer = Customer.find_by(created_at: values[1])
      elsif values[0] == "updated_at"
        customer = Customer.find_by(updated_at: values[1])
      end
      render json: CustomerSerializer.new(customer)
    else
      render json: CustomerSerializer.new(Customer.find(params[:id]))
    end
  end

end
