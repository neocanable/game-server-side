#          id  6911
# description  制造
#         api  craft.craft_create
#      params  recipe_id condiment[item_id]
#        call  client
#     execute  vici

module Vici
  class CraftCreateEvent < ViciEvent
    include Singleton

    attr_accessor :recipe_id
    class Condiment
      attr_accessor :item_id
    end
    attr_accessor :condiments
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
      @recipe_id = data[1]
      @condiments = data[2].collect do |arr|
      condiment = Condiment.new
      condiment.item_id = arr[0]
      condiment
      end
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
        CraftCreateEventHandler.instance
      end
  end
end
