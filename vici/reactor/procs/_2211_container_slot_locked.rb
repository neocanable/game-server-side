#          id  2211
# description  背包槽锁定
#         api  container.container_slot_locked
#      params  container_index slot_index
#        call  vici
#     execute  client

module Vici
  class ContainerSlotLockedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
