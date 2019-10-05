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
end
