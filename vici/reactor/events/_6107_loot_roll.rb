#          id  6107
# description  需要掷骰决定的拾取
#         api  loot.loot_roll
#      params  loot_id static_item_id quantity
#        call  vici
#     execute  client

module Vici
  class LootRollEvent < ViciEvent
    include Singleton

    attr_accessor :loot_id
    attr_accessor :static_item_id
    attr_accessor :quantity
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6107
      Packet.pack([_event_id, @loot_id, @static_item_id, @quantity, @_channel_id, @_account_id])
    end

    private
      def handler
        LootRollEventHandler.instance
      end
  end
end
