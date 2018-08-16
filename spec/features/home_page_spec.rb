RSpec.describe 'Home page' do
  context 'as a visitor' do
    it 'should display Title in nav bar' do

      visit '/'

      within('.navbar') do
        expect(page).to have_content('Little Shop')
      end
    end

    it 'displays links to indices' do
      #is indices a good word to use?
      visit '/'

      within('.navbar') do
        expect(page).to have_content('Merchants')
      end
    end
  end
end
