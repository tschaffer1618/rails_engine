class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  validates_presence_of :name

  def self.most_revenue(quantity)
    joins(:invoice_items)
    .group(:id)
    .select("merchants.*, sum(quantity * unit_price) AS revenue")
    .order('revenue desc')
    .limit(quantity)
  end

  def self.total_daily_revenue(date)
    array = joins(:invoices, :invoice_items, :transactions)
    .where(transactions: {result: :success})
    .where(invoices: {created_at: date})
    .pluck('sum(quantity * unit_price) AS total_revenue')
    (array[0] / 100).to_s
  end

  def favorite_customer
    array = self.customers.joins(:invoices, :transactions)
      .where(transactions: {result: :success})
      .group(:id)
      .select('customers.*, count(transactions.id) AS successes')
      .order('successes desc')
      .limit(1)
    array[0]
  end
end
