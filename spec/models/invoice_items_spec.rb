RSpec.describe 'InvoiceItems' do
  describe 'Relationships' do
    it { should belong_to(:invoice) }
    it { should belong_to(:merchant) }
  end
end
