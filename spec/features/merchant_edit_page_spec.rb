RSpec.describe 'Merchant Edit Page' do
  it 'should have new name field' do
    merchant = Merchant.create(name: 'Target')
    old_merchant_name = merchant.name

    visit "/merchants/#{merchant.id}/edit"
    fill_in('merchant[name]', with: 'Red Dot')
    click_on("Update Merchant")

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content('Red Dot')
    expect(page).to_not have_content(old_merchant_name)
  end
end
