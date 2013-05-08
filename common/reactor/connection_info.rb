module Reactor
  class ConnectionInfo
    attr_accessor :address, :port

    def initialize(address, port)
      @address = address
      @port    = port
    end
  end
end  
