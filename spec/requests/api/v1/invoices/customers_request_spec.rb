require 'rails_helper'

describe "Invoices API" do
  it "provides data for the associated customer of an invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{customer.id}"
    expect(data["data"]["type"]).to eq "customer"
    expect(data["data"]["attributes"]["id"]).to eq customer.id
    expect(data["data"]["attributes"]["first_name"]).to eq customer.first_name
    expect(data["data"]["attributes"]["last_name"]).to eq customer.last_name
  end
end
