RSpec.describe 'Merchant Edit Page' do
  it 'should change merchant name' do
    merchant = Merchant.create(name: 'Target')
    visit '/merchants/1/edit'
    fill_in('merchant[name]', with: "Red Dot")
    click_on("Submit")

    expect(current_path).to eq('/merchants/1')
    expect(page).to_not have_content("Target")
    expect(page).to have_content("Red Dot")
  end
end
