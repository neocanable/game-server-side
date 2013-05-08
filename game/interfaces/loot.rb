module Vici
  class LootInterface < Interface
    class << self
      
      def loot_item_list(scene_object_id, character)
        scene_object = SceneObject.find_by_id(scene_object_id)
        return unless scene_object
        scene_object.open_loot!(character)
        check_scene_object_to_loot_roll(scene_object, character, character.party) if character.party
        loot_list_event(scene_object, character)
      end

      def loot_all(scene_object, character)
        return unless scene_object

        #raise CanNotLootItemError can_open_loot?(character, scene_object)
        scene_object.can_loot_list(character).each do |scene_object_item|
          # 检查是否能够拾取
          loot_one_item(scene_object, scene_object_item, character)
        end
      end

      def loot_one_item(scene_object, scene_object_item, character)
        scene_object_item = SceneObjectItem.find_by_id(scene_object_item.id)
        raise "NoItemFoundError" if scene_object_item.nil?
        if scene_object_item.static_item_id == Vici::MONEY_ID
          money_loot(scene_object, scene_object_item, character)
        else
          item_loot(scene_object, scene_object_item, character)
        end
      end

      # 投点
      def roll(character, loot, option)
        roll = loot.roll(option, character)
        roll_event(character, loot, roll, option)
        # 判断色子是否投掷完成
        if loot.finished?
          give_loot_item(loot)
        end
      end

      def check_scene_object_to_loot_roll(scene_object, character, party)
        scene_object.scene_object_items.each do |scene_object_item|
          if scene_object_item.quality >= party.loot_threshold and scene_object_item.static_item_id != Vici::MONEY_ID#and party.loot_method == Vici::LootMethod::ROUND_LOOT
            party_loot(party, scene_object_item, scene_object_item.quantity, character)
          end
        end
      end

      def close_loot_list(character, scene_object_id)
        open_loot = character.open_loots.first
        return unless open_loot
        scene_object = open_loot.scene_object
        #raise "CanNotCloseLootError" unless character.can_open_loot?(scene_object)
        open_loot.destroy if open_loot
        scene_object.set_elapses_at_after_close! if scene_object and scene_object.open_loots.size == 0
      end

      # 品质高于队伍规定的投色子
      def party_loot(party, scene_object_item, stack, character)
        loot = Loot.find_by_scene_object_item_id(scene_object_item.id)
        return if loot
        loot = Loot.create :scene_object_item_id => scene_object_item.id, :elapses_at => Time.now.to_i
        loot.create_rolls(party, character)

        loot_roll_event(character, loot, scene_object_item.static_item_id, scene_object_item.quantity)
      end

      private


        def money_loot(scene_object, scene_object_item, character)
          money = scene_object_item.quantity.to_i
          party = character.party
          party.nil? ? character_gain_money_event(character, money) : party_gain_money_event(party, money, character)
          loot_item_removed_event(scene_object, scene_object_item, character)                 
          info_logger.loot_money(character.id, character.level, character.profession, money)
        end

        def item_loot(scene_object, scene_object_item, character)
          party = character.party
          raise "CanNotLootItemError" if party and scene_object_item.quality > party.loot_threshold
          already_count = character.item_count(scene_object_item.static_item_id)
          item = Vici::Code.first(:ITEM, 'id', scene_object_item.static_item_id)
          max_item_count = item["max_count"].to_i
          if already_count + scene_object_item.quantity > max_item_count and max_item_count > 0
             return if max_item_count - already_count == 0
             character_gets_items_event(scene_object_item.static_item_id, max_item_count - already_count, character)
             scene_object_item.quantity = scene_object_item.quantity - (max_item_count - already_count)
             scene_object_item.save!
          else
            player_get_item(scene_object_item.static_item_id, scene_object_item.quantity, character.account_id)
            character_gets_items_event(scene_object_item.static_item_id, scene_object_item.quantity, character)
            loot_item_removed_event(scene_object, scene_object_item, character)
          end
        end

        # 分配物品, 需要重构
        def give_loot_item(loot)
          need = loot.loot_rolls.select{|e| e.option_id == Vici::LootOption::NEED  }
          # 找到没有放弃的最高点数
          high = loot.loot_rolls.select{|e| e.option_id != Vici::LootOption::PASS }.sort_by(&:number).last
          # 找到需要中的最高点数
          need_high = need.sort_by(&:number).last
          # 没有人投的话就全员放弃
          return if need_high.nil? and high.nil?
          gain = need_high.nil? ? high : need_high

          character = gain.character
          player_get_item(loot.scene_object_item.static_item_id, loot.scene_object_item.quantity, character.account_id)
          character_gets_items_event(loot.scene_object_item.static_item_id, loot.scene_object_item.quantity, character)
          scene_object_item = loot.scene_object_item
          scene_object      = scene_object_item.scene_object
          loot_item_removed_event(scene_object, scene_object_item, character)
          loot.destroy
        end

    end
  end
end  
