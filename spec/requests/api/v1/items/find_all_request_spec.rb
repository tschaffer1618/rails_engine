require 'rails_helper'

describe "Items API" do
  describe "finds all items" do
    before(:each) do
      merchant = create(:merchant)

      @item_1 = create(:item, unit_price: 456)
      @item_2 = create(:item, name: "Useful Item", description: "This item is good")
      @item_3 = create(:item, name: "Useful Item", description: "This item is good", merchant: merchant)
      @item_4 = create(:item, unit_price: 456, merchant: merchant)
    end

    it "by id" do
      get "/api/v1/items/find_all?id=#{@item_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@item_1.id}"
      expect(data["data"][0]["type"]).to eq "item"
      expect(data["data"][0]["attributes"]["id"]).to eq @item_1.id
      expect(data["data"][0]["attributes"]["name"]).to eq @item_1.name
      expect(data["data"][0]["attributes"]["description"]).to eq @item_1.description
      expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_1.unit_price
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_1.merchant_id
    end

    it "by name" do
      get "/api/v1/items/find_all?name=#{@item_2.name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@item_2.id}"
      expect(data["data"][0]["type"]).to eq "item"
      expect(data["data"][0]["attributes"]["id"]).to eq @item_2.id
      expect(data["data"][0]["attributes"]["name"]).to eq @item_2.name
      expect(data["data"][0]["attributes"]["description"]).to eq @item_2.description
      expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_2.unit_price
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_2.merchant_id
      expect(data["data"][1]["id"]).to eq "#{@item_3.id}"
      expect(data["data"][1]["type"]).to eq "item"
      expect(data["data"][1]["attributes"]["id"]).to eq @item_3.id
      expect(data["data"][1]["attributes"]["name"]).to eq @item_3.name
      expect(data["data"][1]["attributes"]["description"]).to eq @item_3.description
      expect(data["data"][1]["attributes"]["unit_price"]).to eq @item_3.unit_price
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @item_3.merchant_id
    end

    it "by description" do
      get "/api/v1/items/find_all?description=#{@item_3.description}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@item_2.id}"
      expect(data["data"][0]["type"]).to eq "item"
      expect(data["data"][0]["attributes"]["id"]).to eq @item_2.id
      expect(data["data"][0]["attributes"]["name"]).to eq @item_2.name
      expect(data["data"][0]["attributes"]["description"]).to eq @item_2.description
      expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_2.unit_price
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_2.merchant_id
      expect(data["data"][1]["id"]).to eq "#{@item_3.id}"
      expect(data["data"][1]["type"]).to eq "item"
      expect(data["data"][1]["attributes"]["id"]).to eq @item_3.id
      expect(data["data"][1]["attributes"]["name"]).to eq @item_3.name
      expect(data["data"][1]["attributes"]["description"]).to eq @item_3.description
      expect(data["data"][1]["attributes"]["unit_price"]).to eq @item_3.unit_price
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @item_3.merchant_id
    end

    it "by unit_price" do
      get "/api/v1/items/find_all?unit_price=#{@item_4.unit_price}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@item_1.id}"
      expect(data["data"][0]["type"]).to eq "item"
      expect(data["data"][0]["attributes"]["id"]).to eq @item_1.id
      expect(data["data"][0]["attributes"]["name"]).to eq @item_1.name
      expect(data["data"][0]["attributes"]["description"]).to eq @item_1.description
      expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_1.unit_price
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_1.merchant_id
      expect(data["data"][1]["id"]).to eq "#{@item_4.id}"
      expect(data["data"][1]["type"]).to eq "item"
      expect(data["data"][1]["attributes"]["id"]).to eq @item_4.id
      expect(data["data"][1]["attributes"]["name"]).to eq @item_4.name
      expect(data["data"][1]["attributes"]["description"]).to eq @item_4.description
      expect(data["data"][1]["attributes"]["unit_price"]).to eq @item_4.unit_price
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @item_4.merchant_id
    end

    it "by merchant_id" do
      get "/api/v1/items/find_all?merchant_id=#{@item_3.merchant_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@item_3.id}"
      expect(data["data"][0]["type"]).to eq "item"
      expect(data["data"][0]["attributes"]["id"]).to eq @item_3.id
      expect(data["data"][0]["attributes"]["name"]).to eq @item_3.name
      expect(data["data"][0]["attributes"]["description"]).to eq @item_3.description
      expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_3.unit_price
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_3.merchant_id
      expect(data["data"][1]["id"]).to eq "#{@item_4.id}"
      expect(data["data"][1]["type"]).to eq "item"
      expect(data["data"][1]["attributes"]["id"]).to eq @item_4.id
      expect(data["data"][1]["attributes"]["name"]).to eq @item_4.name
      expect(data["data"][1]["attributes"]["description"]).to eq @item_4.description
      expect(data["data"][1]["attributes"]["unit_price"]).to eq @item_4.unit_price
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @item_4.merchant_id
    end

    # xit "by created_at" do
    #   get "/api/v1/items/find_all?created_at=#{@item_3.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@item_3.id}"
    #   expect(data["data"][0]["type"]).to eq "item"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @item_3.id
    #   expect(data["data"][0]["attributes"]["name"]).to eq @item_3.name
    #   expect(data["data"][0]["attributes"]["description"]).to eq @item_3.description
    #   expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_3.unit_price
    #   expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_3.merchant_id
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/items/find_all?updated_at=#{@item_1.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@item_1.id}"
    #   expect(data["data"][0]["type"]).to eq "item"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @item_1.id
    #   expect(data["data"][0]["attributes"]["name"]).to eq @item_1.name
    #   expect(data["data"][0]["attributes"]["description"]).to eq @item_1.description
    #   expect(data["data"][0]["attributes"]["unit_price"]).to eq @item_1.unit_price
    #   expect(data["data"][0]["attributes"]["merchant_id"]).to eq @item_1.merchant_id
    # end
  end
end
