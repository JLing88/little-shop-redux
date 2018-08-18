RSpec.describe 'Item show page' do
  context 'Page should display' do
    it 'one item' do
      item_1 = Item.create(title: "Widget_1",
                           description: "stuff",
                           unit_price: 299)

      item_2 = Item.create(title: "Widget_2",
                           description: "things",
                           unit_price: 1099)

      visit '/items/1'

      expect(page).to have_content(item_1.title)
      expect(page).to_not have_content(item_2.title)
    end

    it 'an edit button' do
      item = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

      visit "/items/#{item.id}"
      click_on('Edit')

      expect(current_path).to eq("/items/#{item.id}/edit")
    end

    it 'a delete button' do
      item = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

      visit "/items/#{item.id}"
      expect(page).to have_content("Delete")
    end
  end

  context 'User is able to' do
    it 'delete an item' do
      item_1 = Item.create(title: "Widget_1",
                           description: "stuff",
                           unit_price: 299)

      item_2 = Item.create(title: "Widget_2",
                           description: "things",
                           unit_price: 1099)

      visit '/items'
      click_on('Widget_1')
      expect(current_path).to eq("/items/#{item_1.id}")
      click_on('Delete')

      expect(page).to_not have_content("Widget_1")
    end
  end
end
