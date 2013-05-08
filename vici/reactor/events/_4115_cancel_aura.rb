#          id  4115
# description  取消增益效果
#         api  aura.cancel_aura
#      params  aura_id
#        call  vici
#     execute  scene_worker

module Vici
  class CancelAuraEvent < ViciEvent
    include Singleton

    attr_accessor :aura_id
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 4115
      Packet.pack([_event_id, @aura_id, @_scene_id, @_character_id])
    end

    private
      def handler
        CancelAuraEventHandler.instance
      end
  end
end
