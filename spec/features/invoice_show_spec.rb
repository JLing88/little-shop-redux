RSpec.describe 'invoice show page' do
  it 'should show one invoice' do
    invoice = Invoice.create(merchant_id: 100, customer_id: 2, status: 'pending')
    visit '/invoices/1'

    expect(page).to have_content(invoice.status)
  end
  it 'should show all invoices' do
    invoice_1 = Invoice.create(merchant_id: 100, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 200, status: 'shipped')

      visit '/invoices'

      expect(page).to have_content(invoice_1.status)
      expect(page).to have_content(invoice_2.status)
    end
    it 'sends user to edit page' do
    merchant = Merchant.create(name: "Joe")
    invoice = Invoice.create(merchant_id: 200, status: 'shipped')

    visit "/invoices/#{invoice.id}"

    within('#Invoices')
      click_button 'Edit'

    expect(current_path).to eq("/invoices/#{invoice.id}/edit")
  end
end
