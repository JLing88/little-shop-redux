RSpec.describe 'merchant show page' do
  it 'should show one merchant' do
    merchant = Merchant.create(name: 'Turing School')
    visit '/merchants/1'

    expect(page).to have_content(merchant.name)
  end

  it 'should cancel creation of new merchant' do

    visit '/merchants/new'

    expect(page).to have_content("Cancel")

    click_on("Cancel")

    expect(current_path).to eq('/merchants')
  end
end
