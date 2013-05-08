#          id  108
# description  恢复玩家精力值
#         api  .update_players_vigor
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class UpdatePlayersVigorEvent < PulseEvent
    include Singleton

    attr_accessor :tick


    def dump
      _event_id = 108
      Packet.pack([_event_id, @tick])
    end

    private
      def handler
        UpdatePlayersVigorEventHandler.instance
      end
  end
end
