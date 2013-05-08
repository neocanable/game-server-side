#          id  2107
# description  动作条改变
#         api  action_bar.action_bar_slot_changed
#      params  slot_index action_type:int action_id
#        call  vici
#     execute  client

module Vici
  class ActionBarSlotChangedEvent < ViciEvent
    include Singleton

    attr_accessor :slot_index
    attr_accessor :action_type
    attr_accessor :action_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 2107
      Packet.pack([_event_id, @slot_index, @action_type, @action_id, @_channel_id, @_account_id])
    end

    private
      def handler
        ActionBarSlotChangedEventHandler.instance
      end
  end
end
