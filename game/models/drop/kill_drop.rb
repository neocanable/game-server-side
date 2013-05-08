class Drop 
  class << self
  
    def fill_scene_object(dead_npc_id, dead_character_id, scene_object_id, character)
      scene_object = SceneObject.find_by_id(scene_object_id)
      raise "NoSceneObjectError" if scene_object.nil?
      if dead_npc_id
        #kill_npc(dead_npc_id, scene_object, x, y, character)
        kill_npc_drop_items(dead_npc_id, scene_object, character)
      elsif dead_character_id
        #kill_player(dead_character_id, scene_object, x, y, character)
      end
    end

    def kill_npc_drop_items(dead_npc_id, scene_object, character)
      stack_items = to_stack_items(items_drop(dead_npc_id, character))
      money = money_drop(dead_npc_id)
      stack_items << [Vici::MONEY_ID, money]
      if party = character.party
        character = party.turn_character(character) # 判断这个物品到底给谁
      end
      allot_scene_object(scene_object, character, stack_items)
    end

    def allot_scene_object(scene_object, to_character, stack_items)
      scene_object.character_id = to_character.id
      scene_object.party_id     = to_character.party_id
      scene_object.created_at   = Time.now.to_i
      scene_object.elapses_at   = Time.now.to_i + Vici::SCENE_OBJECT_ELAPSE_TIME
      stack_items.each do |stack_item|
        item = Vici::Code.first(:ITEM, 'id', stack_item.first)
        need_count = to_character.need_item_count(stack_item.first)
        next if is_quest_item?(item) and need_count == 0
        if is_quest_item?(item) and need_count > 0
          to_give_count = need_count >= stack_item.last ? stack_item.last : need_count
        else
          to_give_count = stack_item.last
        end
        scene_object.fill_in(stack_item.first, to_give_count)
      end
      scene_object.save
      scene_object
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
  


  end
end
