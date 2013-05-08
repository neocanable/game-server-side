#          id  2104
# description  设置物品
#         api  action_bar.action_bar_set_item
#      params  slot_index item_id
#        call  client
#     execute  vici

module Vici
  class ActionBarSetItemEvent < ViciEvent
    include Singleton

    attr_accessor :slot_index
    attr_accessor :item_id
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
      @slot_index = data[1]
      @item_id = data[2]
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
        ActionBarSetItemEventHandler.instance
      end
  end
end
