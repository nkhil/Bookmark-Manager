feature 'Capybara tests' do
  scenario 'The homepage displays the correct information' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end

  feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do
      visit('/bookmarks')
      expect(page).to have_content 'http://www.google.com'
      expect(page).to have_content 'http://www.destroyallsoftware.com'
      expect(page).to have_content 'http://www.makersacademy.com'
    end
  end
end
