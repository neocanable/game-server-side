#module CharacterGrowth

class Character < ActiveRecord::Base

  def is_level_high_enough?(level_required)
    level_required <= self.level
  end

# ---------------------------------------------------------------- level
  CHARACTER_MAX_LEVEL = 150


  def gain_xp!(xp)
    self.xp = 0 if self.xp.nil?
    self.xp += xp.to_i      
    save!
  end

  def reset_xp!
    self.xp = 0
    save!
  end

  def level_up!
    return false if self.level >= CHARACTER_MAX_LEVEL
    has_level_up = false
    while self.xp_enough_to_level_up?
      break if self.level_locked?
      self.xp -= static_xp["xp"]
      self.level += 1
      self.unspent_points += 1
      save!
      has_level_up = true
      Container.unlock_bank(self) if to_unlock_bank?
    end  
    has_level_up
  end

  def reset_level!
    self.level = 1
    self.xp = 0
    self.unspent_points = 1
    save!
  end

  def set_level(level)
    max_level = static_profession["max_level"]
    level = max_level if level > max_level
    self.level = level
    self.xp = 0
    self.unspent_points = level
    save!
  end

  def xp_enough_to_level_up?
    self.xp >= static_xp["xp"]
  end


# ---------------------------------------------------------------- change profession
  def can_change_profression_to?(new_profession_id)
    return false unless level_locked?
    new_profession = Vici::Code.first(:PROFESSION, 'profession', new_profession_id)
    return false unless new_profession
    new_profession['prev_profession'] == self.profession
  end

  def level_locked?
    self.level == static_profession["max_level"]
  end

  def change_profession!(new_profession_id)
    self.profession = new_profession_id
    save!
  end

  def to_unlock_bank?
    [10, 20, 30, 40].include?(self.level)
  end

  private
    
    def static_profession
      Vici::Code.first(:PROFESSION, 'profession', self.profession)
    end

    def static_xp
      Vici::Code.first(:XP, 'level', self.level)
    end


end
