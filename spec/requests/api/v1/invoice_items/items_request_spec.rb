require 'rails_helper'

describe "Invoice_items API" do
  it "provides data for the associated item of an invoice_item" do
    item = create(:item)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{item.id}"
    expect(data["data"]["type"]).to eq "item"
    expect(data["data"]["attributes"]["id"]).to eq item.id
    expect(data["data"]["attributes"]["name"]).to eq item.name
    expect(data["data"]["attributes"]["description"]).to eq item.description
    expect(data["data"]["attributes"]["unit_price"]).to eq (item.unit_price.to_f / 100).to_s
  end
end
