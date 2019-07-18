require 'pg'
class DatabaseConnection

  def initialize
    @connection
  end

  def self.setup(database_name)
    result = PG.connect(dbname: database_name)
    @connection = result
  end

  def self.query(sql_query)
    @connection.exec(sql_query)
  end

  def self.connection
    @connection
  end
end
