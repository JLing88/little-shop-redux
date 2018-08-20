RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Relationships' do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
  end

  it 'should have many invoices' do
    association = described_class.reflect_on_association(:invoices)
    expect(association.macro).to eq :has_many
  end
end
