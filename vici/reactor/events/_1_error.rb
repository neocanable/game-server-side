#          id  1
# description  错误
#         api  exception.error
#      params  error_code:int
#        call  vici
#     execute  client

module Vici
  class ErrorEvent < ViciEvent
    include Singleton

    attr_accessor :error_code
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 1
      Packet.pack([_event_id, @error_code, @_channel_id, @_account_id])
    end

    private
      def handler
        ErrorEventHandler.instance
      end
  end
end
