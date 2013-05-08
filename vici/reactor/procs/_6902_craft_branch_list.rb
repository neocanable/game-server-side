#          id  6902
# description  制造分支列表
#         api  craft.craft_branch_list
#      params  branch_list[branch_id]
#        call  vici
#     execute  client

module Vici
  class CraftBranchListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
