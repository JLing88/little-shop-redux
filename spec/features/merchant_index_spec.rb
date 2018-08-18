RSpec.describe 'Merchant index page' do
  context 'As a visitor' do
    it 'should show all merchants' do
      merchant_1 = Merchant.create(name: 'Turing School')
      merchant_2 = Merchant.create(name: 'Google')

      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end

    it 'should link to one merchants page' do
      merchant_1 = Merchant.create(name: 'Turing School')
      merchant_2 = Merchant.create(name: 'Google')

      visit '/merchants'
      click_on("#{merchant_1.name}")
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
      expect(page).to have_content("#{merchant_1.name}")
    end

    it 'should have an edit and delete button for each merchant' do
      merchant_1 = Merchant.create(name: 'Turing School')
      visit '/merchants'

      within("#merchant-#{merchant_1.id}") do
        expect(page).to have_button("Edit")
        expect(page).to have_button("Delete")
      end
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
