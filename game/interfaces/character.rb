module Vici
  class CharacterInterface < Interface
    class << self

      def create(account_id, name, appearance_id)
        account = Account.find_by_id(account_id)
        character = account.create_character(name, appearance_id)
        character_created(character.id, account_id)
      end

      def destroy(character_id)
        character = Character.find_by_id(character_id)
        account_id = character.account_id
        character.destroy       
        character_destroyed(account_id)

        list(account_id)
      end

      def list(account_id)
        account = Account.find_by_id(account_id)
        account_characters = account.login_list
        default_character  = account.default_character
        default_id = default_character ? default_character.id : 0

        character_list_event(account_id, account_characters, default_id)
      end


    end
  end
end  
