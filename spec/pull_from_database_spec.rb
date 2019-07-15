require 'pg'
describe 'pull table from database' do
  it 'pulls bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    result = connection.exec('SELECT * FROM bookmarks')
    expect{result}.not_to raise_error
  end
end
