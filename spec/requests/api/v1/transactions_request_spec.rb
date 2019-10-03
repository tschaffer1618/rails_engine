require 'rails_helper'

describe "Transactions API" do
  it "provides a transaction index" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].count).to eq 3
  end

  it "provides data for a single transaction" do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"]["id"]).to eq "#{transaction.id}"
    expect(data["data"]["type"]).to eq "transaction"
    expect(data["data"]["attributes"]["id"]).to eq transaction.id
    expect(data["data"]["attributes"]["invoice_id"]).to eq transaction.invoice_id
    expect(data["data"]["attributes"]["credit_card_number"]).to eq transaction.credit_card_number
    expect(data["data"]["attributes"]["result"]).to eq transaction.result
    expect(data["data"]["attributes"]["created_at"]).to eq transaction.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    expect(data["data"]["attributes"]["updated_at"]).to eq transaction.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
  end

  describe "finds the first transaction" do
    before(:each) do
      create_list(:transaction, 3)

      @transaction_1 = Transaction.first
      @transaction_2 = Transaction.second
      @transaction_3 = Transaction.last
    end

    it "by id" do
      get "/api/v1/transactions/find?id=#{@transaction_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@transaction_1.id}"
      expect(data["data"]["type"]).to eq "transaction"
      expect(data["data"]["attributes"]["id"]).to eq @transaction_1.id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @transaction_1.invoice_id
      expect(data["data"]["attributes"]["credit_card_number"]).to eq @transaction_1.credit_card_number
      expect(data["data"]["attributes"]["credit_card_expiration_date"]).to eq @transaction_1.credit_card_expiration_date
      expect(data["data"]["attributes"]["result"]).to eq @transaction_1.result
      expect(data["data"]["attributes"]["created_at"]).to eq @transaction_1.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @transaction_1.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    end

    it "by invoice_id" do
      get "/api/v1/transactions/find?invoice_id=#{@transaction_2.invoice_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@transaction_2.id}"
      expect(data["data"]["type"]).to eq "transaction"
      expect(data["data"]["attributes"]["id"]).to eq @transaction_2.id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @transaction_2.invoice_id
      expect(data["data"]["attributes"]["credit_card_number"]).to eq @transaction_2.credit_card_number
      expect(data["data"]["attributes"]["credit_card_expiration_date"]).to eq @transaction_2.credit_card_expiration_date
      expect(data["data"]["attributes"]["result"]).to eq @transaction_2.result
      expect(data["data"]["attributes"]["created_at"]).to eq @transaction_2.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @transaction_2.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    end

    it "by credit_card_number" do
      get "/api/v1/transactions/find?credit_card_number=#{@transaction_3.credit_card_number}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@transaction_3.id}"
      expect(data["data"]["type"]).to eq "transaction"
      expect(data["data"]["attributes"]["id"]).to eq @transaction_3.id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @transaction_3.invoice_id
      expect(data["data"]["attributes"]["credit_card_number"]).to eq @transaction_3.credit_card_number
      expect(data["data"]["attributes"]["credit_card_expiration_date"]).to eq @transaction_3.credit_card_expiration_date
      expect(data["data"]["attributes"]["result"]).to eq @transaction_3.result
      expect(data["data"]["attributes"]["created_at"]).to eq @transaction_3.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @transaction_3.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    end

    it "by result" do
      get "/api/v1/transactions/find?result=#{@transaction_1.result}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@transaction_1.id}"
      expect(data["data"]["type"]).to eq "transaction"
      expect(data["data"]["attributes"]["id"]).to eq @transaction_1.id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @transaction_1.invoice_id
      expect(data["data"]["attributes"]["credit_card_number"]).to eq @transaction_1.credit_card_number
      expect(data["data"]["attributes"]["credit_card_expiration_date"]).to eq @transaction_1.credit_card_expiration_date
      expect(data["data"]["attributes"]["result"]).to eq @transaction_1.result
      expect(data["data"]["attributes"]["created_at"]).to eq @transaction_1.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @transaction_1.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    end

    xit "by created_at" do
      get "/api/v1/transactions/find?created_at=#{@transaction_2.created_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@transaction_2.id}"
      expect(data["data"]["type"]).to eq "transaction"
      expect(data["data"]["attributes"]["id"]).to eq @transaction_2.id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @transaction_2.invoice_id
      expect(data["data"]["attributes"]["credit_card_number"]).to eq @transaction_2.credit_card_number
      expect(data["data"]["attributes"]["credit_card_expiration_date"]).to eq @transaction_2.credit_card_expiration_date
      expect(data["data"]["attributes"]["result"]).to eq @transaction_2.result
      expect(data["data"]["attributes"]["created_at"]).to eq @transaction_2.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @transaction_2.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    end

    xit "by updated_at" do
      get "/api/v1/transactions/find?updated_at=#{@transaction_3.updated_at}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"]["id"]).to eq "#{@transaction_3.id}"
      expect(data["data"]["type"]).to eq "transaction"
      expect(data["data"]["attributes"]["id"]).to eq @transaction_3.id
      expect(data["data"]["attributes"]["invoice_id"]).to eq @transaction_3.invoice_id
      expect(data["data"]["attributes"]["credit_card_number"]).to eq @transaction_3.credit_card_number
      expect(data["data"]["attributes"]["credit_card_expiration_date"]).to eq @transaction_3.credit_card_expiration_date
      expect(data["data"]["attributes"]["result"]).to eq @transaction_3.result
      expect(data["data"]["attributes"]["created_at"]).to eq @transaction_3.created_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
      expect(data["data"]["attributes"]["updated_at"]).to eq @transaction_3.updated_at.strftime('%Y-%m-%dT%I:%M:%S.%LZ')
    end
  end
end
