#          id  5109
# description  任务进度
#         api  quest.quest_progress_changed
#      params  quest_id objective1:int objective2:int objective3:int objective4:int
#        call  vici
#     execute  client

module Vici
  class QuestProgressChangedEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :objective1
    attr_accessor :objective2
    attr_accessor :objective3
    attr_accessor :objective4
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 5109
      Packet.pack([_event_id, @quest_id, @objective1, @objective2, @objective3, @objective4, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestProgressChangedEventHandler.instance
      end
  end
end
