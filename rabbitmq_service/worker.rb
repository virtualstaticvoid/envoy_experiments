require "json"
require "bunny"
require "logger"
require_relative "connection"

include Connection

logger = Logger.new(STDOUT)
logger.level = Logger::WARN
logger.info "Worker starting up..."

with_connection do |connection|

  channel = connection.create_channel

  queue = channel.queue("test", :auto_delete => false, :durable => true, :exclusive => false)

  logger.info "Worker subscription started..."

  queue.subscribe(:block => true, :exclusive => false, :manual_ack => true) do |delivery_info, metadata, payload|

    # do something useful with the message ;-)
    logger.info({:message => payload}.to_json)

    channel.ack(delivery_info.delivery_tag, false)

  end

end
