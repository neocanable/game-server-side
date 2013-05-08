#          id  6401
# description  取得玩家称号列表
#         api  title.get_title_list
#      params  
#        call  client
#     execute  vici

module Vici
  class GetTitleListEvent < ViciEvent
    include Singleton

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
      @_tick = data[1]
      @_role_id = data[2]
      @_zone_id = data[3]
      @_scene_id = data[4]
      @_account_id = data[5]
      @_character_id = data[6]
      @_party_id = data[7]
      @_guild_id = data[8]
    end


    private
      def handler
        GetTitleListEventHandler.instance
      end
  end
end
