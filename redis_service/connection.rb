module Connection
  def connection
    Redis.new(
      :host     => 'localhost',
      :port     => 9005,
      :db       => 0
    )
  end

  def with_connection
    conn = connection
    yield conn if block_given?
    conn.close
  end
end
