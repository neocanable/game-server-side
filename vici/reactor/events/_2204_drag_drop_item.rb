#          id  2204
# description  拖拽物品
#         api  container.drag_drop_item
#      params  source_container_index source_slot_index dest_container_index dest_slot_index
#        call  client
#     execute  vici

module Vici
  class DragDropItemEvent < ViciEvent
    include Singleton

    attr_accessor :source_container_index
    attr_accessor :source_slot_index
    attr_accessor :dest_container_index
    attr_accessor :dest_slot_index
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
      @source_container_index = data[1]
      @source_slot_index = data[2]
      @dest_container_index = data[3]
      @dest_slot_index = data[4]
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
        DragDropItemEventHandler.instance
      end
  end
end
