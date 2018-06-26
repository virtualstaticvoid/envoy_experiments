require "sinatra"
require "redis"
require "json"
require_relative 'connection'

include Connection

get '/' do
  data = {}

  with_connection do |connection|
    connection.set("foo", "bar")

    data[:foo] = connection.get("foo")
  end

  content_type :json
  return data.to_json
end
