class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :items
  validates_presence_of :merchant_id, :status
end
