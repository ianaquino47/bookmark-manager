require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  # scenario 'show the bookmarks (empty)' do
  #   visit('/bookmarks')
  #   expect(page).to have_content "www.google.com"
  #   expect(page).to have_content "www.makersacademy.com"
  #   expect(page).to have_content "www.youtube.com"
  #   expect(page).to have_content "www.facebook.com"
  # end

  feature 'viewing bookmarks' do
    scenario 'bookmarks are visible' do
      Bookmark.create(url: "http://www.makersacademy.com" , title: 'Makers Academy')
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
      Bookmark.create(url: "http://www.google.com", title: 'Google')

      visit '/bookmarks'

      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end

  feature 'Adding a new bookmark' do
    scenario 'A user can add a bookmark to Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://testbookmark.com')
      fill_in('title', with: 'Test Bookmark')
      click_button('Submit')

      expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
    end
  end

  feature 'Deleting bookmarks' do
    scenario 'Removing bookmarks from library' do
      Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/bookmarks')
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

      first('.bookmark').click_button 'Delete'

      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    end
  end

  feature 'Updating a bookmark' do
    scenario 'A user can update a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/bookmarks')
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

      first('.bookmark').click_button 'Edit'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

      fill_in('url', with: "http://www.snakersacademy.com")
      fill_in('title', with: "Snakers Academy")
      click_button('Submit')

      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
    end
  end
end
