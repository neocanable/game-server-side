#          id  5003
# description  NPC对话内容
#         api  gossip.gossip_content
#      params  npc_id content:str option[gossip_id content:str type:int quest_id]
#       notes  
#        call  vici
#     execute  client

module Vici
  class GossipContentEvent < ViciEvent
    include Singleton

    attr_accessor :npc_id
    attr_accessor :content
    class Option
      attr_accessor :gossip_id
      attr_accessor :content
      attr_accessor :type
      attr_accessor :quest_id
    end
    attr_accessor :options
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      options = @options.collect do |option|
        [option.gossip_id, option.content, option.type, option.quest_id]
      end
      _event_id = 5003
      Packet.pack([_event_id, @npc_id, @content, options, @_channel_id, @_account_id])
    end

    private
      def handler
        GossipContentEventHandler.instance
      end
  end
end
