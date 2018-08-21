RSpec.describe 'Invoice show page' do
  context 'As a user' do
    it 'should show one invoice' do
      merchant = Merchant.create(name: "Joelle")
      invoice = merchant.invoices.create(status: 'pending')
      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(invoice.status)
    end
    it 'sends user to edit page' do
      merchant = Merchant.create(name: "Joe")
      invoice = merchant.invoices.create(status: 'shipped')

      visit "/invoices/#{invoice.id}"

      within('#Invoices')
        find_button('Edit').click

      expect(current_path).to eq("/invoices/#{invoice.id}/edit")
    end
    it 'shows list of all associated item titles, quantities, unit_prices' do
      item_1 = Item.create(title: "Widget_1",
                           description: "stuff",
                           unit_price: 299)

      item_2 = Item.create(title: "Widget_2",
                           description: "things",
                           unit_price: 1099)

      invoice = Invoice.create(customer_id: 1, status: 'shipped', merchant_id: 1)

      ii_1 = invoice.invoice_items.create(item_id: item_1.id, unit_price: 100, quantity: 2)
      ii_2 = invoice.invoice_items.create(item_id: item_2.id, unit_price: 50, quantity: 3)

      ii_1_price = "$1.00"
      ii_2_price = "$0.50"

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(item_1.id)
      expect(page).to have_content(item_2.id)
      expect(page).to have_content("#{item_1.title}")
      expect(page).to have_content("#{item_2.title}")
      expect(page).to have_content("#{ii_1.quantity}")
      expect(page).to have_content("#{ii_2.quantity}")
      expect(page).to have_content(ii_1_price)
      expect(page).to have_content(ii_2_price)
    end

    it 'shows a subtotal for the invoice' do
      item_1 = Item.create(title: "Widget_1",
                           description: "stuff",
                           unit_price: 299)

      item_2 = Item.create(title: "Widget_2",
                           description: "things",
                           unit_price: 1099)

      invoice = Invoice.create(customer_id: 1, status: 'shipped', merchant_id: 1)

      ii_1 = invoice.invoice_items.create(item_id: item_1.id, unit_price: 100, quantity: 2)
      ii_2 = invoice.invoice_items.create(item_id: item_2.id, unit_price: 50, quantity: 3)

      visit "/invoices/#{invoice.id}"

      subtotal = "$3.50"
      expect(page).to have_content(subtotal)
    end

    it 'user can delete an invoice from show page' do
      merchant_1 = Merchant.create(name: "Joe")
      merchant_2 = Merchant.create(name: "Joelle")
      invoice_1 = merchant_1.invoices.create(status: 'pending')
      invoice_2 = merchant_2.invoices.create(status: 'complete')

      visit '/invoices'

      click_on(invoice_1.id)
      expect(current_path).to eq("/invoices/#{invoice_1.id}")

      click_on('Delete')
      expect(current_path).to eq('/invoices')
      expect(page).not_to have_content('1')
    end
  end
end
