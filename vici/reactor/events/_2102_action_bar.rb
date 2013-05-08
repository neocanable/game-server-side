#          id  2102
# description  动作条
#         api  action_bar.action_bar
#      params  action_bar[slot_index action_type:int action_id]
#        call  vici
#     execute  client

module Vici
  class ActionBarEvent < ViciEvent
    include Singleton

    class ActionBar
      attr_accessor :slot_index
      attr_accessor :action_type
      attr_accessor :action_id
    end
    attr_accessor :action_bars
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      action_bars = @action_bars.collect do |action_bar|
        [action_bar.slot_index, action_bar.action_type, action_bar.action_id]
      end
      _event_id = 2102
      Packet.pack([_event_id, action_bars, @_channel_id, @_account_id])
    end

    private
      def handler
        ActionBarEventHandler.instance
      end
  end
end
