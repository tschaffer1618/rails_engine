require 'rails_helper'

describe "Merchants API" do
  it "provides a merchant index" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single customer" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{merchant.id}"
    expect(data["data"]["type"]).to eq "merchant"
    expect(data["data"]["attributes"]["id"]).to eq merchant.id
    expect(data["data"]["attributes"]["name"]).to eq merchant.name
  end
end
