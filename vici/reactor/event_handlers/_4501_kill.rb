#          id  4501
# description  击杀
#         api  combat.kill
#      params  killer_unit_id dead_unit_id corpse_id x y
#        call  scene_worker
#     execute  vici

module Vici
  class KillEventHandler < ViciEventHandler
    def execute(event)
      killer_unit_id = event.killer_unit_id
      dead_unit_id = event.dead_unit_id
      corpse_id = event.corpse_id
      x = event.x
      y = event.y
      raise "Overwrite me!"
    end
  end
end
