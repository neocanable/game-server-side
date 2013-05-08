#          id  2212
# description  背包槽解锁
#         api  container.container_slot_unlocked
#      params  container_index slot_index
#        call  vici
#     execute  client

module Vici
  class ContainerSlotUnlockedEvent < ViciEvent
    include Singleton

    attr_accessor :container_index
    attr_accessor :slot_index
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 2212
      Packet.pack([_event_id, @container_index, @slot_index, @_channel_id, @_account_id])
    end

    private
      def handler
        ContainerSlotUnlockedEventHandler.instance
      end
  end
end
