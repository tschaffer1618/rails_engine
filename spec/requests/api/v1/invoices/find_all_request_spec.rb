require 'rails_helper'

describe "Invoices API" do
  describe "finds all invoices" do
    before(:each) do
      customer = create(:customer)
      merchant = create(:merchant)

      @invoice_1 = create(:invoice, customer: customer)
      @invoice_2 = create(:invoice, customer: customer, merchant: merchant)
      @invoice_3 = create(:invoice, merchant: merchant)
    end

    it "by id" do
      get "/api/v1/invoices/find_all?id=#{@invoice_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@invoice_1.id}"
      expect(data["data"][0]["type"]).to eq "invoice"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_1.id
      expect(data["data"][0]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
      expect(data["data"][0]["attributes"]["status"]).to eq @invoice_1.status
      expect(data["data"][0]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][0]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by customer_id" do
      get "/api/v1/invoices/find_all?customer_id=#{@invoice_2.customer_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@invoice_1.id}"
      expect(data["data"][0]["type"]).to eq "invoice"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_1.id
      expect(data["data"][0]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
      expect(data["data"][0]["attributes"]["status"]).to eq @invoice_1.status
      expect(data["data"][0]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][0]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][1]["id"]).to eq "#{@invoice_2.id}"
      expect(data["data"][1]["type"]).to eq "invoice"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_2.id
      expect(data["data"][1]["attributes"]["customer_id"]).to eq @invoice_2.customer_id
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @invoice_2.merchant_id
      expect(data["data"][1]["attributes"]["status"]).to eq @invoice_2.status
      expect(data["data"][1]["attributes"]["created_at"]).to eq @invoice_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][1]["attributes"]["updated_at"]).to eq @invoice_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by merchant_id" do
      get "/api/v1/invoices/find_all?merchant_id=#{@invoice_3.merchant_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@invoice_2.id}"
      expect(data["data"][0]["type"]).to eq "invoice"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_2.id
      expect(data["data"][0]["attributes"]["customer_id"]).to eq @invoice_2.customer_id
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @invoice_2.merchant_id
      expect(data["data"][0]["attributes"]["status"]).to eq @invoice_2.status
      expect(data["data"][0]["attributes"]["created_at"]).to eq @invoice_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][0]["attributes"]["updated_at"]).to eq @invoice_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][1]["id"]).to eq "#{@invoice_3.id}"
      expect(data["data"][1]["type"]).to eq "invoice"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_3.id
      expect(data["data"][1]["attributes"]["customer_id"]).to eq @invoice_3.customer_id
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @invoice_3.merchant_id
      expect(data["data"][1]["attributes"]["status"]).to eq @invoice_3.status
      expect(data["data"][1]["attributes"]["created_at"]).to eq @invoice_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][1]["attributes"]["updated_at"]).to eq @invoice_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by status" do
      get "/api/v1/invoices/find_all?status=#{@invoice_1.status}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 3
      expect(data["data"][0]["id"]).to eq "#{@invoice_1.id}"
      expect(data["data"][0]["type"]).to eq "invoice"
      expect(data["data"][0]["attributes"]["id"]).to eq @invoice_1.id
      expect(data["data"][0]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
      expect(data["data"][0]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
      expect(data["data"][0]["attributes"]["status"]).to eq @invoice_1.status
      expect(data["data"][0]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][0]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][1]["id"]).to eq "#{@invoice_2.id}"
      expect(data["data"][1]["type"]).to eq "invoice"
      expect(data["data"][1]["attributes"]["id"]).to eq @invoice_2.id
      expect(data["data"][1]["attributes"]["customer_id"]).to eq @invoice_2.customer_id
      expect(data["data"][1]["attributes"]["merchant_id"]).to eq @invoice_2.merchant_id
      expect(data["data"][1]["attributes"]["status"]).to eq @invoice_2.status
      expect(data["data"][1]["attributes"]["created_at"]).to eq @invoice_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][1]["attributes"]["updated_at"]).to eq @invoice_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][2]["id"]).to eq "#{@invoice_3.id}"
      expect(data["data"][2]["type"]).to eq "invoice"
      expect(data["data"][2]["attributes"]["id"]).to eq @invoice_3.id
      expect(data["data"][2]["attributes"]["customer_id"]).to eq @invoice_3.customer_id
      expect(data["data"][2]["attributes"]["merchant_id"]).to eq @invoice_3.merchant_id
      expect(data["data"][2]["attributes"]["status"]).to eq @invoice_3.status
      expect(data["data"][2]["attributes"]["created_at"]).to eq @invoice_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"][2]["attributes"]["updated_at"]).to eq @invoice_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    # xit "by created_at" do
    #   get "/api/v1/invoices/find_all?created_at=#{@invoice_3.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@invoice_3.id}"
    #   expect(data["data"][0]["type"]).to eq "invoice"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @invoice_3.id
    #   expect(data["data"][0]["attributes"]["customer_id"]).to eq @invoice_3.customer_id
    #   expect(data["data"][0]["attributes"]["merchant_id"]).to eq @invoice_3.merchant_id
    #   expect(data["data"][0]["attributes"]["status"]).to eq @invoice_3.status
    #   expect(data["data"][0]["attributes"]["created_at"]).to eq @invoice_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    #   expect(data["data"][0]["attributes"]["updated_at"]).to eq @invoice_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/invoices/find_all?updated_at=#{@invoice_1.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@invoice_1.id}"
    #   expect(data["data"][0]["type"]).to eq "invoice"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @invoice_1.id
    #   expect(data["data"][0]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
    #   expect(data["data"][0]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
    #   expect(data["data"][0]["attributes"]["status"]).to eq @invoice_1.status
    #   expect(data["data"][0]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    #   expect(data["data"][0]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    # end
  end
end
