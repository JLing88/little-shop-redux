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
      invoice_1 = merchant_1.invoices.create(status: 'pending')
      invoice_2 = merchant_2.invoices.create(status: 'pending')
      invoice_3 = merchant_3.invoices.create(status: 'shipped')
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
    describe 'Class Methods for Invoice Items' do
      before(:each) do
        @invoice_1 = Invoice.create(merchant_id: 2, customer_id: 2, status: 'pending')
        @invoice_2 = Invoice.create(merchant_id: 2, customer_id: 2, status: 'returned')

        # create items here
        @item_1 = Item.create(title: "He-Man T-shirt", description: '100% Cotton', unit_price: 15)
        @item_2 = Item.create(title: "Mr T T-shirt", description: '50/50 Blend', unit_price: 20)


        # invoice_1.invoice_items.create(quantity: 2, unit_price: 25, item_id: 1)
        @ii_1 = @invoice_1.invoice_items.create(quantity: 3, unit_price: 50, item_id: @item_1.id)

        @ii_2 = @invoice_2.invoice_items.create(quantity: 4, unit_price: 10, item_id: @item_2.id)
        # invoice_2.invoice_items.create(quantity: 2, unit_price: 5, item_id: 4)
      end
      it 'should find invoice with highest unit price' do
        highest_unit_price = Invoice.with_highest_unit_price

        expect(highest_unit_price).to eq(@ii_1.id)
      end
      it 'should find invoice with lowest unit price' do
        lowest_unit_price = Invoice.with_lowest_unit_price

        expect(lowest_unit_price).to eq(@ii_2.id)
      end
      it 'should find invoice with highest quantity' do
        highest_quantity = Invoice.with_highest_quantity

        expect(highest_quantity).to eq(@ii_2.id)
      end
      it 'should find invoice with lowest quantity' do
        lowest_quantity = Invoice.with_lowest_quantity

        expect(lowest_quantity).to eq(@ii_1.id)
      end
    end
  end
end
