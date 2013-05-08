module Vici
  module InterfaceHelper
    def repair_item_and_send_event(character, item)
      cost = item.repair_cost
      character.spend_money!(cost)
      item.repair!
      durability_changed_event(character, item)

      info_logger.repair_spend(character.id, character.level, character.profession, cost)
    end

    def super_repair_and_send_event(character, item)
      cost = item.super_repair_cost
      character.spend_money!(cost)
      item.super_repair!
      durability_changed_event(character, item) 

      info_logger.repair_spend(character.id, character.level, character.profession, cost)
    end
  end
end  

