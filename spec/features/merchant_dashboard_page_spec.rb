RSpec.describe 'Merchant Dashboard' do
  it 'should show total number of items for merchant' do
    merchant = Merchant.create(name: "Target")
    item_1 = merchant.items.create(title: "a thing", description: "lkjdf", unit_price: 66)
    item_2 = merchant.items.create(title: "something", description: "lkjsdfkjdubiuet", unit_price: 1000)
    item_3 = merchant.items.create(title: "another thing", description: "jsdiubnk", unit_price: 88)

    visit '/merchants-dashboard'

    within("#merchant-#{merchant.id}") do
      expect(page).to have_content("Total Items: #{merchant.items.count}")
    end
  end
end
