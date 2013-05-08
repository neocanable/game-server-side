#          id  2004
# description  未分配的技能点数改变
#         api  spell.unspent_spell_point_changed
#      params  unspent_points:int
#        call  vici
#     execute  client

module Vici
  class UnspentSpellPointChangedEvent < ViciEvent
    include Singleton

    attr_accessor :unspent_points
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 2004
      Packet.pack([_event_id, @unspent_points, @_channel_id, @_account_id])
    end

    private
      def handler
        UnspentSpellPointChangedEventHandler.instance
      end
  end
end
