#          id  2207
# description  更换装备
#         api  container.update_inventory
#      params  character_id inventory[slot_index]
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateInventoryEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    class Inventory
      attr_accessor :slot_index
    end
    attr_accessor :inventorys
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      inventorys = @inventorys.collect do |inventory|
        [inventory.slot_index]
      end
      _event_id = 2207
      Packet.pack([_event_id, @character_id, inventorys, @_scene_id, @_character_id])
    end

    private
      def handler
        UpdateInventoryEventHandler.instance
      end
  end
end
