class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoiceitems do |t|
      t.integer :item_id
      t.integer :invoice_id
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end 
  end
end
