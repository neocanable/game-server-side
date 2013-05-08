#          id  4308
# description  损伤护甲
#         api  inventory.damage_armor
#      params  character_id
#        call  scene_worker
#     execute  vici

module Vici
  class DamageArmorEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      raise "Overwrite me!"
    end
  end
end
