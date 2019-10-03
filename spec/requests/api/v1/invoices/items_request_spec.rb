require 'rails_helper'

describe "Invoices API" do
  it "finds all the items associated with the invoice" do
    invoice = create(:invoice)

    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)

    create(:invoice_item, item: item_1, invoice: invoice)
    create(:invoice_item, item: item_2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
