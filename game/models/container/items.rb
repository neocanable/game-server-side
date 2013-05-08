class Container < ActiveRecord::Base
  class << self
    def player_container(container_index, character_id)
      container = find(:first, :conditions => { :character_id => character_id, :container_type => container_index })
      raise InvalidContainerError unless container
      container
    end

    def give_items_to_assign_player(static_item_id, amount, character_id)
      character = Character.find_by_id(character_id)
      #container_index = bag_index_for_item(static_item_id)
      container_index = Item.bag_index_for_item(static_item_id)
      container = Container.player_container(container_index, character_id)
      check_uniq_item(static_item_id, amount, character)
      container.put_stacking_items_into_container(static_item_id, amount)
    end

    def get_item(container_index, slot_index, static_item_id, character)
      if static_item_id.nil?
        container = Container.player_container(container_index, character.id)
        item = container.get_item_by_slot_index(slot_index)
      else
        item = character.get_items_by_static_item_id(static_item_id).first
      end
      item
    end

    def all_slots_need_repair(character)
      [Vici::ContainerType::BAG_EQUIPMENT, Vici::ContainerType::INVENTORY].collect{ |container_index|
        container = player_container(container_index, character.id)
        container.items.select{|item| item.need_repair? }
      }.flatten
    end

    def unlock_bank(character, times = 1)
      container = player_container(Vici::ContainerType::BANK, character.id)
      container.change_max_slot(Vici::BANK_UNLOCK_SIZE*times)
    end

    private 

      def check_uniq_item(static_item_id, amount, character)
        static_item = static_item(static_item_id)
        container_type = [Vici::ContainerType::BAG_EQUIPMENT,Vici::ContainerType::BAG_CONSUMABLE,Vici::ContainerType::BAG_MATERIAL, Vici::ContainerType::BAG_QUEST, Vici::ContainerType::BANK]
        containers = Container.find(:all, :conditions => ["container_type IN (?) AND character_id=?", container_type, character.id])
        #items = Item.find(:all, :conditions => ["container_id IN (?) AND character_id=?", containers.collect{|e| e.id }, character.id])
        items = Item.find_by_sql("select i.* from items i where container_id in (#{containers.collect{|e| e.id }.join(",")}) and i.character_id=#{character.id} and i.static_item_id=#{static_item_id}")
        count = items.inject(0){|sum, item| item.quantity }
        raise ItemMaxCountError if (count+amount > static_item["max_count"]) and static_item["max_count"].to_i > 0
      end
  end



  def change_max_slot(slot_size)
    self.max_slot += slot_size
    self.max_slot = 0 if self.max_slot < 0
    self.max_slot = Vici::BANK_MAX_SLOTS if self.max_slot > Vici::BANK_MAX_SLOTS
    save!
  end

  def has_enough_material?(static_recipe)
    Recipe.all_recipe_material(static_recipe) do |material_id, amount|
      return false if self.item_amount(material_id) < amount
    end
    true
  end

  def inventory_slot(slot_index)
    items.first(:conditions => ["slot_index=?", slot_index])
  end

  def item_amount(static_item_id)
    items = items.find(:all, :conditions => ["static_item_id=?", static_item_id])
    items.inject(0) {|sum, item| sum += item.stack }
  end

  def get_item_by_slot_index(slot_index)
    items.first(:conditions => ["slot_index=?", slot_index])
  end
  
  def free_slot_index
    free_slots.first
  end
 
  def has_free_slot?
    free_slots.size > 0
  end

  private
    def free_slots
      all_slots = (0..(self.max_slot-1)).collect {|i| i }
      self.reload
      used_slots = self.items.collect{|item| item.slot_index }
      all_slots - used_slots
    end
end




