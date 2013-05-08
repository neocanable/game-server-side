#          id  4316
# description  玩家获得荣誉
#         api  player.player_honor_gain
#      params  honor_gained:int honor
#        call  vici
#     execute  client

module Vici
  class PlayerHonorGainEvent < ViciEvent
    include Singleton

    attr_accessor :honor_gained
    attr_accessor :honor
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4316
      Packet.pack([_event_id, @honor_gained, @honor, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerHonorGainEventHandler.instance
      end
  end
end
