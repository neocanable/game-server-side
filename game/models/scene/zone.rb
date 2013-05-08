class Scene < ActiveRecord::Base

  def self.is_public_zone?(zone_id)
    zone = static_zone(zone_id)
    zone['type'] == Vici::ZoneType::SAFETY_AREA || zone['type'] == Vici::ZoneType::WILD_AREA
  end

  def self.graveyard(zone_id)
    zone = static_zone(zone_id)
    graveyard_zone_id = zone['graveyard']
    graveyard = static_location(graveyard_zone_id)
    return graveyard['zone'], graveyard['x'], graveyard['y'], graveyard['o']
  end

  def can_enter_zone?(zone_id, level)
    zone = static_zone(zone_id)
    levle > zone["levle_required"] 
  end

end
