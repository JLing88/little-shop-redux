RSpec.describe 'invoice index page' do
  it 'should show all invoices' do
    invoice_1 = Invoice.create(merchant_id: 100, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 200, status: 'shipped')

    visit '/invoices'

    expect(page).to have_content(invoice_1.status)
    expect(page).to have_content(invoice_2.status)
  end
    it 'from /invoices can click edit and be sent to /invoices/id/edit' do
    invoice_1 = Invoice.create(merchant_id: 100, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 200, status: 'shipped')

    visit '/invoices'

      click_button 'Edit'

    expect(current_path).to eq("/invoices/#{invoices.id}/edit")
  end
end
