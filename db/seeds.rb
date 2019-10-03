# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
InvoiceItem.destroy_all
Item.destroy_all
Transaction.destroy_all
Invoice.destroy_all
Merchant.destroy_all
Customer.destroy_all

10.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

5.times do
  Merchant.create!(
    name: Faker::Company.name
  )
end

Merchant.all.each do |merchant|
  Customer.all.each do |customer|
    Invoice.create!(
      customer: customer,
      merchant: merchant,
      status: "shipped"
    )
  end
end

Invoice.all.each do |invoice|
  Transaction.create!(
    invoice: invoice,
    credit_card_number: rand(1000000000000000..9999999999999999).to_s,
    credit_card_expiration_date: nil,
    result: ["success", "failed"].sample
  )
end

Merchant.all.each do |merchant|
  3.times do
    Item.create!(
      name: Faker::Name.name,
      description: Faker::TvShows::MichaelScott.quote,
      unit_price: rand(1..10000),
      merchant: merchant
    )
  end
end

Invoice.all.each do |invoice|
  2.times do
    Item.all.each do |item|
      InvoiceItem.create!(
        item: item,
        invoice: invoice,
        quantity: rand(1..50),
        unit_price: item.unit_price
      )
    end
  end
end
