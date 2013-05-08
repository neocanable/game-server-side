module Vici
#  class << EnterGameEventHandler.instance
#    def execute(event)
#      character_id = event.character_id
#      
#      character = Character.find_by_id(character_id)
#      scene = Scene.find_by_id(4)
#      #scene = Scene.find_by_zone_id(1000)
#      enter_scene(character.id, scene.id, character.x, character.y)
#    end
#  end
end
