class LootRoll < ActiveRecord::Base
  belongs_to :loot
  belongs_to :character
end
