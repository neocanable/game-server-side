module Vici
  class ItemInterface < Interface
    class << self

      # 处理vici
      def use_item(container_index, slot_index, static_item_id, character)
        item = Container.get_item(container_index, slot_index, static_item_id, character)
        static_item = static_item(item.static_item_id)
        action = static_action(static_item["use_action"].to_i)
        if item and item.quantity >= 1
          #use_action_event(character, static_item["use_action"].to_i, static_item["action_params"]) if static_item["use_action"]
          if action and is_internal_action?(action)
            use_action_event(character, static_item["use_action"].to_i, static_item["action_params"]) 
            consume_item(container_index, slot_index, item.static_item_id, character)
          elsif action
            container_index = -1 if container_index.nil?
            slot_index      = -1 if slot_index.nil?
            use_consumable(character.id, item.static_item_id, container_index, slot_index, character.scene_id, character.id)
          end
        end
      end
      
      # 消耗
      def consume_item(container_index, slot_index, static_item_id, character)
        if container_index != -1 and slot_index != -1 #and container_index != 0 and slot_index != 0
          take_away_stacking_items_with_index(character, container_index, slot_index, 1)
        else
          take_away_stacking_items_event(character, static_item_id, 1)
        end

        #logger.use_item(character.id, character.level, character.profession, 1, item.static_item_id)
      end

    end
  end
end  
