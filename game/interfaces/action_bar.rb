module Vici
  class ActionBarInterface < Interface
    class << self
      def list(character_id)
        ActionBar.get_all(character_id)
      end

      def set_spell(character_id, slot_index, spell_id)
        ActionBar.place(character_id, slot_index, spell_id, nil)
      end

      def set_item(character_id, slot_index, item_id)
        ActionBar.place(character_id, slot_index, nil, item_id)
      end

      def clean(character_id, slot_index)
        ActionBar.delete(:character_id => character_id, slot_id => slot_index)
      end

      def swap_slot(character_id, slot1, slot2)
        ActionBar.swap(character_id, slot1, slot2)
      end
    end
  end
end  
