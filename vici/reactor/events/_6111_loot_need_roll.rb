#          id  6111
# description  掷骰，选择需求
#         api  loot.loot_need_roll
#      params  loot_id party_member_id number:int
#        call  vici
#     execute  client

module Vici
  class LootNeedRollEvent < ViciEvent
    include Singleton

    attr_accessor :loot_id
    attr_accessor :party_member_id
    attr_accessor :number
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6111
      Packet.pack([_event_id, @loot_id, @party_member_id, @number, @_channel_id, @_account_id])
    end

    private
      def handler
        LootNeedRollEventHandler.instance
      end
  end
end
