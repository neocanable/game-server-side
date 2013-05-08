#          id  1
# description  错误
#         api  exception.error
#      params  error_code:int
#        call  vici
#     execute  client

module Vici
  class ErrorProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
