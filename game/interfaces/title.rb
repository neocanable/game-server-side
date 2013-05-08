module Vici
  class TitleInterface < Interface
    class << self
      def character_title_list(character)
        titles = Title.find(:all, :conditions => ["character_id=?", character.id])
        title_list_event(character, titles)
      end

      def character_select_title(character, title_id)
        title = Title.first(:conditions => ["character_id=? AND title_id=?", character.id, title_id])
        character.update_title(title)
        title_id = title.nil? ? nil : title.title_id

        update_title_evnet(character, title_id)
      end
    end
  end
end  
