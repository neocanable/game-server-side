#          id  6105
# description  拾取包中的物品被拿走
#         api  loot.loot_item_removed
#      params  scene_object_id item[object_item_id]
#        call  vici
#     execute  client

module Vici
  class LootItemRemovedEvent < ViciEvent
    include Singleton

    attr_accessor :scene_object_id
    class Item
      attr_accessor :object_item_id
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.object_item_id]
      end
      _event_id = 6105
      Packet.pack([_event_id, @scene_object_id, items, @_channel_id, @_account_id])
    end

    private
      def handler
        LootItemRemovedEventHandler.instance
      end
  end
end
