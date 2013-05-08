#          id  4302
# description  消耗物品，指定背包位置
#         api  item.consume_specify_position
#      params  character_id static_item_id container_index slot_index
#       notes  指定位置的物品
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeSpecifyPositionEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :static_item_id
    attr_accessor :container_index
    attr_accessor :slot_index
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
      @character_id = data[1]
      @static_item_id = data[2]
      @container_index = data[3]
      @slot_index = data[4]
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
        ConsumeSpecifyPositionEventHandler.instance
      end
  end
end
