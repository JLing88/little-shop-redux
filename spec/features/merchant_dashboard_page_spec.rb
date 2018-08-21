RSpec.describe 'Merchant Dashboard' do
  before(:each) do
    @merchant = Merchant.create(name: "Target")
    @item_1 = @merchant.items.create(title: "a thing", description: "lkjdf", unit_price: 66)
    @item_2 = @merchant.items.create(title: "something", description: "lkjsdfkjdubiuet", unit_price: 1000)
    @item_3 = @merchant.items.create(title: "another thing", description: "jsdiubnk", unit_price: 88)
  end
  it 'should show total number of items for merchant' do
    visit '/merchants-dashboard'

    within("#merchant-#{@merchant.id}") do
      expect(page).to have_content("Total Items: #{@merchant.items.count}")
    end
  end

  it 'should show average price for merchant' do

  end
end
