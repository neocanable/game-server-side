#          id  6206
# description  装备耐久变化
#         api  merchant.durability_changed
#      params  container_type:int slot_index item_id durability:int max_durability:int
#        call  vici
#     execute  client

module Vici
  class DurabilityChangedEvent < ViciEvent
    include Singleton

    attr_accessor :container_type
    attr_accessor :slot_index
    attr_accessor :item_id
    attr_accessor :durability
    attr_accessor :max_durability
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6206
      Packet.pack([_event_id, @container_type, @slot_index, @item_id, @durability, @max_durability, @_channel_id, @_account_id])
    end

    private
      def handler
        DurabilityChangedEventHandler.instance
      end
  end
end
