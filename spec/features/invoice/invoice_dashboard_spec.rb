RSpec.describe 'Invoice Dashboard' do
  before(:each) do
    merchant_1 = Merchant.create(name: "Joe")
    merchant_2 = Merchant.create(name: "Joelle")
    merchant_3 = Merchant.create(name: "Jonas")
    merchant_4 = Merchant.create(name: "Joley")
    invoice_1 = merchant_1.invoices.create(status: 'pending')
    invoice_2 = merchant_2.invoices.create(status: 'pending')
    invoice_3 = merchant_3.invoices.create(status: 'shipped')
    invoice_4 = merchant_4.invoices.create(status: 'returned')
    item_1 = Item.create(title: "He-Man T-shirt", description: '100% Cotton', unit_price: 15)
    item_2 = Item.create(title: "Mr T T-shirt", description: '50/50 Blend', unit_price: 20)
    item_3 = Item.create(title: "USCSS Nostromo T-shirt", description: 'Unisex sizes', unit_price: 25)
    item_4 = Item.create(title: "Weyland Corp T-shirt", description: 'Children', unit_price: 30)

    invoice_1.invoice_items.create(quantity: 1, item_id: 1)
    invoice_1.invoice_items.create(quantity: 2, item_id: 2)

    invoice_2.invoice_items.create(quantity: 1, item_id: 3)
    invoice_2.invoice_items.create(quantity: 2, item_id: 4)
  end
  it 'should show each invoice status as a percent of total invoices' do
    percent_pending = Invoice.status_percent('pending')
    percent_shipped = Invoice.status_percent('shipped')
    percent_returned = Invoice.status_percent('returned')

    visit '/invoices-dashboard'

    expect(page).to have_content("Invoice Dashboard")

    expect(page).to have_content("Pending: #{percent_pending.round(2)}%")
    expect(page).to have_content("Shipped: #{percent_shipped.round(2)}%")
    expect(page).to have_content("Returned: #{percent_returned.round(2)}%")
  end
  it 'should show invoice with highest unit price' do
  end
  it 'should show invoice with lowest unit price' do
  end
  it 'should show invoice with highest quantity' do
  end
  it 'should show invoice with lowest quantity' do
  end
end
