module Vici
  class CronInterface < Interface
    class << self
      def clear_expired_items
        items = Item.expired_items
        items.each do |item|
          item_expired_event(item)
        end
      end
    end
  end
end  
