RSpec.describe 'Invoice show page' do
  context 'As a user' do
    it 'should show one invoice' do
      invoice = Invoice.create(merchant_id: 100, status: 'pending')
      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(invoice.status)
    end
      it 'sends user to edit page' do
      merchant = Merchant.create(name: "Joe")
      invoice = Invoice.create(merchant_id: 200, status: 'shipped')

      visit "/invoices/#{invoice.id}"

      within('#Invoices')
        find_button('Edit').click

      expect(current_path).to eq("/invoices/#{invoice.id}/edit")
    end
    it 'user can delete an invoice from show page' do
      invoice_1 = Invoice.create(merchant_id: 5, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 2, status: 'complete')

      visit '/invoices'
      click_on(invoice_1.id)
      expect(current_path).to eq("/invoices/#{invoice_1.id}")
      click_on('Delete')
      expect(current_path).to eq('/invoices')
      expect(page).not_to have_content('1')
    end
  end
end
