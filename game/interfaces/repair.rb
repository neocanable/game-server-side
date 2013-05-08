module Vici
  class RepairInterface < Interface
    class << self
      def repair_item(character, container_index, slot_index)
        item = damaged_item(character, container_index, slot_index)
        repair_item_and_send_event(character, item)
      end

      def repair_all(character)
        items = Container.all_slots_need_repair(character)
        items.each do |item|
          repair_item_and_send_event(character, item)
        end
      end        

      def super_repair(character, container_index, slot_index)
        item = damaged_item(character, container_index, slot_index)  
        super_repair_and_send_event(character, item)
      end        

      def super_repair_all(character)     
        items = Container.all_slots_need_repair(character)
        items.each do |item|
          super_repair_and_send_event(character, item)
        end
      end  

      def salvation(character, container_index, slot_index)
        container = Container.player_container(container_index, character.id)
        item = container.get_item_by_slot_index(slot_index)
        item.increase_max_durability!

        durability_changed_event(character, item)
      end  

      private

        def damaged_item(character, container_index, slot_index)
          container = Container.player_container(container_index, character.id)
          item = container.get_item_by_slot_index(slot_index)
          raise CanNotRepairError unless item.is_equipment?
          #return post_account_event(Vici::EventType::EQUIPMENT_BRONKEN) if item.is_broken?
          raise CanNotRepairError unless item.need_repair?
          item
        end

    end
  end
end  
