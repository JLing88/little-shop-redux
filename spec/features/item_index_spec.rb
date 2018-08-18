RSpec.describe 'item index page' do
  context 'as a visitor' do
    it 'should show all items' do
      item_1 = Item.create(title: "Widget_1",
                           description: "stuff",
                           price: 299)

      item_2 = Item.create(title: "Widget_2",
                           description: "more stuff",
                           price: 1199)

      visit '/items'

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_2.price)
    end

    context 'User creates new item' do
      it 'shows a create new item page' do

        visit '/items'
        click_link("Create New Item")

        expect(current_path).to eq('/item/new')
      end
    end
  end
end
