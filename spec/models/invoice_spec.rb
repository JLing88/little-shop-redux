RSpec.describe Invoice, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:status) }
  end
  describe 'Relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:items) }
    it { should have_many(:invoice_items) }
  end
end
