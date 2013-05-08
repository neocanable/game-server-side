#          id  5111
# description  任务已接受
#         api  quest.quest_accepted
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestAcceptedEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 5111
      Packet.pack([_event_id, @quest_id, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestAcceptedEventHandler.instance
      end
  end
end
