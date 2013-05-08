#          id  5107
# description  显示任务对话，进行中
#         api  quest.quest_text_progress
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestTextProgressEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 5107
      Packet.pack([_event_id, @quest_id, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestTextProgressEventHandler.instance
      end
  end
end
