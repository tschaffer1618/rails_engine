require 'rails_helper'

describe "Invoice_items API" do
  it "provides data for the associated invoice of an invoice_item" do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{invoice.id}"
    expect(data["data"]["type"]).to eq "invoice"
    expect(data["data"]["attributes"]["id"]).to eq invoice.id
    expect(data["data"]["attributes"]["status"]).to eq invoice.status
  end
end
