RSpec.describe 'invoice index page' do
  context 'As a user' do
    it 'should show all invoices' do
      invoice_1 = Invoice.create(merchant_id: 100, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 200, status: 'shipped')

        visit '/invoices'

        expect(page).to have_content(invoice_1.id)
        expect(page).to have_content(invoice_2.id)
    end
    it 'user can delete an invoice from index page' do
      invoice_2 = Invoice.create(merchant_id: 2, status: 'complete')

      visit '/invoices'
      save_and_open_page

        click_on('Delete')

      expect(page).not_to have_content('status: complete')
    end
  end
end
