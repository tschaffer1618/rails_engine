require 'rails_helper'

describe "Invoice_items API" do
  it "provides an invoice_item index" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{invoice_item.id}"
    expect(data["data"]["type"]).to eq "invoice_item"
    expect(data["data"]["attributes"]["id"]).to eq invoice_item.id
    expect(data["data"]["attributes"]["item_id"]).to eq invoice_item.item_id
    expect(data["data"]["attributes"]["invoice_id"]).to eq invoice_item.invoice_id
    expect(data["data"]["attributes"]["quantity"]).to eq invoice_item.quantity
    expect(data["data"]["attributes"]["unit_price"]).to eq invoice_item.unit_price
    expect(data["data"]["attributes"]["created_at"]).to eq invoice_item.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq invoice_item.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  end
end
