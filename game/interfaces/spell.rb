module Vici
  class SpellInterface < Interface

    class << self
      def character_spell_book(character)
        spells = Spell.character_spells(character.id)

        spell_book_event(spells, character)
      end

      def get_unspent_spell_points(character_id)
        points = Spell.unspent_points(character_id)
      end

      def learn_spell(spell_id, character_id)
        spell = Spell.learn(spell_id, character_id)
        character = Character.find_by_id(character_id)
        spell_changed(spell.spell_id, spell.rank, character.account_id)
        player_money_event(character)
      end
    end

  end
end  
