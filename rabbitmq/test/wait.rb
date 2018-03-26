class Wait
  class << self
    def until_signalled(interval=1, &block)
      new.wait(interval, &block)
    end
  end

  def initialize
    @stop = false
    Kernel.trap("INT") { @stop = true }
    Kernel.trap("TERM") { @stop = true }
  end

  def wait(interval)
    loop do
      break if @stop
      yield if block_given?
      sleep interval
    end
  end
end
