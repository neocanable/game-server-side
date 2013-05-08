class Item < ActiveRecord::Base
  before_create :add_attributes
  after_create :release_durability

  LOST_MAX_DUR_1 = 0.3
  LOST_MAX_DUR_2 = 0.5
  INCREASE_MAX_DUR_1 = 0.05
  INCREASE_MAX_DUR_2 = 0.1

  EQUIPMENT_ATTRIBUTES = %w(
    strength intellect vitality 
    hit_rating crit_rating dodge_rating 
    min_attack max_attack damage defense 
    spell_min_attack spell_max_attack spell_damage spell_defense 
    max_health health_regeneration 
    max_power power_regeneration 
    attack_speed move_speed 
    durability
  ).freeze

  private
    
    def release_durability
      if static_item(self.static_item_id)["item_type"].to_i == Vici::ItemType::EQUIPMENT
        self.durability = 10
        save!
      end
    end

    def add_attributes
      static_item = static_item(self.static_item_id)
      if static_item["item_type"].to_i == Vici::ItemType::EQUIPMENT
        static_equipment = static_equipment(self.static_item_id)
        return unless static_equipment
        Item::EQUIPMENT_ATTRIBUTES.each do |attr|
          self.send("#{attr}=", static_equipment[attr])
        end
        self.max_durability = static_equipment["durability"].to_i # 最大耐久
      end
      #add_expired_time(static_item["expiry_time"])
    end

    def add_expired_time(expiry_time)
      self.expired = Time.now + expiry_time*60 if expiry_time
    end
end
