require 'rails_helper'

describe "Invoices API" do
  it "provides an invoice index" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single customer" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{invoice.id}"
    expect(data["data"]["type"]).to eq "invoice"
    expect(data["data"]["attributes"]["id"]).to eq invoice.id
    expect(data["data"]["attributes"]["status"]).to eq invoice.status
    expect(data["data"]["attributes"]["created_at"]).to eq invoice.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq invoice.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  end
end
