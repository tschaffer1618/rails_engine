require 'rails_helper'

describe "Transactions API" do
  describe "finds all transactions" do
    before(:each) do
      invoice = create(:invoice)

      @transaction_1 = create(:transaction, invoice: invoice, result: "success")
      @transaction_2 = create(:transaction, invoice: invoice, result: "failed")
      @transaction_3 = create(:transaction, result: "failed")
    end

    it "by id" do
      get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@transaction_1.id}"
      expect(data["data"][0]["type"]).to eq "transaction"
      expect(data["data"][0]["attributes"]["id"]).to eq @transaction_1.id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @transaction_1.invoice_id
      expect(data["data"][0]["attributes"]["credit_card_number"]).to eq @transaction_1.credit_card_number
      expect(data["data"][0]["attributes"]["result"]).to eq @transaction_1.result
    end

    it "by invoice_id" do
      get "/api/v1/transactions/find_all?invoice_id=#{@transaction_2.invoice_id}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 2
      expect(data["data"][0]["id"]).to eq "#{@transaction_1.id}"
      expect(data["data"][0]["type"]).to eq "transaction"
      expect(data["data"][0]["attributes"]["id"]).to eq @transaction_1.id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @transaction_1.invoice_id
      expect(data["data"][0]["attributes"]["credit_card_number"]).to eq @transaction_1.credit_card_number
      expect(data["data"][0]["attributes"]["result"]).to eq @transaction_1.result
      expect(data["data"][1]["id"]).to eq "#{@transaction_2.id}"
      expect(data["data"][1]["type"]).to eq "transaction"
      expect(data["data"][1]["attributes"]["id"]).to eq @transaction_2.id
      expect(data["data"][1]["attributes"]["invoice_id"]).to eq @transaction_2.invoice_id
      expect(data["data"][1]["attributes"]["credit_card_number"]).to eq @transaction_2.credit_card_number
      expect(data["data"][1]["attributes"]["result"]).to eq @transaction_2.result
    end

    it "by credit_card_number" do
      get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_3.credit_card_number}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@transaction_3.id}"
      expect(data["data"][0]["type"]).to eq "transaction"
      expect(data["data"][0]["attributes"]["id"]).to eq @transaction_3.id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @transaction_3.invoice_id
      expect(data["data"][0]["attributes"]["credit_card_number"]).to eq @transaction_3.credit_card_number
      expect(data["data"][0]["attributes"]["result"]).to eq @transaction_3.result
    end

    it "by result" do
      get "/api/v1/transactions/find_all?result=#{@transaction_1.result}"

      expect(response).to be_successful

      data = JSON.parse(response.body)
      expect(data["data"].class).to eq Array
      expect(data["data"].count).to eq 1
      expect(data["data"][0]["id"]).to eq "#{@transaction_1.id}"
      expect(data["data"][0]["type"]).to eq "transaction"
      expect(data["data"][0]["attributes"]["id"]).to eq @transaction_1.id
      expect(data["data"][0]["attributes"]["invoice_id"]).to eq @transaction_1.invoice_id
      expect(data["data"][0]["attributes"]["credit_card_number"]).to eq @transaction_1.credit_card_number
      expect(data["data"][0]["attributes"]["result"]).to eq @transaction_1.result
    end

    # xit "by created_at" do
    #   get "/api/v1/transactions/find_all?created_at=#{@transaction_2.created_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@transaction_2.id}"
    #   expect(data["data"][0]["type"]).to eq "transaction"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @transaction_2.id
    #   expect(data["data"][0]["attributes"]["invoice_id"]).to eq @transaction_2.invoice_id
    #   expect(data["data"][0]["attributes"]["credit_card_number"]).to eq @transaction_2.credit_card_number
    #   expect(data["data"][0]["attributes"]["result"]).to eq @transaction_2.result
    # end
    #
    # xit "by updated_at" do
    #   get "/api/v1/transactions/find_all?updated_at=#{@transaction_3.updated_at}"
    #
    #   expect(response).to be_successful
    #
    #   data = JSON.parse(response.body)
    #   expect(data["data"][0]["id"]).to eq "#{@transaction_3.id}"
    #   expect(data["data"][0]["type"]).to eq "transaction"
    #   expect(data["data"][0]["attributes"]["id"]).to eq @transaction_3.id
    #   expect(data["data"][0]["attributes"]["invoice_id"]).to eq @transaction_3.invoice_id
    #   expect(data["data"][0]["attributes"]["credit_card_number"]).to eq @transaction_3.credit_card_number
    #   expect(data["data"][0]["attributes"]["result"]).to eq @transaction_3.result
    # end
  end
end
