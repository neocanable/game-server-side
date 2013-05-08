module Vici
  class CraftInterface < Interface
    class << self

      def get_craft_list(character)
        crafts = character.crafts

        craft_list_event(character, crafts)
      end

      def learn_craft_branch(character, branch_id)
        craft = character.crafts.first(:conditions => ["craft_branch_id=?", branch_id])
        raise "AlreadyLearnedError" if craft
        character.crafts.create :craft_branch_id => branch_id

        get_craft_list(character)
      end

      def abandon_craft_branch(character, branch_id)
        craft = character.crafts.first(:conditions => ["craft_branch_id=?", branch_id])
        raise "NotLearnError" unless craft
        craft.destroy
        get_craft_list(character)
      end

      def get_recipe_list(character, branch_id)
        recipes = character.recipes.find(:all, :conditions => ["craft_branch_id=?", branch_id])

        recipe_list_event(character, branch_id, recipes)
      end

      def learn_craft_recipe(character, recipe_id)
        recipe = character.recipes.first(:conditions => ["recipe=?", recipe_id])
        raise "AlreadyLearnedError" if recipe
        recipe = character.learn_recipe(recipe_id)
        get_recipe_list(character, recipe.craft_branch_id)
      end

      def get_branch_info(character, branch_id)
        craft = character.crafts.first(:craft_branch_id => branch_id)
        raise "NotLearnError" unless craft
        craft_info(branch_id, craft.rank, craft.points)
      end

      def create_items_with_recipe(character, recipe_id, condiments)
        static_recipe = static_recipe(recipe_id)
        take_away_recipe_items(character, static_recipe)
        item = Item.craft!(character, static_recipe, condiments)
        character_gets_items_event(item.static_item_id, item.quantity, character)
      end


       private
         def take_away_recipe_items(character, static_recipe)
           Recipe.all_recipe_material(static_recipe) do |material_id, amount|
             take_away_stacking_items_event(character, material_id, amount) 
           end
         end

    end
  end
end  
