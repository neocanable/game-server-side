class Trade < ActiveRecord::Base
  has_many :trade_items, :dependent => :destroy

  class << self
    def create_trade(character, target_character)
      raise "BadTargetError" if character == target_character
      raise PlayerIsBusyError if player_in_trade?(target_character)
      Trade.create :character1_id => character.id,:character2_id => target_character.id, :state => Vici::TradeState::NO_CONFIRM
    end

    private
      def player_in_trade?(character)
        first(:conditions => ["character2_id=? OR character1_id=?", character.id, character.id])
      end
  end

  def remove_item(character, trade_slot_index)
    #TradeItem.delete_all(:character_id => character.id, :trade_slot_index => trade_slot_index)    
    trade_item = self.trade_items.first(:conditions => ["trade_slot_index=? AND character_id=?", trade_slot_index, character.id])
    container = Container.find_by_id(trade_item.container_id)
    item      = container.get_item_by_slot_index(trade_item.slot_index)
    item.unlock!
    trade_item.destroy
    item
  end

  def confirm_character
    return nil if self.state == Vici::TradeState::NO_CONFIRM
    if self.state == Vici::TradeState::C1_CONFIRM
      Character.find_by_id(self.character1_id)
    else self.state == Vici::TradeState::C2_CONFIRM
      Character.find_by_id(self.character2_id)
    end
  end

  def unlock_trade_items
    trade_item_ids = trade_items.collect{|e| e.id }
    return if trade_item_ids.size == 0
    sql = "update items i,trade_items t set i.locked=0 where i.slot_index=t.slot_index and t.container_id=i.container_id and t.id in (#{trade_item_ids.join(',')})"
    connection.execute(sql)
  end


  def set_money(character, money)
    raise NotEnoughMoneyError unless character.has_enough_money?(money)
    if self.character1_id == character.id
      character.money >= money ? self.character1_money = money : self.character1_money = character.money
    else
      character.money >= money ? self.character2_money = money : self.character2_money = character.money
    end
    save!
  end

  def set_item(character, trade_slot_index, container_index, slot_index, quantity)
    raise CanNotTradeError if [Vici::ContainerType::INVENTORY, Vici::ContainerType::BANK].include?(container_index)
    container   = Container.player_container(container_index, character.id)
    item        = container.get_item_by_slot_index(slot_index)
    raise ItemNotFoundError unless item
    static_item = static_item(item.static_item_id)
    raise ItemLockedError if item.locked
    raise CanNotTradeError if static_item['bind'].to_i == 1
    trade_item = TradeItem.first(:conditions => ["character_id=? AND slot_index=? AND container_id=?", character.id, slot_index, container.id])
    raise CanNotTradeError if trade_item
    trade_item = TradeItem.first(:conditions => ["character_id=? AND container_id=? AND trade_slot_index=?", character.id, container.id, trade_slot_index])
    if trade_item
      container = Container.find(trade_item.container_id)
      old_item  = container.get_item_by_slot_index(trade_item.slot_index) 
      old_item.unlock!

      trade_item.container_id = container.id
      trade_item.slot_index = slot_index
      trade_item.static_item_id = item.static_item_id
      trade_item.quantity = item.quantity
      trade_item.save!
      [trade_item, item, old_item]
    else
      item.lock! # 锁定物品
      trade_item = TradeItem.create :trade_id => self.id, :character_id => character.id, :trade_slot_index => trade_slot_index, :container_id => container.id, :slot_index => slot_index, :static_item_id => static_item["id"], :quantity => item.quantity
      [trade_item, item, nil]
     end 
  end

  def money_change
    c1_money = self.character1_money.to_i 
    c2_money = self.character2_money.to_i
    c1       = Character.find_by_id(self.character1_id)
    c2       = Character.find_by_id(self.character2_id)
    raise NotEnoughMoneyError unless c1.has_enough_money?(c1_money)
    raise NotEnoughMoneyError unless c2.has_enough_money?(c2_money)
    c1.money += c2_money
    c2.money += c1_money
    c1.money -= c1_money
    c2.money -= c2_money
    c1.save!
    c2.save!
  end

  def get_other_character(character)
    #raise "NoTradeError" unless trade
    other_character_id = self.character1_id == character.id ? self.character2_id : self.character1_id
    Character.find_by_id(other_character_id)
  end


  def unconfirm!
    self.state = Vici::TradeState::NO_CONFIRM
    save!
  end
  
end
