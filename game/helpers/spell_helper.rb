module Vici
  module InterfaceHelper
    def spell_book_event(character_spells, character)
      spells = character_spells.collect do |spell|
        spell_item = SpellBookEvent::Spell.new
        spell_item.spell_id = spell.spell_id
        spell_item.rank     = spell.rank
        spell_item
      end
      spell_book(spells, character.account_id)
    end
  end
end  

