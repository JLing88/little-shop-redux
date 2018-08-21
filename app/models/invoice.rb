class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  validates_presence_of :merchant_id, :status

  def self.status_percent(status)
    (where(status: status).count / all.count.to_f) * 100
  end

  def self.with_highest_unit_price
    highest = InvoiceItem.maximum(:unit_price)
    InvoiceItem.where(unit_price: highest).limit(1).first.invoice_id
  end

  def self.with_lowest_unit_price
    lowest = InvoiceItem.minimum(:unit_price)
    InvoiceItem.where(unit_price: lowest).limit(1).first.invoice_id
  end

  def self.with_highest_quantity
    highest = InvoiceItem.maximum(:quantity)
    InvoiceItem.where(quantity: highest).limit(1).first.invoice_id
  end

  def self.with_lowest_quantity
    lowest = InvoiceItem.minimum(:quantity)
    InvoiceItem.where(quantity: lowest).limit(1).first.invoice_id
  end
end
