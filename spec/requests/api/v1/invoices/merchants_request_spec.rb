require 'rails_helper'

describe "Invoices API" do
  it "provides data for the associated merchant of an invoice" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{merchant.id}"
    expect(data["data"]["type"]).to eq "merchant"
    expect(data["data"]["attributes"]["id"]).to eq merchant.id
    expect(data["data"]["attributes"]["name"]).to eq merchant.name
  end
end
