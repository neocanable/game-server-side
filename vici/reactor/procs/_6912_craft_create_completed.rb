#          id  6912
# description  制造成功
#         api  craft.craft_create_completed
#      params  
#        call  vici
#     execute  client

module Vici
  class CraftCreateCompletedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
