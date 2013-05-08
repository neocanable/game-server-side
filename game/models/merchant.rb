class Merchant 
  extend StaticHelper 
  class << self
    def items(npc_id)
      items = static_merchant(npc_id)
      items.sort! {|a,b| a['id'] <=> b['id'] }
      items.collect! {|item| [item['id'], item['item_id'], item['stack'], merchant_buy_price(item), item['honor_price']] }
    end
    
    def merchant_cost(character, merchant_item)
      if merchant_item["honor_price"]
        cost = merchant_buy_honor(merchant_item)
        raise NotEnoughHonorError unless character.has_enough_honor?(cost)
      else
        cost = merchant_buy_price(merchant_item) 
        raise NotEnoughMoneyError unless character.has_enough_money?(cost)
      end
      cost
    end

    def sell_item(character, container_index, slot_index)
      buyback_container = character.buyback_container
      container         = Container.player_container(container_index, character.id)
      item = container.get_item_by_slot_index(slot_index)
      money = item.sell_price
      clear_up_buyback(character, container)
      character.earn_money!(money)
      items = Container.swap_slots(container, slot_index, buyback_container, buyback_container.free_slot_index)
    end

    def buy_back(character, buyback_item_id)
      item = Item.find_by_id(buyback_item_id)
      money = item.buyback_price
      buyback_container = item.container
      dest_container_index = Item.bag_index_for_item(item.static_item_id)
      dest_container = Container.player_container(dest_container_index, character.id)
      dest_slot_index = dest_container.free_slot_index

      character.spend_money!(money)
      items = Container.swap_slots(buyback_container, item.slot_index, dest_container, dest_slot_index)
    end
  

    private

      def clear_up_buyback(character, container)
        while container.items.size > Vici::BUYBACK_MAX_SLOTS
          destroy_oldest_in_buyback(container, character)
        end
      end

      def destroy_oldest_in_buyback(container, character)
        items = container.items.collect {|item| item.id }.join(',')
        item = ActiveRecord::Base.connection.select_one "SELECT * FROM `items` WHERE `id` IN (#{items}) ORDER BY updated_at LIMIT 1"
        item.destroy
      end

      def merchant_buy_price(merchant_item)
        return merchant_item['price'] if merchant_item['price']
        merchant_item_id = merchant_item['item_id']
        merchant_item['stack'] * static_item(merchant_item['item_id'])['buy_price']
      end 

      def merchant_buy_honor(merchant_item)
        return merchant_item['honor_price'] if merchant_item['honor_price']
      end 
  end
end
