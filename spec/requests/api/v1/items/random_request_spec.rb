require 'rails_helper'

describe "Items API" do
  it "provides data for a random item" do
    create_list(:item, 3)

    get "/api/v1/items/random"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["type"]).to eq "item"
  end
end
