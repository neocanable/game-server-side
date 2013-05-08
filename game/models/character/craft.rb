class Character < ActiveRecord::Base
  def learn_recipe(recipe_id)
    static_recipe = static_recipe(recipe_id)
    recipe = self.recipes.first(:conditions => ["recipe=?", recipe_id])
    recipe = self.recipes.create(:craft_branch_id => static_recipe["craft"].to_i, :recipe => recipe_id) unless recipe
    recipe
  end
end
