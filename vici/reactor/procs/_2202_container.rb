#          id  2202
# description  背包物品
#         api  container.container
#      params  container_index max_slots:int item[slot_index item_id amount]
#        call  vici
#     execute  client

module Vici
  class ContainerProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
