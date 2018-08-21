RSpec.describe 'Invoice Dashboard' do
  describe 'Dashboard' do
    it 'should show each invoice status as a percent of total invoices' do
      merchant_1 = Merchant.create(name: "Joe")
      merchant_2 = Merchant.create(name: "Joelle")
      merchant_3 = Merchant.create(name: "Jonas")
      merchant_4 = Merchant.create(name: "Joley")
      merchant_5 = Merchant.create(name: "Joseph")
      merchant_6 = Merchant.create(name: "Joanne")
      invoice_1 = merchant_2.invoices.create(status: 'pending')
      invoice_2 = merchant_3.invoices.create(status: 'pending')
      invoice_3 = merchant_1.invoices.create(status: 'shipped')
      invoice_4 = merchant_4.invoices.create(status: 'returned')
      invoice_5 = merchant_5.invoices.create(status: 'returned')
      invoice_6 = merchant_6.invoices.create(status: 'returned')

      percent_pending = Invoice.status_percent('pending')
      percent_shipped = Invoice.status_percent('shipped')
      percent_returned = Invoice.status_percent('returned')

        visit '/invoices-dashboard'

        expect(page).to have_content("Invoice Dashboard")

        expect(page).to have_content("Pending: #{percent_pending.round(2)}%")
        expect(page).to have_content("Shipped: #{percent_shipped.round(2)}%")
        expect(page).to have_content("Returned: #{percent_returned.round(2)}%")
      end
    end
  end
