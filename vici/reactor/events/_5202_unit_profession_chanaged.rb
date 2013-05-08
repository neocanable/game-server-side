#          id  5202
# description  单位转职
#         api  unit.unit_profession_chanaged
#      params  unit_id new_profession_id
#        call  vici
#     execute  client

module Vici
  class UnitProfessionChanagedEvent < ViciEvent
    include Singleton

    attr_accessor :unit_id
    attr_accessor :new_profession_id
    attr_accessor :_channel_id
    attr_accessor :_scene_id


    def dump
      _event_id = 5202
      Packet.pack([_event_id, @unit_id, @new_profession_id, @_channel_id, @_scene_id])
    end

    private
      def handler
        UnitProfessionChanagedEventHandler.instance
      end
  end
end
