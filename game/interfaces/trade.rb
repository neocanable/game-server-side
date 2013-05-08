module Vici
  class TradeInterface < Interface
    class << self
      def invite(character, target_character)
        trade = Trade.create_trade(character, target_character)
        trade_status_initiate(character.id, target_character.account_id)
        trade_status_initiate(target_character.id, character.account_id)
      end

      def set_money(character, money)
        trade = character.latest_trade       
        other_character = trade.get_other_character(character)
        trade.set_money(character, money)
        cancel_confirm(character) if trade.confirm_character == character
        trade_money_changed(character.id, money, character.account_id)
        trade_money_changed(character.id, money, other_character.account_id)
      end

      def set_item(character, trade_slot_index, container_index, slot_index, quantity)
        trade = character.latest_trade
        trade_item, item, old_item = trade.set_item(character, trade_slot_index, container_index, slot_index, quantity)
        other_character = trade.get_other_character(character)

        lock_item_event(character, item)
        unlock_item_event(character, old_item) if old_item
        cancel_confirm(character) if trade.confirm_character == character
        trade_item_changed(character.id, trade_slot_index, trade_item.static_item_id, trade_item.quantity, character.account_id)
        trade_item_changed(character.id, trade_slot_index, trade_item.static_item_id, trade_item.quantity, other_character.account_id)
      end

      def remove_item(character, trade_slot_index)
        trade = character.latest_trade
        item = trade.remove_item(character, trade_slot_index)
        other_character = trade.get_other_character(character)
        unlock_item_event(character, item)
        cancel_confirm(character) if trade.confirm_character == character
        trade_item_changed(character.id, trade_slot_index, nil, 0, character.account_id)
        trade_item_changed(character.id, trade_slot_index, nil, 0, other_character.account_id)       
      end
  
      def confirm(character)
        trade = character.latest_trade
        if trade.character1_id == character.id
          return do_trade(trade) if trade.state == Vici::TradeState::C2_CONFIRM
          trade.state = Vici::TradeState::C1_CONFIRM
        elsif trade.character2_id == character.id
          return do_trade(trade) if trade.state == Vici::TradeState::C1_CONFIRM
          trade.state = Vici::TradeState::C2_CONFIRM
        end
        trade.save!
        other_character = trade.get_other_character(character)
        trade_status_accept(character.id, other_character.account_id)
        trade_status_accept(character.id, character.account_id)
      end

      def cancel(character)
        trade = character.latest_trade
        return if trade.nil?
        other_character = trade.get_other_character(character)
        unlock_trade_items(trade)
        trade_status_cancel(character.account_id)
        trade_status_cancel(other_character.account_id)
        trade.destroy
      end

      def cancel_confirm(character)
        trade = character.latest_trade
        other_character = trade.get_other_character(character)
        trade.unconfirm!

        trade_status_unaccept(character.id, character.account_id)
        trade_status_unaccept(character.id, other_character.account_id)
      end

      private
        def do_trade(trade)
          c1 = Character.find_by_id(trade.character1_id)
          c2 = Character.find_by_id(trade.character2_id)  
          trade_money_change(trade, c1, c2)
          trade_item_change(trade, c1, c2)
          free_trade_items(trade, c1, c2)

          trade_status_complete(c1.account_id)
          trade_status_complete(c2.account_id)
          trade.destroy
        end

        def trade_item_change(trade, c1, c2)
          trade.unlock_trade_items
          trade.trade_items.each do |trade_item|
            character = trade.character1_id == trade_item.character_id ? c2 : c1
            container = Container.find_by_id(trade_item.container_id)
            item = container.get_item_by_slot_index(trade_item.slot_index)
            unlock_character = trade.character1_id == trade_item.character_id ? c1 : c2
            unlock_item_event(unlock_character, item)
            character_gets_items_event(trade_item.static_item_id, trade_item.quantity, character)
          end
        end

        def unlock_trade_items(trade)
          c1 = Character.find_by_id(trade.character1_id)
          c2 = Character.find_by_id(trade.character2_id)  
          trade.trade_items.each do |trade_item|
            container = Container.find_by_id(trade_item.container_id)
            item = container.get_item_by_slot_index(trade_item.slot_index)
            unlock_character = trade.character1_id == trade_item.character_id ? c1 : c2
            unlock_item_event(unlock_character, item)
          end
          trade.unlock_trade_items
        end

        def unlock_trade_one_trade_item(character, trade, trade_slot_index)
          trade_item = trade.trade_items.first(:conditions => ["trade_slot_index=? AND character_id=?", trade_slot_index, character.id])
          container = Container.find_by_id(trade_item.container_id)
          item      = container.get_item_by_slot_index(trade_item.slot_index)
          unlock_item_event(character, item)
        end

        def free_trade_items(trade, c1, c2)
          c1_items, c2_items = [],[]
          trade.trade_items.each{|item|
            container = Container.find_by_id(item.container_id)
            empty_slot = [container.container_type, item.slot_index, nil, 0]
            item.character_id == c1.id ? c1_items << empty_slot : c2_items << empty_slot
          }
          container_slot_changed_event(c1_items, c1) if c1_items.size > 0
          container_slot_changed_event(c2_items, c2) if c2_items.size > 0
        end

        def trade_money_change(trade, c1, c2)
          trade.money_change
          c1.reload
          c2.reload
          
          character_gain_money_event(c1, 0) if trade.character2_money > 0
          character_gain_money_event(c2, 0) if trade.character1_money > 0
          player_money_event(c1)
          player_money_event(c2)
        end

    end
  end
end  
