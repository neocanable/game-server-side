#          id  6904
# description  遗忘技能分支
#         api  craft.craft_abandon_branch
#      params  branch_id
#        call  client
#     execute  vici

module Vici
  class CraftAbandonBranchEventHandler < ViciEventHandler
    def execute(event)
      branch_id = event.branch_id
      raise "Overwrite me!"
    end
  end
end
