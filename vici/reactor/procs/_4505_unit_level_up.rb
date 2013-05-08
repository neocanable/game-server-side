#          id  4505
# description  单位升级
#         api  unit.unit_level_up
#      params  unit_id level
#        call  vici
#     execute  client

module Vici
  class UnitLevelUpProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
