module Vici
  class << ProcessEquipmentTimedOutEventHandler.instance
    def execute(event)
      tick = event.tick
      CronInterface.clear_expired_items
    end
  end
end
