require 'rails_helper'

describe "Invoices API" do
  it "finds all the invoice_items associated with the invoice" do
    invoice = create(:invoice)

    create(:invoice_item, invoice: invoice)
    create_list(:invoice_item, 5)
    create(:invoice_item, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
