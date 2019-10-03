require 'rails_helper'

describe "Items API" do
  it "provides an item index" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end
end
