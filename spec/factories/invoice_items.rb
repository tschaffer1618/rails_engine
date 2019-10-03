FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { rand(1..50) }
    unit_price { rand(1..10000) }
  end
end
