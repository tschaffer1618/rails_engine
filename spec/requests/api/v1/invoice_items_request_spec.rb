require 'rails_helper'

describe "Invoice_items API" do
  it "provides an invoice_item index" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{invoice_item.id}"
    expect(data["data"]["type"]).to eq "invoice_item"
    expect(data["data"]["attributes"]["id"]).to eq invoice_item.id
    expect(data["data"]["attributes"]["item_id"]).to eq invoice_item.item_id
    expect(data["data"]["attributes"]["invoice_id"]).to eq invoice_item.invoice_id
    expect(data["data"]["attributes"]["quantity"]).to eq invoice_item.quantity
    expect(data["data"]["attributes"]["unit_price"]).to eq invoice_item.unit_price
    expect(data["data"]["attributes"]["created_at"]).to eq invoice_item.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq invoice_item.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  end

  describe "finds the first invoice_item" do
    before(:each) do
      create_list(:invoice_item, 3)

      @invoice_item_1 = InvoiceItem.first
      @invoice_item_2 = InvoiceItem.second
      @invoice_item_3 = InvoiceItem.last
    end

    it "by id" do
      get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_1.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_1.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_1.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by item_id" do
      get "/api/v1/invoice_items/find?item_id=#{@invoice_item_2.item_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_2.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_2.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_2.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_2.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_2.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_2.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by invoice_id" do
      get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_3.invoice_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_3.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_3.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_3.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_3.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_3.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_3.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by quantity" do
      get "/api/v1/invoice_items/find?quantity=#{@invoice_item_1.quantity}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_1.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_1.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_1.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by unit_price" do
      get "/api/v1/invoice_items/find?unit_price=#{@invoice_item_2.unit_price}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_2.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_2.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_2.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_2.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_2.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_2.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    xit "by created_at" do
      get "/api/v1/invoice_items/find?created_at=#{@invoice_item_3.created_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_3.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_3.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_3.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_3.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_3.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_3.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    xit "by updated_at" do
      get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_1.updated_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_item_1.id}"
      expect(data["data"]["type"]).to eq "invoice_item"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_item_1.id
      expect(data["data"]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
      expect(data["data"]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
      expect(data["data"]["attributes"]["unit_price"]).to eq @invoice_item_1.unit_price
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_item_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_item_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end
  end
end
