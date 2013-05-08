class Item < ActiveRecord::Base


  def need_repair? 
    self.durability < self.max_durability
  end

  def is_broken?
    max = self.max_durability 
    max = @max_durability_after_repaired if @max_durability_after_repaired !=nil
    max == 0 or (self.durability == 0 and max == 1)
  end

  def lost_max_durability
    min = ((self.durability + self.max_durability) * LOST_MAX_DUR_1).floor
    max = ((self.durability + self.max_durability) * LOST_MAX_DUR_2).floor
    @max_durability_after_repaired ||= min + rand(max-min)
  end

  def increase_max_durability!
    min = ( self.max_durability * INCREASE_MAX_DUR_1).floor
    max = ( self.max_durability * INCREASE_MAX_DUR_2).floor
    self.max_durability += (min + rand(max-min))
    self.durability = self.max_durability
    save!
  end

  REPAIR_COST = {
    Vici::ItemQuality::D => 1, 
    Vici::ItemQuality::C => 2, 
    Vici::ItemQuality::B => 4, 
    Vici::ItemQuality::A => 8, 
    Vici::ItemQuality::S => 16, 
  }.freeze

  SUPER_REPAIR_COST = {
    Vici::ItemQuality::D => 1, 
    Vici::ItemQuality::C => 4, 
    Vici::ItemQuality::B => 16, 
    Vici::ItemQuality::A => 64, 
    Vici::ItemQuality::S => 256, 
  }.freeze

  def repair_cost
    durability_repaired = self.lost_max_durability - self.durability
    durability_repaired * REPAIR_COST[self.quality]
  end

  def super_repair_cost
    durability_repaired = self.max_durability - self.durability
    durability_repaired * SUPER_REPAIR_COST[self.quality]
  end

  def repair!
    raise unless @max_durability_after_repaired
    self.durability = self.max_durability = @max_durability_after_repaired 
    @max_durability_after_repaired = nil
    save!
  end

  def super_repair!
    self.durability = self.max_durability
    save!
  end

  def quality
    static_item(self.static_item_id)["quality"]
  end

end

