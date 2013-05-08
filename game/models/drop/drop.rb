module DropHelper
  include ItemHelper
  include TradeHelper
  include PartyHelper

  def fill_scene_object(dead_npc_id, dead_character_id, scene_object_id, x, y, character)
    scene_object = SceneObject.find_by_id(scene_object_id)
    raise "NoSceneObjectError" if scene_object.nil?
    if dead_npc_id
      kill_npc(dead_npc_id, scene_object, x, y, character)
    elsif dead_character_id
      kill_player(dead_character_id, scene_object, x, y, character)
    end
  end


  # npc挂了会掉的东西
  def kill_npc(dead_npc_id, scene_object, x, y, character)
    items = to_stack_items(items_drop(dead_npc_id, character.id))
    money = money_drop(dead_npc_id)
    items << [Vici::MONEY_ID, money]
    if party = character.party
      to_character = party.turn_character(character)
      allot_scene_object(scene_object, x , y, to_character, items, dead_npc_id)
      party_kill_npc(dead_npc_id, party, character)
      party_exp_drop(npc_id, party, character)
    else
      exp = exp_drop(dead_npc_id, character.id)
      gain_xp(exp, character)
      sigle_kill_npc(dead_npc_id, character)
      allot_scene_object(scene_object, x, y, character, items, dead_npc_id)
    end
  end

  def allot_scene_object(scene_object, x , y, to_character, stack_items, npc_id)
    scene_object.character_id = to_character.id
    scene_object.party_id     = to_character.party_id
    scene_object.created_at   = Time.now.to_i
    scene_object.elapses_at   = Time.now.to_i + Vici::SCENE_OBJECT_ELAPSE_TIME
    stack_items.each do |stack_item|
      static_item = Vici::Code.first(:ITEM, 'id', stack_item.first)
      next if to_character.need_item_unfinish_player_quests(stack_item.first).size == 0  and is_quest_item?(stack_item)
      scene_object.fill_in(stack_item.first, stack_item.last)
    end
    scene_object.save
    post_scene_event(Vici::EventType::CORPSE_OBJECT_INFO, scene_object.object_offset_id, npc_id, x + 3, y, scene_object.character_id, scene_object.party_id)
  end


end
