#          id  6910
# description  升级制造技能
#         api  craft.craft_upgrade
#      params  branch_id
#        call  client
#     execute  vici

module Vici
  class CraftUpgradeEvent < ViciEvent
    include Singleton

    attr_accessor :branch_id
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
      @branch_id = data[1]
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
        CraftUpgradeEventHandler.instance
      end
  end
end
