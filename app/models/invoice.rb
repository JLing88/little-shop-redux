class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  validates_presence_of :merchant_id, :status

  def self.status_percent(status)
    (where(status: status).count / all.count.to_f) * 100
  end
end
