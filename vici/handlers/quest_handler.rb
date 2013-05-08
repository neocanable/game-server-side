module Vici
  class << GetQuestsEventHandler.instance
    def execute(event)
      character_id  = event._character_id

      QuestInterface.get_quests(character_id)
    end
  end

  class << GetAvailableQuestsEventHandler.instance
    def execute(event)
      character_id = event._character_id
      account_id    = event._account_id

      QuestInterface.get_available_quests(character_id)
    end
  end

  class << GetQuestTextEventHandler.instance
    def execute(event)
      quest_id = event.quest_id
      character_id = event._character_id
      
      QuestInterface.get_quest_text(quest_id, character_id)
    end
  end

  class << AcceptQuestEventHandler.instance
    def execute(event)
      quest_id     = event.quest_id
      character_id = event._character_id

      QuestInterface.accept_quest(character_id, quest_id)
    end
  end

  class << AbandonQuestEventHandler.instance
    def execute(event)
      quest_id = event.quest_id
      character_id = event._character_id

      QuestInterface.abandon_quest(character_id, quest_id)
    end
  end

  class << CompleteQuestEventHandler.instance
    def execute(event)
      quest_id = event.quest_id
      reward_selected = event.reward_selected

      character_id = event._character_id
      account_id   = event._account_id     
      character    = Character.find_by_id(character_id)
      QuestInterface.complete_quest(character, quest_id, reward_selected)

    end
  end
end
