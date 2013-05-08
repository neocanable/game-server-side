#          id  106
# description  清除尸体
#         api  .clear_corpses
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class ClearCorpsesEvent < ViciEvent
    include Singleton

    attr_accessor :tick

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @tick = data[1]
    end


    private
      def handler
        ClearCorpsesEventHandler.instance
      end
  end
end
