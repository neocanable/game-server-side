#          id  2106
# description  交换动作栏
#         api  action_bar.action_bar_swap
#      params  slot1:int slot2:int
#        call  client
#     execute  vici

module Vici
  class ActionBarSwapEvent < ViciEvent
    include Singleton

    attr_accessor :slot1
    attr_accessor :slot2
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
      @slot1 = data[1]
      @slot2 = data[2]
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
        ActionBarSwapEventHandler.instance
      end
  end
end
