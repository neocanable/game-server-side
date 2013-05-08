#          id  6906
# description  制造配方列表
#         api  craft.craft_recipe_list
#      params  branch_id recipe[recipe_id]
#        call  vici
#     execute  client

module Vici
  class CraftRecipeListEvent < ViciEvent
    include Singleton

    attr_accessor :branch_id
    class Recipe
      attr_accessor :recipe_id
    end
    attr_accessor :recipes
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      recipes = @recipes.collect do |recipe|
        [recipe.recipe_id]
      end
      _event_id = 6906
      Packet.pack([_event_id, @branch_id, recipes, @_channel_id, @_account_id])
    end

    private
      def handler
        CraftRecipeListEventHandler.instance
      end
  end
end
