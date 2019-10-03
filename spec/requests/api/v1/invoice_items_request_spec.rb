require 'rails_helper'

describe "Invoice_items API" do
  it "provides an invoice_item index" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end
end
