module Vici
  module InterfaceHelper

    def character_list_event(account_id, account_characters, default_id)
      characters = account_characters.collect do |char|
         character = CharacterListEvent::Character.new
         character.character_id   = char[0]
         character.name           = char[1]
         character.appearance_id  = char[2]
         character.profession_id  = char[3]
         character.level          = char[4]
         character.zone_id        = char[5]
         character.head_id        = char[6]
         character.chest_id       = char[7]
         character.weapon_id      = char[8]
         character
      end
      character_list(characters, default_id, account_id)     
    end

    def character_gain_xp_event(character, xp)
      character.gain_xp!(xp)
      player_xp_gain(xp, character.xp, character.account_id)
      character_level_event(character) if character.level_up!
    end

    def character_level_event(character)
      update_level(character.id, character.level, character.scene_id, character.id)
      unit_level_up(character.unit_id, character.level, character.scene_id)
      
      character_available_quests_event(character) # 可以接的任务
    end

    def player_gain_diamond_event(character, diamond)
      character.earn_diamond!(diamond)
      player_diamond(character.account.diamond, character.account_id)
    end

    def player_money_event(character)
      player_money(character.money, character.account_id)
    end

    def character_gain_money_event(character, money)
      character.earn_money!(money)
      player_money_gain(money, character.money, character.account_id)
    end

    def party_gain_money_event(party, money, character)
      split_money = money/party.same_scene_characters(character).size
      party.same_scene_characters(character).each do |member|
        character_gain_money_event(member, split_money)
      end
    end

  end
end  
