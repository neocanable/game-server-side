#          id  4008
# description  使用动作
#         api  activity.use_action
#      params  character_id action_id
#        call  vici
#     execute  scene_worker

module Vici
  class UseActionEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :action_id
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 4008
      Packet.pack([_event_id, @character_id, @action_id, @_scene_id, @_character_id])
    end

    private
      def handler
        UseActionEventHandler.instance
      end
  end
end
