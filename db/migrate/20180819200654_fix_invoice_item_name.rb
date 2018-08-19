class FixInvoiceItemName < ActiveRecord::Migration[5.2]
  def change
    rename_table :invoiceitems, :invoice_items
  end
end
