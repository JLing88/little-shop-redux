class Invoice < ActiveRecord::Base
  has_many :items
  validates_presence_of :merchant_id, :status
end
