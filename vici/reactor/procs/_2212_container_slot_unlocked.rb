#          id  2212
# description  背包槽解锁
#         api  container.container_slot_unlocked
#      params  container_index slot_index
#        call  vici
#     execute  client

module Vici
  class ContainerSlotUnlockedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
