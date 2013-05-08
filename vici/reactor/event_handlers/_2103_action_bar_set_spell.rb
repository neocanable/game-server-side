#          id  2103
# description  设置技能
#         api  action_bar.action_bar_set_spell
#      params  slot_index spell_id
#        call  client
#     execute  vici

module Vici
  class ActionBarSetSpellEventHandler < ViciEventHandler
    def execute(event)
      slot_index = event.slot_index
      spell_id = event.spell_id
      raise "Overwrite me!"
    end
  end
end
