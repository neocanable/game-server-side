#          id  5104
# description  可接任务列表
#         api  quest.available_quests
#      params  quest[quest_id]
#        call  vici
#     execute  client

module Vici
  class AvailableQuestsEvent < ViciEvent
    include Singleton

    class Quest
      attr_accessor :quest_id
    end
    attr_accessor :quests
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      quests = @quests.collect do |quest|
        [quest.quest_id]
      end
      _event_id = 5104
      Packet.pack([_event_id, quests, @_channel_id, @_account_id])
    end

    private
      def handler
        AvailableQuestsEventHandler.instance
      end
  end
end
