require 'rails_helper'

describe "Items API" do
  it "provides data for the associated merchant of an item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{merchant.id}"
    expect(data["data"]["type"]).to eq "merchant"
    expect(data["data"]["attributes"]["id"]).to eq merchant.id
    expect(data["data"]["attributes"]["name"]).to eq merchant.name
  end
end
