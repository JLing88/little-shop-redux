class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  validates_presence_of :name

  # def average_price
  #   average(:)
  # end
end
