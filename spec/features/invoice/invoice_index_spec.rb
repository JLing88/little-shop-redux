RSpec.describe 'Invoice index page' do
  context 'As a user' do
    it 'should show all invoices' do
      merchant_1 = Merchant.create(name: "Joe")
      merchant_2 = Merchant.create(name: "Joelle")
      invoice_1 = merchant_1.invoices.create(status: 'pending')
      invoice_2 = merchant_2.invoices.create(status: 'shipped')

        visit '/invoices'

        expect(page).to have_content(invoice_1.id)
        expect(page).to have_content(invoice_2.id)
    end
    it 'user can delete an invoice from index page' do
      merchant_1 = Merchant.create(name: "Joe")
      merchant_2 = Merchant.create(name: "Joelle")
      invoice_1 = merchant_1.invoices.create(status: 'complete')
      invoice_2 = merchant_2.invoices.create(status: 'shipped')

      visit '/invoices'

      within("#invoice-#{invoice_1.id}") do
        click_on('Delete')
      end

      expect(page).to_not have_content("Invoice: #{invoice_1.id}")
      expect(page).to have_content("Invoice: #{invoice_2.id}")
    end
    it 'should cancel editing of an invoice' do
      merchant = Merchant.create(name: "Joe")
      invoice = merchant.invoices.create(status: 'shipped')

      visit "/invoices/#{invoice.id}/edit"

      find('.invoice-status-select').find(:option, "shipped").select_option
      find_button('Cancel').click

      expect(current_path).to eq("/invoices/#{invoice.id}")
    end
  end
end
