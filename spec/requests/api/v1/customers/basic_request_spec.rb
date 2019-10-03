require 'rails_helper'

describe "Customers API" do
  it "provides a customer index" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single customer" do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{customer.id}"
    expect(data["data"]["type"]).to eq "customer"
    expect(data["data"]["attributes"]["id"]).to eq customer.id
    expect(data["data"]["attributes"]["first_name"]).to eq customer.first_name
    expect(data["data"]["attributes"]["last_name"]).to eq customer.last_name
    expect(data["data"]["attributes"]["created_at"]).to eq customer.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq customer.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  end
end
