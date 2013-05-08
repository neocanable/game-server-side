#          id  5001
# description  与NPC对话
#         api  gossip.gossip_talk
#      params  npc_id
#       notes  
#        call  client
#     execute  vici

module Vici
  class GossipTalkEvent < ViciEvent
    include Singleton

    attr_accessor :npc_id
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
      @npc_id = data[1]
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
        GossipTalkEventHandler.instance
      end
  end
end
