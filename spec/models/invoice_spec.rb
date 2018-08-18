RSpec.describe Invoice, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:status) }
  end

  it 'has many items' do
    association = described_class.reflect_on_association(:items)
    expect(association.macro).to eq :has_many
  end
end
