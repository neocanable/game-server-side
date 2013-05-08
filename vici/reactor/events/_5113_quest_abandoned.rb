#          id  5113
# description  任务已放弃
#         api  quest.quest_abandoned
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestAbandonedEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 5113
      Packet.pack([_event_id, @quest_id, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestAbandonedEventHandler.instance
      end
  end
end
