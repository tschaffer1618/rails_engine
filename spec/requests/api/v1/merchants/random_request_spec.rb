require 'rails_helper'

describe "Merchants API" do
  it "provides data for a random merchant" do
    create_list(:merchant, 3)

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["type"]).to eq "merchant"
  end
end
