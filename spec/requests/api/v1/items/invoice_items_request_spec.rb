require 'rails_helper'

describe "Items API" do
  it "finds all the invoice_items associated with the item" do
    item = create(:item)

    create(:invoice_item, item: item)
    create_list(:invoice_item, 5)
    create(:invoice_item, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].class).to eq Array
    expect(data["data"].count).to eq 2
  end
end
