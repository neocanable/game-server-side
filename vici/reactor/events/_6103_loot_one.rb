#          id  6103
# description  拾取一件物品
#         api  loot.loot_one
#      params  scene_object_id object_item_id
#        call  client
#     execute  vici

module Vici
  class LootOneEvent < ViciEvent
    include Singleton

    attr_accessor :scene_object_id
    attr_accessor :object_item_id
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
      @object_item_id = data[2]
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
        LootOneEventHandler.instance
      end
  end
end
