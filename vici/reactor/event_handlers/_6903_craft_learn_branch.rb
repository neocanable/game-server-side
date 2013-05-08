#          id  6903
# description  学习制造分支
#         api  craft.craft_learn_branch
#      params  branch_id
#        call  client
#     execute  vici

module Vici
  class CraftLearnBranchEventHandler < ViciEventHandler
    def execute(event)
      branch_id = event.branch_id
      raise "Overwrite me!"
    end
  end
end
