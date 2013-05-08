#          id  6405
# description  称号已更改
#         api  unit.unit_title_changed
#      params  unit_id new_title_id
#        call  vici
#     execute  client

module Vici
  class UnitTitleChangedEvent < ViciEvent
    include Singleton

    attr_accessor :unit_id
    attr_accessor :new_title_id
    attr_accessor :_channel_id
    attr_accessor :_scene_id


    def dump
      _event_id = 6405
      Packet.pack([_event_id, @unit_id, @new_title_id, @_channel_id, @_scene_id])
    end

    private
      def handler
        UnitTitleChangedEventHandler.instance
      end
  end
end
