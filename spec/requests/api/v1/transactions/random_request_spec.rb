require 'rails_helper'

describe "Transactions API" do
  it "provides data for a random transaction" do
    create_list(:transaction, 3)

    get "/api/v1/transactions/random"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["type"]).to eq "transaction"
  end
end
