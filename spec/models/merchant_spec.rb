RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  it 'should have many items' do
    association = described_class.reflect_on_association(:items)
    expect(association.macro).to eq :has_many
  end

  it 'should have many invoices' do
    association = described_class.reflect_on_association(:invoices)
    expect(association.macro).to eq :has_many
  end
end
