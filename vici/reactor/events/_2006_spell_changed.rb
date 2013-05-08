#          id  2006
# description  技能等级改变
#         api  spell.spell_changed
#      params  spell_id rank:int
#        call  vici
#     execute  client

module Vici
  class SpellChangedEvent < ViciEvent
    include Singleton

    attr_accessor :spell_id
    attr_accessor :rank
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 2006
      Packet.pack([_event_id, @spell_id, @rank, @_channel_id, @_account_id])
    end

    private
      def handler
        SpellChangedEventHandler.instance
      end
  end
end
