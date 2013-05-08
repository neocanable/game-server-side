#          id  6908
# description  取得制造信息
#         api  craft.craft_get_info
#      params  branch_id
#        call  client
#     execute  vici

module Vici
  class CraftGetInfoEventHandler < ViciEventHandler
    def execute(event)
      branch_id = event.branch_id
      raise "Overwrite me!"
    end
  end
end
