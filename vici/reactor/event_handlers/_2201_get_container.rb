#          id  2201
# description  取得背包物品
#         api  container.get_container
#      params  container_index
#        call  client
#     execute  vici

module Vici
  class GetContainerEventHandler < ViciEventHandler
    def execute(event)
      container_index = event.container_index
      raise "Overwrite me!"
    end
  end
end
