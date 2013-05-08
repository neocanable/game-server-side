#          id  4010
# description  使用物品
#         api  activity.use_consumable
#      params  character_id static_item_id container_index slot_index
#        call  vici
#     execute  scene_worker

module Vici
  class UseConsumableEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :static_item_id
    attr_accessor :container_index
    attr_accessor :slot_index
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 4010
      Packet.pack([_event_id, @character_id, @static_item_id, @container_index, @slot_index, @_scene_id, @_character_id])
    end

    private
      def handler
        UseConsumableEventHandler.instance
      end
  end
end
