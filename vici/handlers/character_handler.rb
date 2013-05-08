module Vici
  class << GetCharacterListEventHandler.instance
    def execute(event)
      account_id = event._account_id
      CharacterInterface.list(account_id)
    end
  end

  class << CreateCharacterEventHandler.instance
    def execute(event)
      name          = event.name
      appearance_id = event.appearance_id
      account_id    = event._account_id

      CharacterInterface.create(account_id, name, appearance_id)  
    end
  end

  class << DestroyCharacterEventHandler.instance
    def execute(event)
      character_id = event.character_id

      CharacterInterface.destroy(character_id)     
    end
  end

end

