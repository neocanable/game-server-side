class Zone
  extend StaticHelper 

  def self.is_public_zone?(zone_id)
    zone = static_zone(zone_id)
    zone["type"] == Vici::ZoneType::SANCTUARY || zone["type"] == Vici::ZoneType::OUTDOOR
  end

  def self.graveyard(zone_id)
    zone = static_zone(zone_id)
    graveyard_zone_id = zone['graveyard']
    graveyard = static_location(graveyard_zone_id)
    return graveyard['zone'], graveyard['x'], graveyard['y'], graveyard['o']
  end

end
