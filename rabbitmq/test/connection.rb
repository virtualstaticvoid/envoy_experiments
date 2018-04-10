module Connection
  def connection
    Bunny.new(
      :host     => 'localhost',
      :port     => 9009,
      :vhost    => ENV['RABBITMQ_DEFAULT_VHOST'],
      :user     => ENV['RABBITMQ_DEFAULT_USER'],
      :password => ENV['RABBITMQ_DEFAULT_PASS']
    )
  end

  def with_connection
    conn = connection
    conn.start
    yield conn if block_given?
    conn.stop
  end
end
