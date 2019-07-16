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
      Bookmark.create(url: "http://www.makersacademy.com")
      Bookmark.create(url: "http://www.destroyallsoftware.com")
      Bookmark.create(url: "http://www.google.com")

      visit '/bookmarks'

      expect(page).to have_content 'http://www.makersacademy.com'
      expect(page).to have_content 'http://www.destroyallsoftware.com'
      expect(page).to have_content 'http://www.google.com'
    end
  end

  feature 'Adding a new bookmark' do
    scenario 'A user can add a bookmark to Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://testbookmark.com')
      click_button('Submit')

      expect(page).to have_content 'http://testbookmark.com'
    end
  end
end
