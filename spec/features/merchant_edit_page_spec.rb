RSpec.describe 'Merchant Edit Page' do
  it 'should change merchant name' do
    merchant = Merchant.create(name: 'Target')
    visit '/merchant/edit/1'
    fill_in("merchant[name]", with: "Red Dot")
    click_on("Submit")

    expect(current_path).to eq('/merchant/1')
    expect(page).to_not have_content("Target")
    expect(page).to have_content("Red Dot")
  end
end
