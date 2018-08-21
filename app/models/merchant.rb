class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def average_price
    items.average(:unit_price).round(2)
  end
end
