module Vici
  class GetAlbumEventHandler < ViciEventHandler
    def execute(event)
      page = event.page
      character_id = event._character_id
      character = Character.find_by_id(character_id)

      AlbumInterface.list(character, page)
    end
  end
end
