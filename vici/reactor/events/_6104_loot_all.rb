#          id  6104
# description  拾取所有物品
#         api  loot.loot_all
#      params  scene_object_id
#        call  client
#     execute  vici

module Vici
  class LootAllEvent < ViciEvent
    include Singleton

    attr_accessor :scene_object_id
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
      @scene_object_id = data[1]
      @_tick = data[2]
      @_role_id = data[3]
      @_zone_id = data[4]
      @_scene_id = data[5]
      @_account_id = data[6]
      @_character_id = data[7]
      @_party_id = data[8]
      @_guild_id = data[9]
    end


    private
      def handler
        LootAllEventHandler.instance
      end
  end
end
