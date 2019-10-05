class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :first_name, :last_name

  def favorite_merchant
    self.merchants.joins(:invoices, :transactions)
      .where(transaction: {result: :success})
      .group(:id)
      .select('merchants.*, count(transactions.id) AS successes')
      .order('successes desc')
      .limit(1)
    end
end
