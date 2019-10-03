require 'rails_helper'

describe "Customers API" do
  it "provides data for a random customer" do
    create_list(:customer, 3)

    get "/api/v1/customers/random"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["type"]).to eq "customer"
  end
end
