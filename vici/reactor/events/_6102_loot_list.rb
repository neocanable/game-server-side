#          id  6102
# description  拾取包中的物品
#         api  loot.loot_list
#      params  scene_object_id item[object_item_id static_item_id quantity]
#        call  vici
#     execute  client

module Vici
  class LootListEvent < ViciEvent
    include Singleton

    attr_accessor :scene_object_id
    class Item
      attr_accessor :object_item_id
      attr_accessor :static_item_id
      attr_accessor :quantity
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.object_item_id, item.static_item_id, item.quantity]
      end
      _event_id = 6102
      Packet.pack([_event_id, @scene_object_id, items, @_channel_id, @_account_id])
    end

    private
      def handler
        LootListEventHandler.instance
      end
  end
end
