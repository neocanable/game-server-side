#          id  6911
# description  制造
#         api  craft.craft_create
#      params  recipe_id condiment[item_id]
#        call  client
#     execute  vici

module Vici
  class CraftCreateEventHandler < ViciEventHandler
    def execute(event)
      recipe_id = event.recipe_id
      event.condiments.each do |condiment|
        item_id = condiment.item_id
      end
      raise "Overwrite me!"
    end
  end
end
