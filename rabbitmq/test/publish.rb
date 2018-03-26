require 'time'
require 'bunny'
require_relative 'connection'
require_relative 'wait'

include Connection

with_connection do |connection|

  channel = connection.create_channel

  queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)

  # publish
  Wait.until_signalled(0.25) do
    queue.publish("Hello World @ #{Time.now.utc}")
  end

end

puts "Cleanly shutting down"
