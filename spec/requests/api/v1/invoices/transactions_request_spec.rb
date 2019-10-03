require 'rails_helper'

describe "Invoices API" do
  it "finds all the transactions associated with the invoice" do
    invoice = create(:invoice)

    create(:transaction, invoice: invoice)
    create_list(:transaction, 5)
    create(:transaction, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
