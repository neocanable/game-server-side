#          id  6909
# description  制造信息
#         api  craft.craft_info
#      params  branch_id rank:int points:int
#       notes  分支、等级、熟练度
#        call  vici
#     execute  client

module Vici
  class CraftInfoProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
