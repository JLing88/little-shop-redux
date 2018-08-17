class Invoice < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :merchant_id, :status
end
