module Connection
  def connection
    PG::Connection.new(
      :host     => 'postgres_service_sc',     # connect via sidecar
      :port     => 5432,
      :user     => ENV['POSTGRES_USER'],
      :password => ENV['POSTGRES_PASSWORD'],
      :dbname   => 'exampledb'
    )
  end

  def with_connection
    conn = connection
    yield conn if block_given?
    conn.close
  end
end
