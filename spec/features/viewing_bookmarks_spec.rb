feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'show the bookmarks (empty)' do
    visit('/bookmarks')
    expect(page).to have_content "There are currently no bookmarks. Add some!"
  end
end
