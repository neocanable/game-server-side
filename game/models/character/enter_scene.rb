class Character < ActiveRecord::Base

  def self.birthplace
    location = Vici::LOCATION.find do |k,v|
      v["type"] == Vici::LocationType::BIRTHPLACE
    end
    raise "birthplace undefined" if location.nil?
    location[1]
  end

  # 获取原来所在的场景
  def retrieve_scene
    in_public_zone? ? public_scene : (self.scene || teleport_to_graveyard!)
  end

  def in_public_zone?
    Scene.is_public_zone?(self.static_zone_id)
  end

  def public_scene
    Scene.find_public_scene(self.static_zone_id)
  end

    # 传送至出生点 
  def teleport_to_graveyard!
    puts "---- teleport character to graveyard"
    p self
    graveyard, x, y = Scene.find_graveyard(self.static_zone_id)
    teleport!(graveyard.zone_id, x, y, graveyard.id)
    p self
    graveyard
  end

end
