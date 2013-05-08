module Vici
  module InterfaceHelper
    def craft_list_event(character, crafts)
      branchs =  crafts.collect do |craft|
        branch = CraftBranchListEvent::BranchList.new
        branch.branch_id = craft.craft_branch_id
        branch
      end

      craft_branch_list(branchs, character.account_id)
    end

    def recipe_list_event(character, branch_id, recipes)
      branch_recipes = recipes.collect do |recipe|
        branch_recipe = CraftRecipeListEvent::Recipe.new
        branch_recipe.recipe_id = recipe.recipe
        branch_recipe
      end

      craft_recipe_list(branch_id, branch_recipes, character.account_id)
    end
  end
end  
