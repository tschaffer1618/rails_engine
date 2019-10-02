require 'rails_helper'

describe "Customers API" do
  it "provides a customer index" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end
end
