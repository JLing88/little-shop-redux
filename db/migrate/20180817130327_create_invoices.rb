class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |i|
      i.integer :merchant_id
      i.string :status

      i.timestamps
    end
  end
end
