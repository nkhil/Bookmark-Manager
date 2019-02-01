feature do
  scenario 'When you submit a false url (get an error message)' do
    visit '/bookmarks/new'
    fill_in 'title', with: 'james'
    fill_in 'url', with: 'james'
    click_button 'Submit'
    expect(page).not_to have_content 'james'
    expect(page).to have_content 'Please submit a valid url'
  end
end
