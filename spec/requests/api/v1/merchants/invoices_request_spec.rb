require 'rails_helper'

describe "Merchants API" do
  it "finds all the invoices associated with the merchant" do
    merchant = create(:merchant)

    create(:invoice, merchant: merchant)
    create_list(:invoice, 5)
    create(:invoice, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
