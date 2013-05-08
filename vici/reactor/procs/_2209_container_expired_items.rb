#          id  2209
# description  已过期的物品
#         api  container.container_expired_items
#      params  item[container_index slot_index]
#       notes  取得物品列表，或某件物品过期时发给客户端
#        call  vici
#     execute  client

module Vici
  class ContainerExpiredItemsProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
