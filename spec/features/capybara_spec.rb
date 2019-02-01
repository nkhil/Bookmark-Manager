feature 'Capybara tests' do
  
  scenario 'The homepage displays the correct information' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end

  feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')

      # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
      Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')


      visit('/bookmarks')
      
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end

  feature 'Adding bookmarks' do
    scenario 'A user can add bookmarks' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://testbookmark.com')
      fill_in('title', with: 'Test Bookmark')
      click_button('Submit')
      expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
    end
  end

  feature 'Updating a bookmark' do
    scenario 'A user can update a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.james.com', title: 'James')
      visit('/bookmarks')
      expect(page).to have_link('James', href: 'http://www.james.com')
      first('.bookmark').click_button('Edit')
      expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")
      fill_in('url', with: 'http://www.google.com')
      fill_in('title', with: 'James Rudrum')
      click_button('Submit')
      expect(current_path).to eq('/bookmarks')
      expect(page).not_to have_link('James', href: 'http://www.james.com')
      expect(page).to have_link('James Rudrum', href: 'http://www.google.com')
    end
  end

  feature 'Deleting a bookmark' do
    scenario 'A user can delete a bookmark' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      visit('/bookmarks')
      expect(page).to have_link('Google', href: 'http://www.google.com')
      first('.bookmark').click_button 'Delete'
      expect(current_path).to eq('/bookmarks')
      expect(page).not_to have_link('Google', href: 'http://www.google.com')
    end
  end
  
end
