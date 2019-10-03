require 'rails_helper'

describe "Invoices API" do
  it "provides an invoice index" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end
end
