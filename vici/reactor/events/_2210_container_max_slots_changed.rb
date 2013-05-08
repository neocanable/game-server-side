#          id  2210
# description  背包容量变更
#         api  container.container_max_slots_changed
#      params  container_index max_slots:int
#        call  vici
#     execute  client

module Vici
  class ContainerMaxSlotsChangedEvent < ViciEvent
    include Singleton

    attr_accessor :container_index
    attr_accessor :max_slots
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 2210
      Packet.pack([_event_id, @container_index, @max_slots, @_channel_id, @_account_id])
    end

    private
      def handler
        ContainerMaxSlotsChangedEventHandler.instance
      end
  end
end
