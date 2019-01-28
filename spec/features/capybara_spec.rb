feature 'Capybara tests' do
  scenario 'The homepage displays the correct information' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end
