#          id  2003
# description  取得未分配的技能点数
#         api  spell.get_unspent_spell_points
#      params  
#        call  client
#     execute  vici

module Vici
  class GetUnspentSpellPointsEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
