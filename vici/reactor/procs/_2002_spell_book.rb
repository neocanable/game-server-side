#          id  2002
# description  技能书
#         api  spell.spell_book
#      params  spell[spell_id rank:int]
#        call  vici
#     execute  client

module Vici
  class SpellBookProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
