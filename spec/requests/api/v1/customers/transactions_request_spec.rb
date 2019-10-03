require 'rails_helper'

describe "Customers API" do
  it "finds all the transactions associated with the customer" do
    customer = create(:customer)

    invoice_1 = create(:invoice, customer: customer)
    invoice_2 = create(:invoice, customer: customer)
    invoice_3 = create(:invoice)

    create(:transaction, invoice: invoice_1)
    create(:transaction, invoice: invoice_2)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
