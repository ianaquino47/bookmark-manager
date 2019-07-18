require 'database_connection'
require 'pg'

describe DatabaseConnection do

  describe '#.setup' do
    it 'save a connection to a database to an instance variable' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#.query' do
    it 'executes SQL query string on the correct database' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
