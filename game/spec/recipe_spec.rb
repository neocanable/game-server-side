require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")


describe Recipe do
  include PrepareHelper

  before do 
    prepare_character
  end

  it "should raise error when not give block" do 
    recipe = static_recipe(81)
    lambda{Recipe.all_recipe_material(static_recipe)}.should raise_error
  end

  it "should return recipe materials" do
    recipe = static_recipe(81)
    #Recipe.all_recipe_material(recipe).collect{|e| e }.size == 2
    recipes = []
    Recipe.all_recipe_material(recipe) do |item_id, count|
      recipes << [item_id, count]
    end
    recipes.size.should == 2
    recipes.include?([85,1]).should be_true
    recipes.include?([86,10]).should be_true
  end

  it "can learn a recipe" do 
    @character.learn_recipe(81)
    @character.recipes.size.should == 1
  end

  it "should return recipe if character already learned the recipe" do 
    recipe = @character.learn_recipe(81)
    recipe1 = @character.learn_recipe(81)
    recipe.should == recipe1
  end

end
