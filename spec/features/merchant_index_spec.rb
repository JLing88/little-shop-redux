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

  context 'user creates new merchant' do
    it 'shows a create new merchant page' do

      visit '/merchants'
      click_link("Create New Merchant")

      expect(current_path).to eq('/merchants/new')
    end

    it 'shows newly created merchant' do
      visit '/merchants/new'
      fill_in("merchant[name]", with: "Target")
      click_on("Submit")

      expect(page).to have_content("Target")
    end
  end
end
