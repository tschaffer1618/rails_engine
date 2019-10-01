require 'csv'

namespace :csv do

  desc "Load csv files into the rails engine"
  task :import_csv => :environment do
    Transaction.delete_all
    InvoiceItem.delete_all
    Item.delete_all
    Invoice.delete_all
    Merchant.delete_all
    Customer.delete_all
    
    CSV.foreach('db/sales_engine/data/customers.csv', headers: true) do |row|
      Customer.create({
        id: row[0],
        first_name: row[1],
        last_name: row[2],
        created_at: row[3],
        updated_at: row[4]
      })
    end

    CSV.foreach('db/sales_engine/data/merchants.csv', headers: true) do |row|
      Merchant.create({
        id: row[0],
        name: row[1],
        created_at: row[2],
        updated_at: row[3]
      })
    end

    CSV.foreach('db/sales_engine/data/invoices.csv', headers: true) do |row|
      Invoice.create({
        id: row[0],
        customer_id: row[1],
        merchant_id: row[2],
        status: row[3],
        created_at: row[4],
        updated_at: row[5]
      })
    end

    CSV.foreach('db/sales_engine/data/items.csv', headers: true) do |row|
      Item.create({
        id: row[0],
        name: row[1],
        description: row[2],
        unit_price: row[3],
        merchant_id: row[4],
        created_at: row[5],
        updated_at: row[6]
      })
    end

    CSV.foreach('db/sales_engine/data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create({
        id: row[0],
        item_id: row[1],
        invoice_id: row[2],
        quantity: row[3],
        unit_price: row[4],
        created_at: row[5],
        updated_at: row[6]
      })
    end

    CSV.foreach('db/sales_engine/data/transactions.csv', headers: true) do |row|
      Transaction.create({
        id: row[0],
        invoice_id: row[1],
        credit_card_number: row[2],
        credit_card_expiration_date: row[3],
        result: row[4],
        created_at: row[5],
        updated_at: row[6]
      })
    end
  end
end
