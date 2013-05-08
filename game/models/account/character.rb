class Account < ActiveRecord::Base
  def login_list
    characters.collect do |char|
      [char.id, char.name, char.appearance, char.profession, char.level, char.static_zone_id, 0, 0, 0]
    end
  end

  def create_character(name, appearance_id)
    characters.create :name => name, :appearance => appearance_id, :profession => Vici::CharacterProfession::NOVICE # , :x => , :y =>
  end

  def default_character
    characters.first(:order => "logout_time DESC")
  end

    #    def character_list
    #      #list = characters.collect do |char|
    #        #inv = Container.player_container(Vici::ContainerType::INVENTORY, char.id)
    #        #
    #        #weapon = Item.inventory_slot(Vici::InventorySlot::MAIN_HAND, inv.id)
    #        #head   = Item.inventory_slot(Vici::InventorySlot::HEAD, inv.id)
    #        #chest  = Item.inventory_slot(Vici::InventorySlot::BODY, inv.id)
    #      
    #        #weapon = weapon ? weapon.static_item_id : 0 # TODO
    #        #head = head ? head.static_item_id : 0
    #        #chest = chest ? chest.static_item_id : 0
    #        #puts "--------------------------- char #{char.id} #{char.name}"
    #        #p weapon
    #        #p head
    #        #p chest
    #        #[char.id, char.name, char.appearance, char.profession, char.level, char.static_zone_id, head, chest, weapon]
    #      #end
    #    end
end
