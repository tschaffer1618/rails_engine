require 'rails_helper'

describe "Merchants API" do
  describe "finds all merchants" do
    before(:each) do
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant, name: "Anderson")
      @merchant_3 = create(:merchant, name: "Anderson")
    end

    it "by id" do
      get "/api/v1/merchants/find_all?id=#{@merchant_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@merchant_1.id}"
      expect(data["data"][0]["type"]).to eq "merchant"
      expect(data["data"][0]["attributes"]["id"]).to eq @merchant_1.id
      expect(data["data"][0]["attributes"]["name"]).to eq @merchant_1.name
    end

    it "by name" do
      get "/api/v1/merchants/find_all?name=#{@merchant_2.name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@merchant_2.id}"
      expect(data["data"][0]["type"]).to eq "merchant"
      expect(data["data"][0]["attributes"]["id"]).to eq @merchant_2.id
      expect(data["data"][0]["attributes"]["name"]).to eq @merchant_2.name
      expect(data["data"][1]["id"]).to eq "#{@merchant_3.id}"
      expect(data["data"][1]["type"]).to eq "merchant"
      expect(data["data"][1]["attributes"]["id"]).to eq @merchant_3.id
      expect(data["data"][1]["attributes"]["name"]).to eq @merchant_3.name
    end

    # xit "by created_at" do
    #   get "/api/v1/merchants/find_all?created_at=#{@merchant_3.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@merchant_3.id}"
    #   expect(data["data"][0]["type"]).to eq "merchant"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @merchant_3.id
    #   expect(data["data"][0]["attributes"]["name"]).to eq @merchant_3.name
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/merchants/find_all?updated_at=#{@merchant_1.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@merchant_1.id}"
    #   expect(data["data"][0]["type"]).to eq "merchant"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @merchant_1.id
    #   expect(data["data"][0]["attributes"]["name"]).to eq @merchant_1.name
    # end
  end
end
