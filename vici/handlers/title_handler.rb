module Vici
  class << GetTitleListEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      TitleInterface.character_title_list(character)
    end
  end

  class << SelectTitleEventHandler.instance
    def execute(event)
      title_id = event.title_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      TitleInterface.character_select_title(character, title_id)
    end
  end
end
