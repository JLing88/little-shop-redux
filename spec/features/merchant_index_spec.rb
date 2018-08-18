RSpec.describe 'Merchant index page' do
  context 'As a visitor' do
    it 'should show all merchants' do
      merchant_1 = Merchant.create(name: 'Turing School')
      merchant_2 = Merchant.create(name: 'Goo gle')

      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end

  context 'User creates new merchant' do
    it 'shows a create new merchant button' do

      visit '/merchants'
      click_link("Create New Merchant")

      expect(current_path).to eq('/merchants/new')
    end

    it 'shows newly created merchant' do
      visit '/merchants/new'
      fill_in("merchant[name]", with: "Target")
      click_on("Submit")

      expect(current_path).to eq('/merchants')
      expect(page).to have_content("Target")
    end

    it 'should cancel creation of new merchant' do
      visit '/merchants/new'
      expect(page).to have_content("Cancel")
      click_on("Cancel")
      expect(current_path).to eq('/merchants')
    end
  end
end
