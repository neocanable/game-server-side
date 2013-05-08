#          id  4307
# description  损伤武器
#         api  inventory.damage_weapon
#      params  character_id
#        call  scene_worker
#     execute  vici

module Vici
  class DamageWeaponEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      raise "Overwrite me!"
    end
  end
end
