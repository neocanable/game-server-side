module Vici
  module InterfaceHelper
    def title_list_event(character, titles)
      event_titles = titles.collect do |title|
        event_title = TitleListEvent::Title.new
        event_title.title_id = title.title_id
        event_title
      end
      #title_list(titles, selected_title_id, _account_id = nil, _channel_id = 5)
      title_list(titles, character.current_title, character.account_id)
    end

    def update_title_event(character, title_id)
      update_title_evnet(character.id, title_id, character.scene_id, character.id)
      unit_title_changed(character.unit_id, title_id, character.scene_id)
    end
  end
end  

