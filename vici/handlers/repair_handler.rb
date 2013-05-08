module Vici
  class << RepairEventHandler.instance
    def execute(event)
      container_type = event.container_type
      slot_index     = event.slot_index
      character_id   = event._character_id
      character      = Character.find_by_id(character_id)
      
      RepairInterface.repair_item(character, container_type, slot_index)
    end
  end

  class << RepairAllEventHandler.instance
    def execute(event)
      character_id   = event._character_id
      character      = Character.find_by_id(character_id)     

      RepairInterface.repair_all(character)
    end
  end

  class << SuperRepairEventHandler.instance
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
 
      character_id   = event._character_id
      character      = Character.find_by_id(character_id)     

      RepairInterface.super_repair(character, container_type, slot_index)
    end
  end

  class << SuperRepairAllEventHandler.instance
    def execute(event)
      character_id   = event._character_id
      character      = Character.find_by_id(character_id)     

      RepairInterface.super_repair_all(character)     
    end
  end

  class << SalvationRepairEventHandler.instance
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
      character_id   = event._character_id
      character      = Character.find_by_id(character_id)     

      RepairInterface.salvation(character, container_type, slot_index)
    end
  end
end
