require 'rails_helper'

describe "Customers API" do
  it "finds all the invoices associated with the customer" do
    customer = create(:customer)

    create(:invoice, customer: customer)
    create_list(:invoice, 5)
    create(:invoice, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
