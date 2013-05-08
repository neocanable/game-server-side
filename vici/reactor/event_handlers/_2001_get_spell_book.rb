#          id  2001
# description  取得技能书
#         api  spell.get_spell_book
#      params  
#        call  client
#     execute  vici

module Vici
  class GetSpellBookEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
