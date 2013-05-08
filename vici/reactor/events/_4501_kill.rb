#          id  4501
# description  击杀
#         api  combat.kill
#      params  killer_unit_id dead_unit_id corpse_id x y
#        call  scene_worker
#     execute  vici

module Vici
  class KillEvent < ViciEvent
    include Singleton

    attr_accessor :killer_unit_id
    attr_accessor :dead_unit_id
    attr_accessor :corpse_id
    attr_accessor :x
    attr_accessor :y
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
      @killer_unit_id = data[1]
      @dead_unit_id = data[2]
      @corpse_id = data[3]
      @x = data[4]
      @y = data[5]
      @_tick = data[6]
      @_role_id = data[7]
      @_zone_id = data[8]
      @_scene_id = data[9]
      @_account_id = data[10]
      @_character_id = data[11]
      @_party_id = data[12]
      @_guild_id = data[13]
    end


    private
      def handler
        KillEventHandler.instance
      end
  end
end
