module Vici
  class ContainerInterface < Interface
    class << self
      def get_container(container_index, character_id)
        container = Container.player_container(container_index, character_id)
      end

      def destroy_item(character_id, container_index, slot_index)
        character = Character.find_by_id(character_id)
        container = Container.player_container(container_index, character_id)
        item = container.get_item_by_slot_index(slot_index)
        take_away_stacking_items_with_index(character, container_index, slot_index)
      end

      def drag_drop(character_id, source_container_index, source_slot_index, dest_container_index, dest_slot_index)
        character = Character.find_by_id(character_id)
        changed_items = Container.drag_drop(character, source_container_index, source_slot_index, dest_container_index, dest_slot_index)  

        container_slot_changed_event(changed_items, character)
      end

      def split(character_id, container_index, slot_index, dest_slot_index, amount)
        character     = Character.find_by_id(character_id)
        changed_items = Container.split(character, container_index, slot_index, dest_slot_index, amount)

        container_slot_changed_event(changed_items, character)
      end

      def change_max_slot(character, container_index, size)
        container = Container.player_container(container_index, character.id)
        container.change_max_slot(size)
        container_max_slot_changed_event(character, container)
      end

      def damage_armors(character)
        container = Container.player_container(Vici::ContainerType::INVENTORY, character.id)
        character.armors.each do |armor|
          if rand(100) <= Vici::ARAMOR_DAMAGE_PROBABILITY
            armor.drop_durability(Vici::ARAMOR_DAMAGE_POINT)
            durability_changed_event(character, armor, container)
          end
        end
      end

      def damage_weapon(character)
        container = Container.player_container(Vici::ContainerType::INVENTORY, character.id)
        weapon = character.weapon
        if rand(100) <= WEAPON_DAMAGE_PROBABILITY and weapon
          weapon.drop_durability(WEAPON_DAMAGE_POINT)
          durability_changed_event(character, weapon, container)
        end
      end

    end
  end
end  
