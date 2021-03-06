class Api::V1::Transactions::FindAllController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.where(transaction_params).order(:id))
  end

  private

  def transaction_params
    params.permit(:id,:invoice_id,:credit_card_number,:credit_card_expiration_date,:result,:created_at,:updated_at)
  end
end
