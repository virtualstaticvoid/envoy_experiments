require 'dotenv'
Dotenv.load('../.env')

require "pg"
require_relative 'connection'

include Connection

SQL = <<-SQL
  SELECT datname
  FROM pg_catalog.pg_database
  ORDER BY datname;
SQL

with_connection do |connection|

  result = connection.exec(SQL)

  result.each_row do |row|
    puts row
  end

end
