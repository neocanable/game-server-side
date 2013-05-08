#          id  4009
# description  使用背包物品
#         api  activity.use_container_item
#      params  container_index slot_index
#        call  client
#     execute  vici

module Vici
  class UseContainerItemEvent < ViciEvent
    include Singleton

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
      @container_index = data[1]
      @slot_index = data[2]
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
        UseContainerItemEventHandler.instance
      end
  end
end
