require 'dotenv'
Dotenv.load('../.env')

require "redis"
require_relative 'connection'

include Connection

with_connection do |connection|

	connection.set("foo", "bar")

	puts connection.get("foo")

end
