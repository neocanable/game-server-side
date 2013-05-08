class ActionBar < ActiveRecord::Base

  def self.place(character_id, slot_index, spell_id, item_id)
    raise "invalid slot" if slot_index < 0 or slot_index >= Vici::ACTION_BAR_MAX_SLOTS
    delete_all(["character_id = ? AND slot_index = ?", character_id, slot_index])
    if spell_id or item_id then
      create :character_id => character_id, :slot_index => slot_index, :spell_id => spell_id, :item_id => item_id
    end
    slot(slot_index, spell_id, item_id)
  end

  def self.get_all(character_id)
    action_bar_slots = slots(character_id).collect! do |s|
      slot(s.slot_index, s.spell_id, s.item_id)
    end
    action_bar_slots
  end

  # TODO use it
  def self.slots(character_id)
    ActionBar.find(:all, :conditions => ["character_id=?", character_id])
  end

  def self.swap(character_id, slot1_id, slot2_id)
    s1 = find(:first, :conditions => [ "character_id = ? AND slot_index = ?", character_id, slot1_id ])
    s2 = find(:first, :conditions => [ "character_id = ? AND slot_index = ?", character_id, slot2_id ])
    update(s2.id, { :slot_index => slot1_id }) if s2
    update(s1.id, { :slot_index => slot2_id }) if s1
    if s1 and s2 then
      return slot(slot2_id, s1.spell_id, s1.item_id), slot(slot1_id, s2.spell_id, s2.item_id)
    elsif s1
      return slot(slot2_id, s1.spell_id, s1.item_id), [slot1_id, nil, nil]
    elsif s2
      return slot(slot1_id, s2.spell_id, s2.item_id), [slot2_id, nil, nil]
    else
      return [slot1_id, nil, nil], [slot2_id, nil, nil]
    end
  end

  private
    def self.slot(slot_index, spell_id, item_id)
      type = spell_id.nil? ? Vici::SlotType::ITEM : Vici::SlotType::SPELL
      action = spell_id ? spell_id : item_id
      return slot_index, type, action
    end
end
