#          id  2206
# description  物品改变
#         api  container.container_slot_changed
#      params  item[container_index slot_index item_id amount]
#        call  vici
#     execute  client

module Vici
  class ContainerSlotChangedEvent < ViciEvent
    include Singleton

    class Item
      attr_accessor :container_index
      attr_accessor :slot_index
      attr_accessor :item_id
      attr_accessor :amount
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.container_index, item.slot_index, item.item_id, item.amount]
      end
      _event_id = 2206
      Packet.pack([_event_id, items, @_channel_id, @_account_id])
    end

    private
      def handler
        ContainerSlotChangedEventHandler.instance
      end
  end
end
