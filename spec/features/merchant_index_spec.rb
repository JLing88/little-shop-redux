RSpec.describe 'merchant index page' do
  context 'as a visitor' do
    it 'should show all merchants' do
      merchant_1 = Merchant.create(name: 'Turing School')
      merchant_2 = Merchant.create(name: 'Goo gle')

      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end
end
