RSpec.describe Item, type: :model do
  describe 'Validations' do
    it { should validate_presence_of (:title) }
    it { should validate_presence_of (:description) }
    it { should validate_presence_of (:unit_price) }
  end

    it 'belongs to one merchant' do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end
end
