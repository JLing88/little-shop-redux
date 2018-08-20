class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :items
  has_many :invoice_items
  has_many :items, through :invoice_items
  validates_presence_of :merchant_id, :status
end
