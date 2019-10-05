class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :name

  def self.most_revenue(quantity)
    joins(:invoice_items, :transactions)
    .where(transactions: {result: :success})
    .group(:id)
    .select("merchants.*, sum(quantity * unit_price) AS revenue")
    .order('revenue desc')
    .limit(quantity)
  end

  def self.total_daily_revenue(date)
    joins(:invoices, :invoice_items, :transactions)
    .where(transaction: {result: :success})
    .where(invoice: {created_at: date})
    .sum('quantity * unit_price')
  end
end
