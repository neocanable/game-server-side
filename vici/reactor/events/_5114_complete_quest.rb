#          id  5114
# description  完成任务
#         api  quest.complete_quest
#      params  quest_id reward_selected:int
#        call  client
#     execute  vici

module Vici
  class CompleteQuestEvent < ViciEvent
    include Singleton

    attr_accessor :quest_id
    attr_accessor :reward_selected
    attr_accessor :_tick
    attr_accessor :_role_id
    attr_accessor :_zone_id
    attr_accessor :_scene_id
    attr_accessor :_account_id
    attr_accessor :_character_id
    attr_accessor :_party_id
    attr_accessor :_guild_id

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @quest_id = data[1]
      @reward_selected = data[2]
      @_tick = data[3]
      @_role_id = data[4]
      @_zone_id = data[5]
      @_scene_id = data[6]
      @_account_id = data[7]
      @_character_id = data[8]
      @_party_id = data[9]
      @_guild_id = data[10]
    end


    private
      def handler
        CompleteQuestEventHandler.instance
      end
  end
end
