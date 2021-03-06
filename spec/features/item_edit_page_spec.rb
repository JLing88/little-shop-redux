RSpec.describe 'Item edit page' do
  it 'should show edit page' do
    item = Item.create(title: "Widget_1",
                         description: "stuff",
                         unit_price: 299)

    visit "/items/#{item.id}/edit"

    expect(page).to have_content('Title')
    expect(page).to have_content('Description')
    expect(page).to have_content('Price')
  end

  it 'should update item with new info' do
    item = Item.create(title: "Widget_1",
                       description: "stuff",
                       unit_price: 299)

    visit "/items/#{item.id}/edit"

    fill_in "item[title]", with: "Updated_title"
    fill_in "item[unit_price]", with: 99
    fill_in "item[description]", with: "Stuff"

    click_on('Update')

    expect(page).to have_content("Updated_title")
    expect(page).to have_content(".99")
    expect(page).to have_content("Stuff")
  end
end
