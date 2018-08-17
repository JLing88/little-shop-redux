RSpec.describe 'merchant index page' do
  context 'as a visitor' do
    it 'should show all merchants' do
      merchant_1 = Merchant.create(name: 'Turing School')
      merchant_2 = Merchant.create(name: 'Google')

      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end

  context 'clicks on create new mechant button' do
    it 'shows a create new merchant page' do

      visit '/merchants'
      click_button("New Merchant")

      expect(current_path).to eq('/merchants/new')
    end
  end
end
