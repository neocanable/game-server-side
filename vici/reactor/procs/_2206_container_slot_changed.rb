#          id  2206
# description  物品改变
#         api  container.container_slot_changed
#      params  item[container_index slot_index item_id amount]
#        call  vici
#     execute  client

module Vici
  class ContainerSlotChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
