#          id  5106
# description  显示任务对话，描述
#         api  quest.quest_text_description
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestTextDescriptionEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 5106
      Packet.pack([_event_id, @quest_id, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestTextDescriptionEventHandler.instance
      end
  end
end
