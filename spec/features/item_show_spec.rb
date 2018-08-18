RSpec.describe 'Item show page' do
  it 'should show one item' do
    item_1 = Item.create(title: "Widget_1",
                         description: "stuff",
                         price: 299)

    item_2 = Item.create(title: "Widget_2",
                         description: "things",
                         price: 1099)

    visit '/items/1'

    expect(page).to have_content(item_1.title)
    expect(page).to_not have_content(item_2.title)
  end

  it 'should have an edit button' do
    item = Item.create(title: "Widget_1",
                       description: "stuff",
                       price: 299)

    visit "/items/#{item.id}"
    click_on('Edit')

    expect(current_path).to eq("/items/#{item.id}/edit")
  end
end
