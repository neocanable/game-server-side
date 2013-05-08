module Vici
  module InterfaceHelper
    def use_action_event(character, action_id, action_params = nil)
      action = static_action(action_id)
      if is_internal_action?(action)
        action_name = retrieve_action_name(action)
        self.send(action_name, character, action_params) if self.respond_to? action_name
      else
        use_action(character.id, action_id.to_i, character.scene_id, character.id)
      end
    end

    def vici_action_give_item(character, action_params)
      character_gets_items_event(action_params.to_i, 1, character)
    end

    def vici_action_teleport(character, action_params)
      #location = Vici::Code.first(:LOCATION, 'id', action_params.to_i)
      #zone = Vici::Code.first(:ZONE, "id", location["zone"].to_i)
      dest = Vici::Code.first(:LOCATION, "id", action_params.to_i)
      p "call here"
      scene_enter(character.id, dest["zone"].to_i, dest["x"].to_i, dest["y"].to_i)
    end

    def vici_action_change_profession(character, profession)
      if character.can_change_profression_to?(profession.to_i)
        character.change_profession!(profession.to_i) 
        unit_profession_chanaged(character.unit_id, character.profession, character.scene_id)
        update_profession(character.id, character.profession, character.scene_id, character.id)
      end
    end

    def vici_action_unlock_container(character, container_index)
      container = Container.player_container(container_index.to_i, character.id)
      container.change_max_slot(1)
      container_max_slot_changed_event(character, container)
    end

    def vici_action_trash(character, action_params)
      p "擦#{action_params}，把action_id填错啦"
    end

    def is_internal_action?(action)
      action["action_type"].to_i == Vici::ActionType::INTERNAL
    end

    private

    def retrieve_action_name(action)
      if is_internal_action?(action) and action["method"]
        action_name = "vici_action_" + action["method"]
        action_name.to_sym
      else
        "vici_action_trash".to_sym
      end
    end

  end
end  

