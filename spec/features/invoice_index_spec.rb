RSpec.describe 'invoice index page' do
  it 'should show all invoices' do
    invoice_1 = Invoice.create(merchant_id: 100, customer_id: 33, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 200, customer_id: 44, status: 'shipped')

    visit '/invoices'

    expect(page).to have_content(invoice_1.status)
    expect(page).to have_content(invoice_2.status)
  end
end
