#          id  6901
# description  取得制造分支列表
#         api  craft.craft_get_branch_list
#      params  
#        call  client
#     execute  vici

module Vici
  class CraftGetBranchListEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
