RSpec.describe 'Home page' do
  context 'as a visitor' do
    it 'should display nav bar' do

      visit '/'

      within('.navbar') do
        expect(page).to have_content('Little Shop')
      end
    end
  end
end
