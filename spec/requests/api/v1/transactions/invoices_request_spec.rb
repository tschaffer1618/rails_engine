require 'rails_helper'

describe "Transactions API" do
  it "provides data for the associated invoice of a transaction" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{invoice.id}"
    expect(data["data"]["type"]).to eq "invoice"
    expect(data["data"]["attributes"]["id"]).to eq invoice.id
    expect(data["data"]["attributes"]["status"]).to eq invoice.status
  end
end
