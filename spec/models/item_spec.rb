RSpec.describe Item, type: :model do
  describe 'Validations' do
    it { should validate_presence_of (:title) }
    it { should validate_presence_of (:description) }
    it { should validate_presence_of (:unit_price) }
  end

  describe 'Relationships' do
    it 'belongs to one merchant' do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'Class Methods' do
    describe '.average_price' do
      it 'should return the average_price of all items' do
        item_1 = Item.create(title: "Widget_1",
                             description: "stuff",
                             unit_price: 100)

        item_2 = Item.create(title: "Widget_2",
                             description: "more stuff",
                             unit_price: 50)

        avg_price = Item.average_price

        expect(avg_price).to eq(75.00)
      end
    end

    describe '.oldest_item' do
      it 'should return the oldest item' do
        item_1 = Item.create(title: "Widget_1",
                             description: "stuff",
                             unit_price: 100)

        item_2 = Item.create(title: "Widget_2",
                             description: "more stuff",
                             unit_price: 50)

        item_3 = Item.create(title: "Widget_1",
                            description: "stuff",
                            unit_price: 100)

        item_4 = Item.create(title: "Widget_2",
                            description: "more stuff",
                            unit_price: 50)

        oldest_item = Item.oldest_item

        expect(oldest_item).to eq(item_1)
      end
    end

    describe '.newest_item' do
      it 'should return the newest item' do
        item_1 = Item.create(title: "Widget_1",
                             description: "stuff",
                             unit_price: 100)

        item_2 = Item.create(title: "Widget_2",
                             description: "more stuff",
                             unit_price: 50)

        item_3 = Item.create(title: "Widget_1",
                            description: "stuff",
                            unit_price: 100)

        item_4 = Item.create(title: "Widget_2",
                            description: "more stuff",
                            unit_price: 50)

        newest_item = Item.newest_item

        expect(newest_item).to eq(item_4)
      end
    end
  end
end
