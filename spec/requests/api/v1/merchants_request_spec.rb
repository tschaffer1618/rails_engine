require 'rails_helper'

describe "Merchants API" do
  it "provides a merchant index" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single customer" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{merchant.id}"
    expect(data["data"]["type"]).to eq "merchant"
    expect(data["data"]["attributes"]["id"]).to eq merchant.id
    expect(data["data"]["attributes"]["name"]).to eq merchant.name
    expect(data["data"]["attributes"]["created_at"]).to eq merchant.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq merchant.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  end

  describe "finds the first merchant" do
    before(:each) do
      create_list(:merchant, 3)

      @merchant_1 = Merchant.first
      @merchant_2 = Merchant.second
      @merchant_3 = Merchant.last
    end

    it "by id" do
      get "/api/v1/merchants/find?id=#{@merchant_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@merchant_1.id}"
      expect(data["data"]["type"]).to eq "merchant"
      expect(data["data"]["attributes"]["id"]).to eq @merchant_1.id
      expect(data["data"]["attributes"]["name"]).to eq @merchant_1.name
      expect(data["data"]["attributes"]["created_at"]).to eq @merchant_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @merchant_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by name" do
      get "/api/v1/merchants/find?name=#{@merchant_2.name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@merchant_2.id}"
      expect(data["data"]["type"]).to eq "merchant"
      expect(data["data"]["attributes"]["id"]).to eq @merchant_2.id
      expect(data["data"]["attributes"]["name"]).to eq @merchant_2.name
      expect(data["data"]["attributes"]["created_at"]).to eq @merchant_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @merchant_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    xit "by created_at" do
      get "/api/v1/merchants/find?created_at=#{@merchant_3.created_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@merchant_3.id}"
      expect(data["data"]["type"]).to eq "merchant"
      expect(data["data"]["attributes"]["id"]).to eq @merchant_3.id
      expect(data["data"]["attributes"]["name"]).to eq @merchant_3.name
      expect(data["data"]["attributes"]["created_at"]).to eq @merchant_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @merchant_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    xit "by updated_at" do
      get "/api/v1/merchants/find?updated_at=#{@merchant_1.updated_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@merchant_1.id}"
      expect(data["data"]["type"]).to eq "merchant"
      expect(data["data"]["attributes"]["id"]).to eq @merchant_1.id
      expect(data["data"]["attributes"]["name"]).to eq @merchant_1.name
      expect(data["data"]["attributes"]["created_at"]).to eq @merchant_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @merchant_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end
  end
end
