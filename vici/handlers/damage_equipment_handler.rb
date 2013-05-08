module Vici
  class << DamageArmorEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character = Character.find_by_id(character_id)
      p "装备损耗没有做"

      ContainerInterface.damage_armors(character)
    end
  end

  class << DamageWeaponEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character = Character.find_by_id(character_id)

      ContainerInterface.damage_weapon(character)
    end
  end
end
