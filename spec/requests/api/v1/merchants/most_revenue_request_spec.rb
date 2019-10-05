require 'rails_helper'

describe "Merchants API" do
  it "returns the top x merchants based on total revenue" do
    # merchant_1_revenue = 800
    merchant_1 = create(:merchant)
      item_1 = create(:item, merchant: merchant_1, unit_price: 100)
        invoice_1 = create(:invoice, merchant: merchant_1)
          invoice_item_1 = create(:invoice_item, item: item_1, invoice: invoice_1, quantity: 3)
          invoice_item_2 = create(:invoice_item, item: item_1, invoice: invoice_1, quantity: 5)
          transaction_1 = create(:transaction, invoice: invoice_1, result: "success")
      item_2 = create(:item, merchant: merchant_1, unit_price: 300)

    # merchant_2_revenue = 500
    merchant_2 = create(:merchant)
      item_3 = create(:item, merchant: merchant_2, unit_price: 500)
        invoice_2 = create(:invoice, merchant: merchant_2)
          invoice_item_3 = create(:invoice_item, item: item_3, invoice: invoice_2, quantity: 2)
          transaction_2 = create(:transaction, invoice: invoice_2, result: "failed")
        invoice_3 = create(:invoice, merchant: merchant_2)
          invoice_item_4 = create(:invoice_item, item: item_3, invoice: invoice_3, quantity: 1)
          transaction_3 = create(:transaction, invoice: invoice_3, result: "success")

    # merchant_3_revenue = 1200
    merchant_3 = create(:merchant)
      item_4 = create(:item, merchant: merchant_3, unit_price: 200)
        invoice_4 = create(:invoice, merchant: merchant_3)
      item_5 = create(:item, merchant: merchant_3, unit_price: 400)
        invoice_5 = create(:invoice, merchant: merchant_3)
          invoice_item_5 = create(:invoice_item, item: item_5, invoice: invoice_5, quantity: 2)
          transaction_4 = create(:transaction, invoice: invoice_5, result: "success")
        invoice_6 = create(:invoice, merchant: merchant_3)
          invoice_item_6 = create(:invoice_item, item: item_5, invoice: invoice_6, quantity: 1)
          transaction_5 = create(:transaction, invoice: invoice_6, result: "success")

    # merchant_4_revenue = 0
    merchant_4 = create(:merchant)

    get "/api/v1/merchants/most_revenue?quantity=1"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 1
    expect(data["data"][0]["id"]).to eq "#{merchant_3.id}"
    expect(data["data"][0]["type"]).to eq "merchant"
    expect(data["data"][0]["attributes"]["id"]).to eq merchant_3.id
    expect(data["data"][0]["attributes"]["name"]).to eq merchant_3.name

    get "/api/v1/merchants/most_revenue?quantity=3"

    expect(response).to be_successful
    binding.pry

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
    expect(data["data"][0]["id"]).to eq "#{merchant_3.id}"
    expect(data["data"][0]["type"]).to eq "merchant"
    expect(data["data"][0]["attributes"]["id"]).to eq merchant_3.id
    expect(data["data"][0]["attributes"]["name"]).to eq merchant_3.name
    expect(data["data"][1]["id"]).to eq "#{merchant_1.id}"
    expect(data["data"][1]["type"]).to eq "merchant"
    expect(data["data"][1]["attributes"]["id"]).to eq merchant_1.id
    expect(data["data"][1]["attributes"]["name"]).to eq merchant_1.name
    expect(data["data"][2]["id"]).to eq "#{merchant_2.id}"
    expect(data["data"][2]["type"]).to eq "merchant"
    expect(data["data"][2]["attributes"]["id"]).to eq merchant_2.id
    expect(data["data"][2]["attributes"]["name"]).to eq merchant_2.name
  end
end
