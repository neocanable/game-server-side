require File.expand_path(File.dirname(__FILE__) + "/loot/character")
class Loot < ActiveRecord::Base
  has_many :loot_rolls
  belongs_to :scene_object_item
  belongs_to :party

  def finished?
    return true if elapses_at < Time.now.to_i - 30
    loot_rolls.each do |roll|
      return false if roll.option_id.nil?
    end
    true
  end

  def roll(option, character)
    number = option == Vici::LootOption::PASS ? -1 : rand_range(1,100)
    roll           = LootRoll.first(:conditions => ["loot_id=? AND character_id=?",self.id, character.id])
    return nil if roll.nil?
    roll.number    = number
    roll.option_id = option
    roll.save
    roll
  end

  def create_rolls(party, character)
    party.same_scene_characters(character).each do |member|
      LootRoll.create :loot_id => self.id, :character_id => member.id, :option_id => nil, :number => -1
    end
  end

  private
    def rand_range(min, max)
      min + rand(max - min)
    end

end
