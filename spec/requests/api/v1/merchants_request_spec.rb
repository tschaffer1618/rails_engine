require 'rails_helper'

describe "Merchants API" do
  it "provides a merchant index" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end
end
