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

  it 'should be able to delete merchant' do
    merchant_1 =Merchant.create(name: 'Turing School')
    merchant_2 =Merchant.create(name: 'CU Denver')

    visit "/merchants/#{merchant_1.id}"
    click_on("Delete")

    expect(page).to_not have_content("#{merchant_1.name}")
  end
end
