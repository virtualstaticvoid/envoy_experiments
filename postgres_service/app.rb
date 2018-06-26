require "sinatra"
require "pg"
require "json"
require_relative 'connection'

include Connection

SQL = <<-SQL
  SELECT *
  FROM public.example
  ORDER BY name;
SQL

get '/' do
  data = {}

  with_connection do |connection|
    result = connection.exec(SQL)
    result.each_row do |row|
      data[row[0]] = {
        :name => row[1],
        :description => row[2]
      }
    end
  end

  content_type :json
  return data.to_json
end
