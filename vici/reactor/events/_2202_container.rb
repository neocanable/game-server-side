#          id  2202
# description  背包物品
#         api  container.container
#      params  container_index max_slots:int item[slot_index item_id amount]
#        call  vici
#     execute  client

module Vici
  class ContainerEvent < ViciEvent
    include Singleton

    attr_accessor :container_index
    attr_accessor :max_slots
    class Item
      attr_accessor :slot_index
      attr_accessor :item_id
      attr_accessor :amount
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.slot_index, item.item_id, item.amount]
      end
      _event_id = 2202
      Packet.pack([_event_id, @container_index, @max_slots, items, @_channel_id, @_account_id])
    end

    private
      def handler
        ContainerEventHandler.instance
      end
  end
end
