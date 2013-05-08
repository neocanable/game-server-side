#          id  6906
# description  制造配方列表
#         api  craft.craft_recipe_list
#      params  branch_id recipe[recipe_id]
#        call  vici
#     execute  client

module Vici
  class CraftRecipeListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
