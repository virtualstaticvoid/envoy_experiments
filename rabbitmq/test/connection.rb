module Connection
  def connection
    Bunny.new(
      :host     => 'localhost',
      :port     => 9009,
      :vhost    => 'envoy',
      :user     => 'envoy',
      :password => 's3cr3t'
    )
  end

  def with_connection
    conn = connection
    conn.start
    yield conn if block_given?
    conn.stop
  end
end
