require 'rails_helper'

describe "Invoice_items API" do
  describe "finds all invoice_items" do
    before(:each) do
      item = create(:item)
      invoice = create(:invoice)

      @invoice_item_1 = create(:invoice_item, item: item, invoice: invoice, quantity: 9)
      @invoice_item_2 = create(:invoice_item, item: item, quantity: 4)
      @invoice_item_3 = create(:invoice_item, invoice: invoice, quantity: 4)
      @invoice_item_4 = create(:invoice_item, quantity: 4, unit_price: 3567)
      @invoice_item_5 = create(:invoice_item, item: item, quantity: 1, unit_price: 3567)
      @invoice_item_6 = create(:invoice_item, quantity: 4)
    end

    it "by id" do
      get "/api/v1/invoice_items/find_all?id=#{@invoice_item_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@invoice_item_1.id}"
      expect(data["data"][0]["type"]).to eq "invoice_item"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_1.id
      expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
      expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
      expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_1.unit_price.to_f / 100).to_s
    end

    it "by item_id" do
      get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_2.item_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 3
      expect(data["data"][0]["id"]).to eq "#{@invoice_item_1.id}"
      expect(data["data"][0]["type"]).to eq "invoice_item"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_1.id
      expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
      expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
      expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_1.unit_price.to_f / 100).to_s
      expect(data["data"][1]["id"]).to eq "#{@invoice_item_2.id}"
      expect(data["data"][1]["type"]).to eq "invoice_item"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_item_2.id
      expect(data["data"][1]["attributes"]["item_id"]).to eq @invoice_item_2.item_id
      expect(data["data"][1]["attributes"]["invoice_id"]).to eq @invoice_item_2.invoice_id
      expect(data["data"][1]["attributes"]["quantity"]).to eq @invoice_item_2.quantity
      expect(data["data"][1]["attributes"]["unit_price"]).to eq (@invoice_item_2.unit_price.to_f / 100).to_s
      expect(data["data"][2]["id"]).to eq "#{@invoice_item_5.id}"
      expect(data["data"][2]["type"]).to eq "invoice_item"
      expect(data["data"][2]["attributes"]["id"]).to eq @invoice_item_5.id
      expect(data["data"][2]["attributes"]["item_id"]).to eq @invoice_item_5.item_id
      expect(data["data"][2]["attributes"]["invoice_id"]).to eq @invoice_item_5.invoice_id
      expect(data["data"][2]["attributes"]["quantity"]).to eq @invoice_item_5.quantity
      expect(data["data"][2]["attributes"]["unit_price"]).to eq (@invoice_item_5.unit_price.to_f / 100).to_s
    end

    it "by invoice_id" do
      get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item_3.invoice_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@invoice_item_1.id}"
      expect(data["data"][0]["type"]).to eq "invoice_item"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_1.id
      expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
      expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
      expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_1.unit_price.to_f / 100).to_s
      expect(data["data"][1]["id"]).to eq "#{@invoice_item_3.id}"
      expect(data["data"][1]["type"]).to eq "invoice_item"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_item_3.id
      expect(data["data"][1]["attributes"]["item_id"]).to eq @invoice_item_3.item_id
      expect(data["data"][1]["attributes"]["invoice_id"]).to eq @invoice_item_3.invoice_id
      expect(data["data"][1]["attributes"]["quantity"]).to eq @invoice_item_3.quantity
      expect(data["data"][1]["attributes"]["unit_price"]).to eq (@invoice_item_3.unit_price.to_f / 100).to_s
    end

    it "by quantity" do
      get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_4.quantity}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 4
      expect(data["data"][0]["id"]).to eq "#{@invoice_item_2.id}"
      expect(data["data"][0]["type"]).to eq "invoice_item"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_2.id
      expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_2.item_id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_2.invoice_id
      expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_2.quantity
      expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_2.unit_price.to_f / 100).to_s
      expect(data["data"][1]["id"]).to eq "#{@invoice_item_3.id}"
      expect(data["data"][1]["type"]).to eq "invoice_item"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_item_3.id
      expect(data["data"][1]["attributes"]["item_id"]).to eq @invoice_item_3.item_id
      expect(data["data"][1]["attributes"]["invoice_id"]).to eq @invoice_item_3.invoice_id
      expect(data["data"][1]["attributes"]["quantity"]).to eq @invoice_item_3.quantity
      expect(data["data"][1]["attributes"]["unit_price"]).to eq (@invoice_item_3.unit_price.to_f / 100).to_s
      expect(data["data"][2]["id"]).to eq "#{@invoice_item_4.id}"
      expect(data["data"][2]["type"]).to eq "invoice_item"
      expect(data["data"][2]["attributes"]["id"]).to eq @invoice_item_4.id
      expect(data["data"][2]["attributes"]["item_id"]).to eq @invoice_item_4.item_id
      expect(data["data"][2]["attributes"]["invoice_id"]).to eq @invoice_item_4.invoice_id
      expect(data["data"][2]["attributes"]["quantity"]).to eq @invoice_item_4.quantity
      expect(data["data"][2]["attributes"]["unit_price"]).to eq (@invoice_item_4.unit_price.to_f / 100).to_s
      expect(data["data"][3]["id"]).to eq "#{@invoice_item_6.id}"
      expect(data["data"][3]["type"]).to eq "invoice_item"
      expect(data["data"][3]["attributes"]["id"]).to eq @invoice_item_6.id
      expect(data["data"][3]["attributes"]["item_id"]).to eq @invoice_item_6.item_id
      expect(data["data"][3]["attributes"]["invoice_id"]).to eq @invoice_item_6.invoice_id
      expect(data["data"][3]["attributes"]["quantity"]).to eq @invoice_item_6.quantity
      expect(data["data"][3]["attributes"]["unit_price"]).to eq (@invoice_item_6.unit_price.to_f / 100).to_s
    end

    it "by unit_price" do
      get "/api/v1/invoice_items/find_all?unit_price=#{@invoice_item_5.unit_price}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@invoice_item_4.id}"
      expect(data["data"][0]["type"]).to eq "invoice_item"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_4.id
      expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_4.item_id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_4.invoice_id
      expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_4.quantity
      expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_4.unit_price.to_f / 100).to_s
      expect(data["data"][1]["id"]).to eq "#{@invoice_item_5.id}"
      expect(data["data"][1]["type"]).to eq "invoice_item"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_item_5.id
      expect(data["data"][1]["attributes"]["item_id"]).to eq @invoice_item_5.item_id
      expect(data["data"][1]["attributes"]["invoice_id"]).to eq @invoice_item_5.invoice_id
      expect(data["data"][1]["attributes"]["quantity"]).to eq @invoice_item_5.quantity
      expect(data["data"][1]["attributes"]["unit_price"]).to eq (@invoice_item_5.unit_price.to_f / 100).to_s
    end

    # xit "by created_at" do
    #   get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_3.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@invoice_item_3.id}"
    #   expect(data["data"][0]["type"]).to eq "invoice_item"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_3.id
    #   expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_3.item_id
    #   expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_3.invoice_id
    #   expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_3.quantity
    #   expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_3.unit_price.to_f / 100).to_s
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_1.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@invoice_item_1.id}"
    #   expect(data["data"][0]["type"]).to eq "invoice_item"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @invoice_item_1.id
    #   expect(data["data"][0]["attributes"]["item_id"]).to eq @invoice_item_1.item_id
    #   expect(data["data"][0]["attributes"]["invoice_id"]).to eq @invoice_item_1.invoice_id
    #   expect(data["data"][0]["attributes"]["quantity"]).to eq @invoice_item_1.quantity
    #   expect(data["data"][0]["attributes"]["unit_price"]).to eq (@invoice_item_1.unit_price.to_f / 100).to_s
    # end
  end
end
