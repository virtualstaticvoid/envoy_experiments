module Connection
  def connection
    Redis.new(
      :host => 'redis_service_sc',  # connect via sidecar
      :port => 6379,
      :db   => 0
    )
  end

  def with_connection
    conn = connection
    yield conn if block_given?
    conn.close
  end
end
