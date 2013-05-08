#          id  2205
# description  拆分物品
#         api  container.split_item
#      params  container_index source_slot_index dest_slot_index dest_amount:int
#        call  client
#     execute  vici

module Vici
  class SplitItemEvent < ViciEvent
    include Singleton

    attr_accessor :container_index
    attr_accessor :source_slot_index
    attr_accessor :dest_slot_index
    attr_accessor :dest_amount
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
      @source_slot_index = data[2]
      @dest_slot_index = data[3]
      @dest_amount = data[4]
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
        SplitItemEventHandler.instance
      end
  end
end
