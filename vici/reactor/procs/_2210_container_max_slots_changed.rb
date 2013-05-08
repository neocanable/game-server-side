#          id  2210
# description  背包容量变更
#         api  container.container_max_slots_changed
#      params  container_index max_slots:int
#        call  vici
#     execute  client

module Vici
  class ContainerMaxSlotsChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
