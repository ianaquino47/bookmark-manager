require 'pg'
describe 'pull table from database' do
  it 'pulls bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'www.google.com');")
    result = connection.exec("SELECT * FROM bookmarks")
    bookmarks = result.map { |bookmarks| bookmarks['url'] }
    expect(bookmarks).to include 'www.google.com'
  end
end
