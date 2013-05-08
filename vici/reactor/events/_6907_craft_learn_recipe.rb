#          id  6907
# description  学习配方
#         api  craft.craft_learn_recipe
#      params  recipe_id
#        call  client
#     execute  vici

module Vici
  class CraftLearnRecipeEvent < ViciEvent
    include Singleton

    attr_accessor :recipe_id
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
        CraftLearnRecipeEventHandler.instance
      end
  end
end
