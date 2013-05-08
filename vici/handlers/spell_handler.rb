module Vici
  class << LearnSpellEventHandler.instance
    def execute(event)
      spell_id     = event.spell_id
      character_id = event._character_id
      account_id   = event._account_id
        
      SpellInterface.learn_spell(spell_id, character_id)
    end
  end

  class << GetSpellBookEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character    = Character.find_by_id(character_id)
      SpellInterface.character_spell_book(character)
    end
  end

  class << GetUnspentSpellPointsEventHandler.instance
    def execute(event)
      character_id = event._character_id
      account_id   = event._account_id
      points = SpellInterface.get_unspent_spell_points(character_id)

      unspent_spell_point_changed(points, account_id)
    end
  end
end
