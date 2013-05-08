#          id  4505
# description  单位升级
#         api  unit.unit_level_up
#      params  unit_id level
#        call  vici
#     execute  client

module Vici
  class UnitLevelUpEvent < ViciEvent
    include Singleton

    attr_accessor :unit_id
    attr_accessor :level
    attr_accessor :_channel_id
    attr_accessor :_scene_id


    def dump
      _event_id = 4505
      Packet.pack([_event_id, @unit_id, @level, @_channel_id, @_scene_id])
    end

    private
      def handler
        UnitLevelUpEventHandler.instance
      end
  end
end
