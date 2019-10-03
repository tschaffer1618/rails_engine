require 'rails_helper'

describe "Transactions API" do
  it "provides a transaction index" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end
end
