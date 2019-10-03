require 'rails_helper'

describe "Merchants API" do
  it "finds all the items associated with the merchant" do
    merchant = create(:merchant)

    create(:item, merchant: merchant)
    create_list(:item, 5)
    create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
