RSpec.describe 'Merchant Dashboard' do
  before(:each) do
    @merchant = Merchant.create(name: "Target")
    @merchant_2 = Merchant.create(name: 'Store')

    @item_1 = @merchant.items.create(title: "a thing", description: "lkjdf", unit_price: 66)
    @item_2 = @merchant.items.create(title: "something", description: "lkjsdfkjdubiuet", unit_price: 1000)
    @item_3 = @merchant.items.create(title: "another thing", description: "jsdiubnk", unit_price: 88)
    @item_4 = @merchant_2.items.create(title: "more things", description: "iidddkdkdjf", unit_price: 550)

  end
  it 'should show total number of items for merchant' do
    visit '/merchants-dashboard'

    within("#merchant-#{@merchant.id}") do
      expect(page).to have_content("Total Items: #{@merchant.items.count}")
    end
  end

  it 'should show average price for merchant' do
    visit '/merchants-dashboard'

    within("#merchant-#{@merchant.id}") do
      expect(page).to have_content("Average Item Price: $#{@merchant.items.average_price.round(2)}")
    end
  end

  it 'should show total item price per merchant' do
    visit '/merchants-dashboard'

    within("#merchant-#{@merchant.id}") do
      expect(page).to have_content("Total Price of all Items: $#{@merchant.total_item_price.round(2)}")
    end
  end

  it 'should show merchant with most items' do
    visit '/merchants-dashboard'

    expect(page).to have_content("Merchant With Most Items:\n#{Merchant.most_items.name}")
    #
    # within("#most-items") do
    #   click_link("#{Merchant.most_items.name}")
    # end
    #
    # expect(current_path).to eq("/merchants/#{Merchant.most_items.id}")
  end

  it 'should show merchant with highest priced item' do
    visit '/merchants-dashboard'

    expect(page).to have_content("Merchant With Highest Priced Item:\n#{Merchant.highest_priced_item.name}")

    within("#high-price") do
      click_on("#{Merchant.highest_priced_item.name}")
    end

    expect(current_path).to eq("/merchants/#{Merchant.highest_priced_item.id}")
  end
end
