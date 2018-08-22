RSpec.describe 'Invoice Dashboard' do
  it 'should show each invoice status as a percent of total invoices' do
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

    invoice_item_1 = invoice_1.invoice_items.create(quantity: 3, unit_price: 50, item_id: 1)

    percent_pending = Invoice.status_percent('pending')
    percent_shipped = Invoice.status_percent('shipped')
    percent_returned = Invoice.status_percent('returned')

    visit '/invoices-dashboard'

    expect(page).to have_content("Invoice Dashboard")

    expect(page).to have_content("Pending: #{percent_pending.round(2)}%")
    expect(page).to have_content("Shipped: #{percent_shipped.round(2)}%")
    expect(page).to have_content("Returned: #{percent_returned.round(2)}%")
  end
  describe 'Invoice Metrics' do
    before(:each) do
      @invoice_1 = Invoice.create(merchant_id: 2, customer_id: 2, status: 'pending')
      @invoice_2 = Invoice.create(merchant_id: 2, customer_id: 2, status: 'returned')

      @item_1 = Item.create(title: "He-Man T-shirt", description: '100% Cotton', unit_price: 15)
      @item_2 = Item.create(title: "Mr T T-shirt", description: '50/50 Blend', unit_price: 20)

      @ii_1 = @invoice_1.invoice_items.create(quantity: 3, unit_price: 50, item_id: @item_1.id)

      @ii_2 = @invoice_2.invoice_items.create(quantity: 4, unit_price: 10, item_id: @item_2.id)
    end
    it 'should show invoice with highest unit price' do
      visit '/invoices-dashboard'

      click_on('high-price')

      expect(current_path).to eq("/invoices/#{@invoice_1.id}")
    end
    it 'should show invoice with lowest unit price' do
      visit '/invoices-dashboard'

      click_on('low-price')

      expect(current_path).to eq("/invoices/#{@invoice_2.id}")
    end
    it 'should show invoice with highest quantity' do
      visit '/invoices-dashboard'

      click_on('high-quantity')

      expect(current_path).to eq("/invoices/#{@invoice_2.id}")
    end
    it 'should show invoice with lowest quantity' do
      visit '/invoices-dashboard'

      click_on('low-quantity')

      expect(current_path).to eq("/invoices/#{@invoice_1.id}")
    end
  end
end
