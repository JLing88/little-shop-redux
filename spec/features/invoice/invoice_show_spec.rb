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
