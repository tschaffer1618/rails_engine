require 'rails_helper'

describe "Invoice_items API" do
  it "provides data for a random invoice_item" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/random"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["type"]).to eq "invoice_item"
  end
end
