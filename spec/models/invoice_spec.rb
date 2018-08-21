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
    it 'should show each Invoice status as a percent of total invoices' do
      merchant_1 = Merchant.create(name: "Joe")
      merchant_2 = Merchant.create(name: "Joelle")
      merchant_3 = Merchant.create(name: "Jonas")
      merchant_4 = Merchant.create(name: "Joley")
      merchant_5 = Merchant.create(name: "Joseph")
      merchant_6 = Merchant.create(name: "Joanne")
      invoice_1 = merchant_1.invoices.create(status: 'shipped')
      invoice_2 = merchant_2.invoices.create(status: 'pending')
      invoice_3 = merchant_3.invoices.create(status: 'pending')
      invoice_4 = merchant_4.invoices.create(status: 'returned')
      invoice_5 = merchant_5.invoices.create(status: 'returned')
      invoice_6 = merchant_6.invoices.create(status: 'returned')

      status_percent_shipped = Invoice.status_percent('shipped')
      status_percent_pending = Invoice.status_percent('pending')
      status_percent_returned = Invoice.status_percent('returned')

      expect(status_percent_shipped).to eq(16.67)
      expect(status_percent_pending).to eq(33.33)
      expect(status_percent_returned).to eq(50)
    end
  end
end
