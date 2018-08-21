RSpec.describe 'item index page' do
  context 'As a visitor' do
    it 'should show all items' do
      item_1 = Item.create(title: "Widget_1",
                           description: "stuff",
                           unit_price: 299)

      item_2 = Item.create(title: "Widget_2",
                           description: "more stuff",
                           unit_price: 1199)

      visit '/items'

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content("#{'$%.2f' % (item_1.unit_price/100)}")
      expect(page).to have_content("#{'$%.2f' % (item_2.unit_price/100)}")
    end
  end

  context 'User creates new item' do
    it 'shows a create new item page' do

      visit '/items'
      click_link("Create New Item")

      expect(current_path).to eq('/items/new')
    end

    it 'shows newly created item' do
      visit '/items/new'
      fill_in('item[title]', with: "New Item")
      fill_in('item[description]', with: "This does some things.")
      fill_in('item[unit_price]', with: 99)
      click_on("Submit")

      expect(current_path).to eq('/items')
      expect(page).to have_content("New Item")

    end

    it 'should cancel creation of new item' do
      visit '/items/new'

      expect(page).to have_content("Cancel")

      click_on("Cancel")

      expect(current_path).to eq('/items')
    end
  end
end
