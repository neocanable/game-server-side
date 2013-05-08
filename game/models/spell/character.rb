class Spell < ActiveRecord::Base
  class << self
    def create_character_default_spells(character_id)
      # TODO 特殊能力，以后要从spell体系中移除
      create :character_id => character_id, :spell_id => 30800, :rank => 1
      create :character_id => character_id, :spell_id => 30600, :rank => 1
      create :character_id => character_id, :spell_id => 10000, :rank => 1
  
      create :character_id => character_id, :spell_id => 10100, :rank => 1
      create :character_id => character_id, :spell_id => 10200, :rank => 1
      create :character_id => character_id, :spell_id => 10300, :rank => 1

      create :character_id => character_id, :spell_id => 10000, :rank => 1
  
      # 以下是测试技能，正式版将移除
      #    create :character_id => character_id, :spell_id => 30700, :rank => 1
      #    create :character_id => character_id, :spell_id => 30900, :rank => 1
      #    create :character_id => character_id, :spell_id => 31000, :rank => 1
      #    create :character_id => character_id, :spell_id => 31100, :rank => 1
      #    create :character_id => character_id, :spell_id => 31200, :rank => 1
      #    create :character_id => character_id, :spell_id => 31300, :rank => 1
      #    create :character_id => character_id, :spell_id => 31400, :rank => 1
    end

    def character_spells(character_id)
      find(:all, :conditions => ["character_id=?", character_id])
    end


    def learn(spell_id, character_id)
      character = Character.find_by_id(character_id)
      static_base_spell = static_base_spell(spell_id)
      spell = character.specify_spell(spell_id)
      rank = spell.nil? ? 0 : spell.rank
      next_rank = rank + 1
      static_spell = Vici::Code.find2(:SPELL, "spell_base_id", "rank", spell_id, next_rank)
      raise MaxSpellLevelError if next_rank > static_base_spell["max_rank"].to_i
      money = static_spell["money"].to_i

      #raise InvalidProfessionError unless advanced_professions(character.profession).include?(static_base_spell["profession"].to_i)
      raise NotEnoughSpellPointsError unless character.can_learn_spell?
      raise NotEnoughMoneyError unless character.has_enough_money?(money)
      #raise MaxSpellLevelError if next_rank > static_base_spell["max_rank"].to_i
      raise LevelTooLowError if character.level < static_spell["level_required"].to_i

      Spell.transaction do
        if spell.nil? # 技能未学习
          spell = Spell.create :character_id => character.id, :spell_id => spell_id, :rank => 1
        else
          spell.rank = next_rank
          spell.save
        end
        character.spend_spell_points!
        character.spend_money!(money)
      end
      info_logger.learn_spell_spend(character.id, character.level, character.profession, spell_id, money)

      spell
    end

    def unspent_points(character_id)
      character = Character.find_by_id(character_id)
      character.unspent_points
    end

  end
end
