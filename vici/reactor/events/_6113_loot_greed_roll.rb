#          id  6113
# description  掷骰，选择贪婪
#         api  loot.loot_greed_roll
#      params  loot_id party_member_id number:int
#        call  vici
#     execute  client

module Vici
  class LootGreedRollEvent < ViciEvent
    include Singleton

    attr_accessor :loot_id
    attr_accessor :party_member_id
    attr_accessor :number
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6113
      Packet.pack([_event_id, @loot_id, @party_member_id, @number, @_channel_id, @_account_id])
    end

    private
      def handler
        LootGreedRollEventHandler.instance
      end
  end
end
