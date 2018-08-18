RSpec.describe 'invoice show page' do
  it 'should show one invoice' do
    invoice = Invoice.create(merchant_id: 100, customer_id: 2, status: 'pending')
    visit '/invoices/1'

    expect(page).to have_content(invoice.status)
  end
end
