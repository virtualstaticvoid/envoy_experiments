require_relative 'app'

include Connection

with_connection do |connection|

  channel = connection.create_channel

  queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)

  queue.subscribe(:block => false, :exclusive => false, :manual_ack => true) do |delivery_info, metadata, payload|
    puts payload

    channel.acknowledge(delivery_info.delivery_tag, false)
  end

  Wait.until_signalled

end

puts "Cleanly shutting down"
