require 'rails_helper'

describe "Invoices API" do
  it "provides data for a random invoice" do
    create_list(:invoice, 3)

    get "/api/v1/invoices/random"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["type"]).to eq "invoice"
  end
end
