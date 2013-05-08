module Vici
  class MerchantInterface < Interface
    class << self

      def sell_item_list(character, npc_id)
        items = Merchant.items(npc_id)
        sell_list_event(character, items, npc_id)
      end

      def buy_item(character, npc_id, merchant_item_id)
        merchant_item = static_merchant_item(npc_id, merchant_item_id)
        static_item_id = merchant_item["item_id"]

        cost = Merchant.merchant_cost(character, merchant_item)
        character_gets_items_event(static_item_id, merchant_item["stack"].to_i, character)
        spend_for_buy(character, cost, merchant_item)
        info_logger.buy(character.id, character.level, character.profession, merchant_item["stack"].to_i, static_item_id, cost)
      end

      def sell_item_to_npc(character, container_index, slot_index)
        items = Merchant.sell_item(character, container_index, slot_index)
        container_slot_changed_event(items, character)
        player_money(character.money, character.account_id)
      end

      def get_buyback_list(character, npc_id)
        buyback_container = character.buyback_container
        buyback_list_event(character, buyback_container.items)
      end

      def buyback_item(character, buyback_item_id)
        items = Merchant.buy_back(character, buyback_item_id)
        container_slot_changed_event(items, character)
        player_money(character.money, character.account_id)
      end

      private

        def spend_for_buy(character, cost, merchant_item)
          if merchant_item["honor_price"].nil?
            character.spend_money!(cost)
            player_money(character.money, character.account_id)
          else
            character.spend_honor!(cost)
            player_honor(character.honor, character.account_id)
          end
        end

    end
  end
end  
