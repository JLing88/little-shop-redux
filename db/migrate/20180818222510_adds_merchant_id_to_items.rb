class AddsMerchantIdToItems < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |i|
      i.rename :price, :unit_price
      i.integer :merchant_id
    end
  end
end
