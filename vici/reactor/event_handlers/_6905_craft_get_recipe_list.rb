#          id  6905
# description  取得制造配方列表
#         api  craft.craft_get_recipe_list
#      params  branch_id
#        call  client
#     execute  vici

module Vici
  class CraftGetRecipeListEventHandler < ViciEventHandler
    def execute(event)
      branch_id = event.branch_id
      raise "Overwrite me!"
    end
  end
end
