require 'rails_helper'

describe "Transactions API" do
  it "provides a transaction index" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single transaction" do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{transaction.id}"
    expect(data["data"]["type"]).to eq "transaction"
    expect(data["data"]["attributes"]["id"]).to eq transaction.id
    expect(data["data"]["attributes"]["invoice_id"]).to eq transaction.invoice_id
    expect(data["data"]["attributes"]["credit_card_number"]).to eq transaction.credit_card_number
    expect(data["data"]["attributes"]["result"]).to eq transaction.result
  end
end
