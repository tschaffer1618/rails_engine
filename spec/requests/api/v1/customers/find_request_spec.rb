require 'rails_helper'

describe "Customers API" do
  describe "finds the first customer" do
    before(:each) do
      create_list(:customer, 3)

      @customer_1 = Customer.first
      @customer_2 = Customer.second
      @customer_3 = Customer.last
    end

    it "by id" do
      get "/api/v1/customers/find?id=#{@customer_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@customer_1.id}"
      expect(data["data"]["type"]).to eq "customer"
      expect(data["data"]["attributes"]["id"]).to eq @customer_1.id
      expect(data["data"]["attributes"]["first_name"]).to eq @customer_1.first_name
      expect(data["data"]["attributes"]["last_name"]).to eq @customer_1.last_name
    end

    it "by first_name" do
      get "/api/v1/customers/find?first_name=#{@customer_2.first_name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@customer_2.id}"
      expect(data["data"]["type"]).to eq "customer"
      expect(data["data"]["attributes"]["id"]).to eq @customer_2.id
      expect(data["data"]["attributes"]["first_name"]).to eq @customer_2.first_name
      expect(data["data"]["attributes"]["last_name"]).to eq @customer_2.last_name
    end

    it "by last_name" do
      get "/api/v1/customers/find?last_name=#{@customer_3.last_name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@customer_3.id}"
      expect(data["data"]["type"]).to eq "customer"
      expect(data["data"]["attributes"]["id"]).to eq @customer_3.id
      expect(data["data"]["attributes"]["first_name"]).to eq @customer_3.first_name
      expect(data["data"]["attributes"]["last_name"]).to eq @customer_3.last_name
    end

    # xit "by created_at" do
    #   get "/api/v1/customers/find?created_at=#{@customer_1.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"]["id"]).to eq "#{@customer_1.id}"
    #   expect(data["data"]["type"]).to eq "customer"
    #   expect(data["data"]["attributes"]["id"]).to eq @customer_1.id
    #   expect(data["data"]["attributes"]["first_name"]).to eq @customer_1.first_name
    #   expect(data["data"]["attributes"]["last_name"]).to eq @customer_1.last_name
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/customers/find?updated_at=#{@customer_2.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"]["id"]).to eq "#{@customer_2.id}"
    #   expect(data["data"]["type"]).to eq "customer"
    #   expect(data["data"]["attributes"]["id"]).to eq @customer_2.id
    #   expect(data["data"]["attributes"]["first_name"]).to eq @customer_2.first_name
    #   expect(data["data"]["attributes"]["last_name"]).to eq @customer_2.last_name
    # end
  end
end
