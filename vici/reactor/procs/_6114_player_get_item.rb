#          id  6114
# description  获得物品
#         api  player.player_get_item
#      params  item_id quantity
#        call  vici
#     execute  client

module Vici
  class PlayerGetItemProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
