#          id  2211
# description  背包槽锁定
#         api  container.container_slot_locked
#      params  container_index slot_index
#        call  vici
#     execute  client

module Vici
  class ContainerSlotLockedEvent < ViciEvent
    include Singleton

    attr_accessor :container_index
    attr_accessor :slot_index
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 2211
      Packet.pack([_event_id, @container_index, @slot_index, @_channel_id, @_account_id])
    end

    private
      def handler
        ContainerSlotLockedEventHandler.instance
      end
  end
end
