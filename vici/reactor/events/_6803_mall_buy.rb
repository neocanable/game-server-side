#          id  6803
# description  购买
#         api  mall.mall_buy
#      params  mall_item_id quantity currency:int
#        call  client
#     execute  vici

module Vici
  class MallBuyEvent < ViciEvent
    include Singleton

    attr_accessor :mall_item_id
    attr_accessor :quantity
    attr_accessor :currency
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
      @mall_item_id = data[1]
      @quantity = data[2]
      @currency = data[3]
      @_tick = data[4]
      @_role_id = data[5]
      @_zone_id = data[6]
      @_scene_id = data[7]
      @_account_id = data[8]
      @_character_id = data[9]
      @_party_id = data[10]
      @_guild_id = data[11]
    end


    private
      def handler
        MallBuyEventHandler.instance
      end
  end
end
