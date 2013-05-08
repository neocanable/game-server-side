class Scene < ActiveRecord::Base
  class << self
    def find_public_scene(zone_id)
      raise "not a public zone!" unless Zone.is_public?(zone_id)
      find_by_zone_id(zone_id)
    end
  end
end
