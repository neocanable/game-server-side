module Vici
  class SceneInterface < Interface
    class << self

      def goto_portal(character, portal_id)
        portal, dest = Portal.find(portal_id)
        p "call here"
        scene_enter(character.id, dest["zone"].to_i, dest["x"].to_i, dest["y"].to_i)
      end

    end
  end
end  
