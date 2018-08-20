class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through :invoice_items
  validates_presence_of :title, :description, :unit_price

  def self.average_price
    Item.average(:unit_price)
  end

  def self.oldest_item
    Item.order(:created_at).first
  end

  def self.newest_item
    Item.order(created_at: :desc).first
  end

end
