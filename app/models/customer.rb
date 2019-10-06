class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  validates_presence_of :first_name, :last_name

  def favorite_merchant
    array = self.merchants.joins(:invoices, :transactions)
      .where(transactions: {result: :success})
      .group(:id)
      .select('merchants.*, count(transactions.id) AS successes')
      .order('successes desc')
      .limit(1)
    array[0]
    end
end
