RSpec.describe 'merchant show page' do
  it 'should show one merchant' do
    merchant = Merchant.create(name: 'Turing School')
    visit "/merchants/#{merchant.id}"

    expect(page).to have_content(merchant.name)
  end

  it 'should have an edit path' do
    merchant = Merchant.create(name: 'Turing School')
    visit "/merchants/#{merchant.id}"
    click_on("Edit")

    expect(current_path).to eq("/merchants/#{merchant.id}/edit")
  end
end
