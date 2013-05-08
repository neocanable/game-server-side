#          id  6506
# description  设置交易物品
#         api  trade.trade_set_item
#      params  trade_slot_index src_container_index src_slot_index quantity
#        call  client
#     execute  vici

module Vici
  class TradeSetItemEvent < ViciEvent
    include Singleton

    attr_accessor :trade_slot_index
    attr_accessor :src_container_index
    attr_accessor :src_slot_index
    attr_accessor :quantity
    attr_accessor :_tick
    attr_accessor :_role_id
    attr_accessor :_zone_id
    attr_accessor :_scene_id
    attr_accessor :_account_id
    attr_accessor :_character_id
    attr_accessor :_party_id
    attr_accessor :_guild_id

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @trade_slot_index = data[1]
      @src_container_index = data[2]
      @src_slot_index = data[3]
      @quantity = data[4]
      @_tick = data[5]
      @_role_id = data[6]
      @_zone_id = data[7]
      @_scene_id = data[8]
      @_account_id = data[9]
      @_character_id = data[10]
      @_party_id = data[11]
      @_guild_id = data[12]
    end


    private
      def handler
        TradeSetItemEventHandler.instance
      end
  end
end
