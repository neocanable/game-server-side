#          id  5102
# description  任务列表
#         api  quest.quests
#      params  quest[quest_id objective1:int objective2:int objective3:int objective4:int]
#        call  vici
#     execute  client

module Vici
  class QuestsEvent < ViciEvent
    include Singleton

    class Quest
      attr_accessor :quest_id
      attr_accessor :objective1
      attr_accessor :objective2
      attr_accessor :objective3
      attr_accessor :objective4
    end
    attr_accessor :quests
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      quests = @quests.collect do |quest|
        [quest.quest_id, quest.objective1, quest.objective2, quest.objective3, quest.objective4]
      end
      _event_id = 5102
      Packet.pack([_event_id, quests, @_channel_id, @_account_id])
    end

    private
      def handler
        QuestsEventHandler.instance
      end
  end
end
