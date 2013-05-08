#          id  2005
# description  学习技能
#         api  spell.learn_spell
#      params  spell_id
#        call  client
#     execute  vici

module Vici
  class LearnSpellEventHandler < ViciEventHandler
    def execute(event)
      spell_id = event.spell_id
      raise "Overwrite me!"
    end
  end
end
