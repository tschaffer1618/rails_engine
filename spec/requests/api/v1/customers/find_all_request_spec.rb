require 'rails_helper'

describe "Customers API" do
  describe "finds all customers" do
    before(:each) do
      @customer_1 = create(:customer, first_name: "Bob")
      @customer_2 = create(:customer, first_name: "Bob")
      @customer_3 = create(:customer, last_name: "Burger")
    end

    it "by id" do
      get "/api/v1/customers/find_all?id=#{@customer_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@customer_1.id}"
      expect(data["data"][0]["type"]).to eq "customer"
      expect(data["data"][0]["attributes"]["id"]).to eq @customer_1.id
      expect(data["data"][0]["attributes"]["first_name"]).to eq @customer_1.first_name
      expect(data["data"][0]["attributes"]["last_name"]).to eq @customer_1.last_name
    end

    it "by first_name" do
      get "/api/v1/customers/find_all?first_name=#{@customer_2.first_name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@customer_1.id}"
      expect(data["data"][0]["type"]).to eq "customer"
      expect(data["data"][0]["attributes"]["id"]).to eq @customer_1.id
      expect(data["data"][0]["attributes"]["first_name"]).to eq @customer_1.first_name
      expect(data["data"][0]["attributes"]["last_name"]).to eq @customer_1.last_name
      expect(data["data"][1]["id"]).to eq "#{@customer_2.id}"
      expect(data["data"][1]["type"]).to eq "customer"
      expect(data["data"][1]["attributes"]["id"]).to eq @customer_2.id
      expect(data["data"][1]["attributes"]["first_name"]).to eq @customer_2.first_name
      expect(data["data"][1]["attributes"]["last_name"]).to eq @customer_2.last_name
    end
  #
    it "by last_name" do
      get "/api/v1/customers/find_all?last_name=#{@customer_3.last_name}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@customer_3.id}"
      expect(data["data"][0]["type"]).to eq "customer"
      expect(data["data"][0]["attributes"]["id"]).to eq @customer_3.id
      expect(data["data"][0]["attributes"]["first_name"]).to eq @customer_3.first_name
      expect(data["data"][0]["attributes"]["last_name"]).to eq @customer_3.last_name
    end
  #
  #   xit "by created_at" do
  #     get "/api/v1/customers/find_all?created_at=#{@customer_1.created_at}"
  #
  #     expect(response).to be_successful
  #
  #     data = JSON.parse(response.body)
  #     expect(data["data"][0]["id"]).to eq "#{@customer_1.id}"
  #     expect(data["data"][0]["type"]).to eq "customer"
  #     expect(data["data"][0]["attributes"]["id"]).to eq @customer_1.id
  #     expect(data["data"][0]["attributes"]["first_name"]).to eq @customer_1.first_name
  #     expect(data["data"][0]["attributes"]["last_name"]).to eq @customer_1.last_name
  #   end
  #
  #   xit "by updated_at" do
  #     get "/api/v1/customers/find_all?updated_at=#{@customer_2.updated_at}"
  #
  #     expect(response).to be_successful
  #
  #     data = JSON.parse(response.body)
  #     expect(data["data"][0]["id"]).to eq "#{@customer_2.id}"
  #     expect(data["data"][0]["type"]).to eq "customer"
  #     expect(data["data"][0]["attributes"]["id"]).to eq @customer_2.id
  #     expect(data["data"][0]["attributes"]["first_name"]).to eq @customer_2.first_name
  #     expect(data["data"][0]["attributes"]["last_name"]).to eq @customer_2.last_name
  #   end
  end
end
