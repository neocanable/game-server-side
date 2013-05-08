#          id  2207
# description  更换装备
#         api  container.update_inventory
#      params  character_id inventory[slot_index]
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateInventoryProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
