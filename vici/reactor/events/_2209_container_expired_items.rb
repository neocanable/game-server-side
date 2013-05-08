#          id  2209
# description  已过期的物品
#         api  container.container_expired_items
#      params  item[container_index slot_index]
#       notes  取得物品列表，或某件物品过期时发给客户端
#        call  vici
#     execute  client

module Vici
  class ContainerExpiredItemsEvent < ViciEvent
    include Singleton

    class Item
      attr_accessor :container_index
      attr_accessor :slot_index
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.container_index, item.slot_index]
      end
      _event_id = 2209
      Packet.pack([_event_id, items, @_channel_id, @_account_id])
    end

    private
      def handler
        ContainerExpiredItemsEventHandler.instance
      end
  end
end
