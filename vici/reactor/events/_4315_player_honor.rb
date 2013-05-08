#          id  4315
# description  玩家荣誉
#         api  player.player_honor
#      params  honor
#        call  vici
#     execute  client

module Vici
  class PlayerHonorEvent < ViciEvent
    include Singleton

    attr_accessor :honor
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4315
      Packet.pack([_event_id, @honor, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerHonorEventHandler.instance
      end
  end
end
