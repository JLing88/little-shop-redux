RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Relationships' do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
  end

  describe 'Class Methods' do
    it '.most_items' do
      merchant_1 = Merchant.create(name: "Target")
      merchant_2 = Merchant.create(name: "Store")
      item_1 = merchant_1.items.create(title: "a thing", description: "lkjdf", unit_price:70)
      item_2 = merchant_1.items.create(title: "something", description: "lkjsdfkjdubiuet", unit_price: 1000)
      item_3 = merchant_2.items.create(title: "another thing", description: "aabbd", unit_price: 33)

      expect(Merchant.most_items).to eq(merchant_1)
    end
  end

  describe 'Instance Methods' do
    it '#average_price' do
      merchant = Merchant.create(name: "Target")
      item_1 = merchant.items.create(title: "a thing", description: "lkjdf", unit_price:70)
      item_2 = merchant.items.create(title: "something", description: "lkjsdfkjdubiuet", unit_price: 1000)
      item_3 = merchant.items.create(title: "another thing", description: "jsdiubnk", unit_price: 70)

      expect(merchant.average_price).to eq(380)
    end

    it '#total_item_price' do
      merchant = Merchant.create(name: "Target")
      item_1 = merchant.items.create(title: "a thing", description: "lkjdf", unit_price:70)
      item_2 = merchant.items.create(title: "something", description: "lkjsdfkjdubiuet", unit_price: 1000)
      item_3 = merchant.items.create(title: "another thing", description: "jsdiubnk", unit_price: 70)

      expect(merchant.total_item_price).to eq(1140)
    end
  end
end
