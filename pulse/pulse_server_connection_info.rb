module Pulse
  class PulseServerConnectionInfo < Reactor::ConnectionInfo
    attr_accessor :port, :address

    def initialize(address, port)
      @port    = port
      @address = address
    end
  end
end
