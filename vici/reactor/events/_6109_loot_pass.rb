#          id  6109
# description  拾取已放弃
#         api  loot.loot_pass
#      params  loot_id party_member_id
#        call  vici
#     execute  client

module Vici
  class LootPassEvent < ViciEvent
    include Singleton

    attr_accessor :loot_id
    attr_accessor :party_member_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6109
      Packet.pack([_event_id, @loot_id, @party_member_id, @_channel_id, @_account_id])
    end

    private
      def handler
        LootPassEventHandler.instance
      end
  end
end
