#          id  108
# description  恢复玩家精力值
#         api  .update_players_vigor
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class UpdatePlayersVigorEvent < ViciEvent
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
        UpdatePlayersVigorEventHandler.instance
      end
  end
end
