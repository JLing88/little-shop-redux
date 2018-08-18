RSpec.describe Invoice do
  describe 'Features' do
    context 'when user is visiting /invoices' do
      it 'can edit an invoice' do

      merchant = Merchant.create(name: 'Joanne')
      invoice = Invoice.create(merchant_id: 1, status: 'pending')

      visit "/invoices/#{invoice.id}/edit"

        find('.invoice-status-select').find(:option, "shipped").select_option

        click_on('Update Invoice')

        expect(current_path).to eq("/invoices/#{invoice.id}")

        save_and_open_page

        expect(page).to have_content('shipped')
      end
    end
  end
end
