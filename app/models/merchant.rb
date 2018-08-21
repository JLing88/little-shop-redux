class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.most_items
    select("merchants.*, items.count AS item_count").joins(:items).group(:merchant_id, :id).order("item_count ASC").last
  end

  def average_price
    items.average(:unit_price)
  end

  def total_item_price
    items.sum(:unit_price)
  end
end
