require 'rails_helper'

describe "Items API" do
  describe "finds the first item" do
    before(:each) do
      create_list(:item, 3)

      @item_1 = Item.first
      @item_2 = Item.second
      @item_3 = Item.last

    end

    it "by id" do
      get "/api/v1/items/find?id=#{@item_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@item_1.id}"
      expect(data["data"]["type"]).to eq "item"
      expect(data["data"]["attributes"]["id"]).to eq @item_1.id
      expect(data["data"]["attributes"]["name"]).to eq @item_1.name
      expect(data["data"]["attributes"]["description"]).to eq @item_1.description
      expect(data["data"]["attributes"]["unit_price"]).to eq (@item_1.unit_price.to_f / 100).to_s
      expect(data["data"]["attributes"]["merchant_id"]).to eq @item_1.merchant_id
    end

    it "by name" do
      get "/api/v1/items/find?name=#{@item_2.name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@item_2.id}"
      expect(data["data"]["type"]).to eq "item"
      expect(data["data"]["attributes"]["id"]).to eq @item_2.id
      expect(data["data"]["attributes"]["name"]).to eq @item_2.name
      expect(data["data"]["attributes"]["description"]).to eq @item_2.description
      expect(data["data"]["attributes"]["unit_price"]).to eq (@item_2.unit_price.to_f / 100).to_s
      expect(data["data"]["attributes"]["merchant_id"]).to eq @item_2.merchant_id
    end

    it "by description" do
      get "/api/v1/items/find?description=#{@item_3.description}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@item_3.id}"
      expect(data["data"]["type"]).to eq "item"
      expect(data["data"]["attributes"]["id"]).to eq @item_3.id
      expect(data["data"]["attributes"]["name"]).to eq @item_3.name
      expect(data["data"]["attributes"]["description"]).to eq @item_3.description
      expect(data["data"]["attributes"]["unit_price"]).to eq (@item_3.unit_price.to_f / 100).to_s
      expect(data["data"]["attributes"]["merchant_id"]).to eq @item_3.merchant_id
    end

    it "by unit_price" do
      get "/api/v1/items/find?unit_price=#{((@item_1.unit_price.to_f) / 100).to_s}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@item_1.id}"
      expect(data["data"]["type"]).to eq "item"
      expect(data["data"]["attributes"]["id"]).to eq @item_1.id
      expect(data["data"]["attributes"]["name"]).to eq @item_1.name
      expect(data["data"]["attributes"]["description"]).to eq @item_1.description
      expect(data["data"]["attributes"]["unit_price"]).to eq (@item_1.unit_price.to_f / 100).to_s
      expect(data["data"]["attributes"]["merchant_id"]).to eq @item_1.merchant_id
    end

    it "by merchant_id" do
      get "/api/v1/items/find?merchant_id=#{@item_2.merchant_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@item_2.id}"
      expect(data["data"]["type"]).to eq "item"
      expect(data["data"]["attributes"]["id"]).to eq @item_2.id
      expect(data["data"]["attributes"]["name"]).to eq @item_2.name
      expect(data["data"]["attributes"]["description"]).to eq @item_2.description
      expect(data["data"]["attributes"]["unit_price"]).to eq (@item_2.unit_price.to_f / 100).to_s
      expect(data["data"]["attributes"]["merchant_id"]).to eq @item_2.merchant_id
    end

    # xit "by created_at" do
    #   get "/api/v1/items/find?created_at=#{@item_3.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"]["id"]).to eq "#{@item_3.id}"
    #   expect(data["data"]["type"]).to eq "item"
    #   expect(data["data"]["attributes"]["id"]).to eq @item_3.id
    #   expect(data["data"]["attributes"]["name"]).to eq @item_3.name
    #   expect(data["data"]["attributes"]["description"]).to eq @item_3.description
    #   expect(data["data"]["attributes"]["unit_price"]).to eq (@item_3.unit_price.to_f / 100).to_s
    #   expect(data["data"]["attributes"]["merchant_id"]).to eq @item_3.merchant_id
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/items/find?updated_at=#{@item_1.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"]["id"]).to eq "#{@item_1.id}"
    #   expect(data["data"]["type"]).to eq "item"
    #   expect(data["data"]["attributes"]["id"]).to eq @item_1.id
    #   expect(data["data"]["attributes"]["name"]).to eq @item_1.name
    #   expect(data["data"]["attributes"]["description"]).to eq @item_1.description
    #   expect(data["data"]["attributes"]["unit_price"]).to eq (@item_1.unit_price.to_f / 100).to_s
    #   expect(data["data"]["attributes"]["merchant_id"]).to eq @item_1.merchant_id
    # end
  end
end
