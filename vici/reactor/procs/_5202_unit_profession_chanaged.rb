#          id  5202
# description  单位转职
#         api  unit.unit_profession_chanaged
#      params  unit_id new_profession_id
#        call  vici
#     execute  client

module Vici
  class UnitProfessionChanagedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
