require 'json'
module Reactor
  class Packet
    def initialize(streamd_packet)
      @streamd_packet = streamd_packet
    end

    def unpack
      JSON.parse(@streamd_packet)
    end

    def pack
      str = @streamd_packet
      length = str.size.to_s.reverse
      (4 - str.size.to_s.size).times do 
        length.concat("0") 
      end
      length.reverse.concat(str)
    end

    def self.pack(array)
      str = array.to_json
      new(str)
    end
  
    def get_id
      unpack.first
    end


  end
end
