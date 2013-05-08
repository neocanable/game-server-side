module Vici
  class << ActionBarEraseEventHandler.instance
    def execute(event)
      slot_index   = event.slot_index
      character_id = event._character_id
      account_id   = event._account_id
      ActionBarInterface.clean(character_id, slot_index)
      action_bar_slot_changed(slot_index, nil, nil, account_id)
    end
  end

  class << GetActionBarEventHandler.instance
    def execute(event)
      character_id = event._character_id
      account_id   = event._account_id
      action_bars = ActionBarInterface.list(character_id).collect do |arr|
        bar = ActionBarEvent::ActionBar.new
        bar.slot_index  = arr[0]
        bar.action_type = arr[1]
        bar.action_id   = arr[2]
        bar
      end
      action_bar(action_bars, account_id)
    end
  end

  class << ActionBarSetItemEventHandler.instance
    def execute(event)
      slot_index   = event.slot_index
      item_id      = event.item_id
      character_id = event._character_id
      account_id   = event._account_id
      
      slot_index, type, item_id = ActionBarInterface.set_item(character_id, slot_index, item_id)
      action_bar_slot_changed(slot_index, type, item_id, account_id)
    end
  end

  class << ActionBarSetSpellEventHandler.instance
    def execute(event)
      slot_index = event.slot_index
      spell_id = event.spell_id
      character_id = event._character_id
      account_id   = event._account_id
      slot_index, type, spell_id = ActionBarInterface.set_spell(character_id, slot_index, spell_id)
      action_bar_slot_changed(slot_index, type, spell_id, account_id)
    end
  end

  class << ActionBarSwapEventHandler.instance
    def execute(event)
      slot1 = event.slot1
      slot2 = event.slot2
      character_id = event._character_id
      account_id   = event._account_id     

      bar1, bar2 = ActionBarInterface.swap_slot(character_id, slot1, slot2)
      action_bar_slot_changed(bar1[0], bar1[1], bar1[2], account_id)     
      action_bar_slot_changed(bar2[0], bar2[1], bar2[2], account_id)     
    end
  end
end
