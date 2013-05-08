#          id  4301
# description  消耗物品
#         api  item.consume
#      params  character_id static_item_id
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :static_item_id
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
      @_tick = data[3]
      @_role_id = data[4]
      @_zone_id = data[5]
      @_scene_id = data[6]
      @_account_id = data[7]
      @_character_id = data[8]
      @_party_id = data[9]
      @_guild_id = data[10]
    end


    private
      def handler
        ConsumeEventHandler.instance
      end
  end
end
