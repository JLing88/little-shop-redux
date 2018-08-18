class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |i|
      i.string :title
      i.text   :description
      i.float  :price

      i.timestamps
    end
  end
end
