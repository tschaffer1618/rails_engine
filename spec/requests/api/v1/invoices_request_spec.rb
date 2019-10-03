require 'rails_helper'

describe "Invoices API" do
  it "provides an invoice index" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single customer" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{invoice.id}"
    expect(data["data"]["type"]).to eq "invoice"
    expect(data["data"]["attributes"]["id"]).to eq invoice.id
    expect(data["data"]["attributes"]["status"]).to eq invoice.status
    expect(data["data"]["attributes"]["created_at"]).to eq invoice.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq invoice.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  end

  describe "finds the first invoice" do
    before(:each) do
      create_list(:invoice, 3)

      @invoice_1 = Invoice.first
      @invoice_2 = Invoice.second
      @invoice_3 = Invoice.last
    end

    it "by id" do
      get "/api/v1/invoices/find?id=#{@invoice_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_1.id}"
      expect(data["data"]["type"]).to eq "invoice"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_1.id
      expect(data["data"]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
      expect(data["data"]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
      expect(data["data"]["attributes"]["status"]).to eq @invoice_1.status
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by customer_id" do
      get "/api/v1/invoices/find?customer_id=#{@invoice_2.customer_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_2.id}"
      expect(data["data"]["type"]).to eq "invoice"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_2.id
      expect(data["data"]["attributes"]["customer_id"]).to eq @invoice_2.customer_id
      expect(data["data"]["attributes"]["merchant_id"]).to eq @invoice_2.merchant_id
      expect(data["data"]["attributes"]["status"]).to eq @invoice_2.status
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by merchant_id" do
      get "/api/v1/invoices/find?merchant_id=#{@invoice_3.merchant_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_3.id}"
      expect(data["data"]["type"]).to eq "invoice"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_3.id
      expect(data["data"]["attributes"]["customer_id"]).to eq @invoice_3.customer_id
      expect(data["data"]["attributes"]["merchant_id"]).to eq @invoice_3.merchant_id
      expect(data["data"]["attributes"]["status"]).to eq @invoice_3.status
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    it "by status" do
      get "/api/v1/invoices/find?status=#{@invoice_1.status}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_1.id}"
      expect(data["data"]["type"]).to eq "invoice"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_1.id
      expect(data["data"]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
      expect(data["data"]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
      expect(data["data"]["attributes"]["status"]).to eq @invoice_1.status
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    xit "by created_at" do
      get "/api/v1/invoices/find?created_at=#{@invoice_3.created_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_3.id}"
      expect(data["data"]["type"]).to eq "invoice"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_3.id
      expect(data["data"]["attributes"]["customer_id"]).to eq @invoice_3.customer_id
      expect(data["data"]["attributes"]["merchant_id"]).to eq @invoice_3.merchant_id
      expect(data["data"]["attributes"]["status"]).to eq @invoice_3.status
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_3.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_3.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end

    xit "by updated_at" do
      get "/api/v1/invoices/find?updated_at=#{@invoice_1.updated_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@invoice_1.id}"
      expect(data["data"]["type"]).to eq "invoice"
      expect(data["data"]["attributes"]["id"]).to eq @invoice_1.id
      expect(data["data"]["attributes"]["customer_id"]).to eq @invoice_1.customer_id
      expect(data["data"]["attributes"]["merchant_id"]).to eq @invoice_1.merchant_id
      expect(data["data"]["attributes"]["status"]).to eq @invoice_1.status
      expect(data["data"]["attributes"]["created_at"]).to eq @invoice_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @invoice_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    end
  end
end
