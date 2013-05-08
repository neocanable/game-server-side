#          id  6801
# description  商城
#         api  mall.get_mall_list
#      params  tab:int page
#        call  client
#     execute  vici

module Vici
  class GetMallListEvent < ViciEvent
    include Singleton

    attr_accessor :tab
    attr_accessor :page
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
      @tab = data[1]
      @page = data[2]
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
        GetMallListEventHandler.instance
      end
  end
end
