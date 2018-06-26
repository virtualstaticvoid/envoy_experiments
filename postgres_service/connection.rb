module Connection
  def connection
    PG::Connection.new(
      :host     => 'localhost',
      :port     => 9007,
      :user     => ENV['POSTGRES_USER'],
      :password => ENV['POSTGRES_PASSWORD'],
      :dbname   => 'postgres'
    )
  end

  def with_connection
    conn = connection
    yield conn if block_given?
    conn.close
  end
end
