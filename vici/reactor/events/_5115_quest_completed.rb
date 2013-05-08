#          id  5115
# description  任务已完成
#         api  quest.quest_completed
#      params  quest_id next_quest_id
#        call  vici
#     execute  client

module Vici
  class QuestCompletedEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :next_quest_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 5115
      Packet.pack([_event_id, @quest_id, @next_quest_id, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestCompletedEventHandler.instance
      end
  end
end
