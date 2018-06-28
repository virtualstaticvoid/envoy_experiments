require "sinatra"
# require "sinatra/streaming"
require "time"
require "bunny"
require_relative "connection"

include Connection

use Rack::Logger

helpers do
  def logger
    request.logger
  end
end

get '/' do
  "Use POST /publish"
end

post '/publish' do

  data = params

  with_connection do |connection|
    channel = connection.create_channel
    queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)
    queue.publish("Hello World @ #{Time.now.utc} - #{data}")
  end

  content_type :json
  return { :result => :success }.to_json

end
