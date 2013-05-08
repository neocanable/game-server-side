#          id  2004
# description  未分配的技能点数改变
#         api  spell.unspent_spell_point_changed
#      params  unspent_points:int
#        call  vici
#     execute  client

module Vici
  class UnspentSpellPointChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
