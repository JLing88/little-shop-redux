class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |m|
      m.string :name

      m.timestamps
    end      
  end
end
