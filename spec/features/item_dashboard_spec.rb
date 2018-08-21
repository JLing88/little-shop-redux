RSpec.describe "Item Dashboard" do
  it 'should display total count of items' do

    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "more stuff",
                         unit_price: 1199)

    item_3 = Item.create(title: "Widget_3",
                         description: "even more stuff",
                         unit_price: 1000)

    visit '/items-dashboard'

    expect(page).to have_content("Total count of items: #{Item.all.count}")
  end

  it 'should display average price per item' do
    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "more stuff",
                         unit_price: 1199)

    item_3 = Item.create(title: "Widget_3",
                         description: "even more stuff",
                         unit_price: 1000)

    visit '/items-dashboard'

    expect(page).to have_content("Average price of all items: #{'$%.2f' % (Item.average_price/100)}")
  end

  it 'should display most recently created item' do
    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "more stuff",
                         unit_price: 1199)

    item_3 = Item.create(title: "Widget_3",
                         description: "even more stuff",
                         unit_price: 1000)

    visit '/items-dashboard'

    expect(page).to have_content("Newest item: #{item_3.title}")
  end

  it 'should display most recently created item' do
    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "more stuff",
                         unit_price: 1199)

    item_3 = Item.create(title: "Widget_3",
                         description: "even more stuff",
                         unit_price: 1000)

    visit '/items-dashboard'

    expect(page).to have_content("Oldest item: #{item_1.title}")
  end

  it 'should have a link that redirects to oldest item' do
    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "more stuff",
                         unit_price: 1199)

    item_3 = Item.create(title: "Widget_3",
                         description: "even more stuff",
                         unit_price: 1000)

    visit '/items-dashboard'

    click_on('oldest-item')

    expect(current_path).to eq("/items/#{item_1.id}")
  end

  it 'should have a link that redirects to oldest item' do
    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "more stuff",
                         unit_price: 1199)

    item_3 = Item.create(title: "Widget_3",
                         description: "even more stuff",
                         unit_price: 1000)

    visit '/items-dashboard'

    click_on('newest-item')

    expect(current_path).to eq("/items/#{item_3.id}")
  end
end
