#          id  6405
# description  称号已更改
#         api  unit.unit_title_changed
#      params  unit_id new_title_id
#        call  vici
#     execute  client

module Vici
  class UnitTitleChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
