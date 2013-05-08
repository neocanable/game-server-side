#          id  6907
# description  学习配方
#         api  craft.craft_learn_recipe
#      params  recipe_id
#        call  client
#     execute  vici

module Vici
  class CraftLearnRecipeEventHandler < ViciEventHandler
    def execute(event)
      recipe_id = event.recipe_id
      raise "Overwrite me!"
    end
  end
end
