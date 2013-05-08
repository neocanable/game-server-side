class Recipe < ActiveRecord::Base
  class << self
    def all_recipe_material(static_recipe)
      raise ArgumentError, "Missing block" unless block_given?
      (1..Vici::RECIPE_MAX_MATERIALS).each do |n|
        material_id = static_recipe["m#{n}"]
        amount = static_recipe["c#{n}"]
        yield(material_id, amount) if material_id and amount
      end
    end
  end
end
