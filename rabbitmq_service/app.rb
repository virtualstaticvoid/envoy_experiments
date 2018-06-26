require "sinatra"
require "sinatra/streaming"
require "time"
require "bunny"
require_relative "connection"

include Connection

get '/' do
  "Use /publish or /subscribe"
end

get '/publish' do

  id = with_connection do |connection|
    channel = connection.create_channel
    queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)
    queue.publish("Hello World @ #{Time.now.utc}")
  end

  content_type :json
  return { :id => id }.to_json
end

get '/subscribe' do

  content_type :json

  stream do |out|
    with_connection do |connection|
      channel = connection.create_channel
      queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)

      queue.subscribe(:block => true, :exclusive => false, :manual_ack => true) do |delivery_info, metadata, payload|
        out.puts({:message => payload}.to_json)
        channel.acknowledge(delivery_info.delivery_tag, false)
        out.flush
      end
    end
  end
end
