#          id  6804
# description  赠送
#         api  mall.mall_give
#      params  mall_item_id quantity currency:int target_character_name
#        call  client
#     execute  vici

module Vici
  class MallGiveEvent < ViciEvent
    include Singleton

    attr_accessor :mall_item_id
    attr_accessor :quantity
    attr_accessor :currency
    attr_accessor :target_character_name
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
      @target_character_name = data[4]
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
        MallGiveEventHandler.instance
      end
  end
end
