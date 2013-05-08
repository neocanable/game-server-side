module Vici
  class << CraftGetBranchListEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      CraftInterface.get_craft_list(character)
    end
  end

  class << CraftLearnBranchEventHandler.instance
    def execute(event)
      branch_id = event.branch_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     

      CraftInterface.learn_craft_branch(character, branch_id)
    end
  end

  class << CraftAbandonBranchEventHandler.instance
    def execute(event)
      branch_id = event.branch_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      CraftInterface.abandon_craft_branch(character, branch_id)
    end
  end

  class << CraftGetRecipeListEventHandler.instance
    def execute(event)
      branch_id = event.branch_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      CraftInterface.get_recipe_list(character, branch_id)
    end
  end

  class << CraftLearnRecipeEventHandler.instance
    def execute(event)
      recipe_id = event.recipe_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     
    
      CraftInterface.learn_craft_recipe(character, recipe_id)
    end
  end

  class << CraftGetInfoEventHandler.instance
    def execute(event)
      branch_id = event.branch_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     
      CraftInterface.get_branch_info(character, branch_id)
    end
  end

  class << CraftUpgradeEventHandler.instance
    def execute(event)
      branch_id = event.branch_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)
      CraftInterface.upgrade_craft(character, branch_id)
    end
  end

  class << CraftCreateEventHandler.instance
    def execute(event)
      recipe_id = event.recipe_id
      # event.condiments.each do |condiment|
      #   item_id = condiment.item_id
      # end
      condiments = event.condiments.collect{|condiment| condiment.item_id}    
      character_id = event._character_id
      character    = Character.find_by_id(character_id)
      CraftInterface.create_items_with_recipe(character, recipe_id, condiments)
    end
  end
end
