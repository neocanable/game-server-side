#          id  2002
# description  技能书
#         api  spell.spell_book
#      params  spell[spell_id rank:int]
#        call  vici
#     execute  client

module Vici
  class SpellBookEvent < ViciEvent
    include Singleton

    class Spell
      attr_accessor :spell_id
      attr_accessor :rank
    end
    attr_accessor :spells
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      spells = @spells.collect do |spell|
        [spell.spell_id, spell.rank]
      end
      _event_id = 2002
      Packet.pack([_event_id, spells, @_channel_id, @_account_id])
    end

    private
      def handler
        SpellBookEventHandler.instance
      end
  end
end
