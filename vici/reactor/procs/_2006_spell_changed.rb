#          id  2006
# description  技能等级改变
#         api  spell.spell_changed
#      params  spell_id rank:int
#        call  vici
#     execute  client

module Vici
  class SpellChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
