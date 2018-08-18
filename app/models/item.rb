class Item < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :title, :description, :unit_price
end
