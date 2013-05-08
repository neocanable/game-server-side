#          id  6912
# description  制造成功
#         api  craft.craft_create_completed
#      params  
#        call  vici
#     execute  client

module Vici
  class CraftCreateCompletedEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6912
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        CraftCreateCompletedEventHandler.instance
      end
  end
end
