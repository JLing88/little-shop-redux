require 'csv'
require './app/models/merchant'
require './app/models/item'
require './app/models/invoice'

Item.destroy_all
Merchant.destroy_all
Invoice.destroy_all

CSV.foreach("./data/merchants.csv", headers: true, header_converters: :symbol) do |row|
  Merchant.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at]
                )
end

CSV.foreach("./data/items.csv", headers: true, header_converters: :symbol) do |row|
  Item.create(id:          row[:id],
              title:       row[:name]
              description: row[:description],
              merchant_id: row[:merchant_id],
              unit_price:  row[:unit_price],
              created_at:  row[:created_at],
              updated_at:  row[:updated_at]
            )
end

CSV.foreach("./data/invoices.csv", headers: true, header_converters: :symbol) do |row|
  Invoice.create(id:         row[:id],
                customer_id: row[:customer_id],
                merchant_id: row[:merchant_id],
                status:      row[:status],
                created_at:  row[:created_at],
                updated_at:  row[:updated_at]
                )
end
