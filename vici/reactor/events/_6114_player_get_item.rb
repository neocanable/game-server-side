#          id  6114
# description  获得物品
#         api  player.player_get_item
#      params  item_id quantity
#        call  vici
#     execute  client

module Vici
  class PlayerGetItemEvent < ViciEvent
    include Singleton

    attr_accessor :item_id
    attr_accessor :quantity
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6114
      Packet.pack([_event_id, @item_id, @quantity, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerGetItemEventHandler.instance
      end
  end
end
