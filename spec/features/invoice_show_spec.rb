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
    it 'should be able to delete invoice' do
      merchant = Merchant.create(name: "Joe")
      invoice = Invoice.create(merchant_id: 200, status: 'shipped')

      visit "/invoices"

      find_button('Delete').click


      expect(page).to_not have_content("#{invoice.status}")
    end
  end
end
