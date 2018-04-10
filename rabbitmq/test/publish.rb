require_relative 'app'

include Connection

with_connection do |connection|

  channel = connection.create_channel

  queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)

  puts "Publishing to queue [#{queue}]"

  # publish
  Wait.until_signalled(0.25) do
    queue.publish("Hello World @ #{Time.now.utc}")
  end

end

puts "Cleanly shutting down"
