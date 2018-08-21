RSpec.describe Invoice, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:status) }
  end
  describe 'Relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:items) }
    it { should have_many(:invoice_items) }
  end
  describe 'Class Methods' do
    it 'should calculate each invoice status as a percent of total invoices' do
      merchant_1 = Merchant.create(name: "Joe")
      merchant_2 = Merchant.create(name: "Joelle")
      merchant_3 = Merchant.create(name: "Jonas")
      merchant_4 = Merchant.create(name: "Joley")
      merchant_5 = Merchant.create(name: "Joseph")
      merchant_6 = Merchant.create(name: "Joanne")
      invoice_1 = merchant_2.invoices.create(status: 'pending')
      invoice_2 = merchant_3.invoices.create(status: 'pending')
      invoice_3 = merchant_1.invoices.create(status: 'shipped')
      invoice_4 = merchant_4.invoices.create(status: 'returned')
      invoice_5 = merchant_5.invoices.create(status: 'returned')
      invoice_6 = merchant_6.invoices.create(status: 'returned')

      percent_pending = Invoice.status_percent('pending')
      percent_shipped = Invoice.status_percent('shipped')
      percent_returned = Invoice.status_percent('returned')

      expect(percent_pending.round(2)).to eq(33.33)
      expect(percent_shipped.round(2)).to eq(16.67)
      expect(percent_returned.round(2)).to eq(50)
    end
    it 'should find invoice with item with highest unit price'
      invoice_1 = 
  end
end
