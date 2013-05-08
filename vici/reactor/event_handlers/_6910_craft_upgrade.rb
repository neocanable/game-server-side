#          id  6910
# description  升级制造技能
#         api  craft.craft_upgrade
#      params  branch_id
#        call  client
#     execute  vici

module Vici
  class CraftUpgradeEventHandler < ViciEventHandler
    def execute(event)
      branch_id = event.branch_id
      raise "Overwrite me!"
    end
  end
end
