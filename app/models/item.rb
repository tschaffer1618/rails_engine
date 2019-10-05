class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  validates_presence_of :name, :description, :unit_price

  def self.most_revenue(quantity)
    joins(:invoice_items, :transactions)
    .where(transactions: {result: :success})
    .group(:id)
    .select("items.*, sum(quantity * unit_price) AS revenue")
    .order('revenue desc')
    .limit(quantity)
  end

  def best_day
    self.invoices.joins(:transactions)
      .where(transaction: {result: :success})
      .group(:id)
      .select('invoices.created_at AS date, count(transactions.id) AS sales')
      .order('sales desc, date desc')
      .limit(1)
      .pluck(:created_at)
    end
end
