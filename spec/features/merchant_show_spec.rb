RSpec.describe 'merchant show page' do
  it 'should show one merchant' do
    merchant = Merchant.create(name: 'Turing School')
    visit '/merchants/1'

    expect(page).to have_content(merchant.name)
  end
end
