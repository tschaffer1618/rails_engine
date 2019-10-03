require 'rails_helper'

describe "Items API" do
  it "provides an item index" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single customer" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{item.id}"
    expect(data["data"]["type"]).to eq "item"
    expect(data["data"]["attributes"]["id"]).to eq item.id
    expect(data["data"]["attributes"]["name"]).to eq item.name
    expect(data["data"]["attributes"]["description"]).to eq item.description
    expect(data["data"]["attributes"]["unit_price"]).to eq item.unit_price
  end
end
