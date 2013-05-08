class Character < ActiveRecord::Base
  def spend_spell_points!(amount = 1)
    self.unspent_points -= amount
    save!
  end

  def can_learn_spell?
    self.unspent_points >= 1
  end

  def specify_spell(spell_id)
    Spell.first(:conditions => ["character_id=? AND spell_id=?", self.id, spell_id])
  end
end
