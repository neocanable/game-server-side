module Vici
  class << KillEventHandler.instance
    def execute(event)
      killer_unit_id = event.killer_unit_id
      dead_unit_id = event.dead_unit_id
      corpse_id = event.corpse_id
      x = event.x
      y = event.y

      killer_id = get_killer_id(killer_unit_id)
      dead_character_id = is_character?(dead_unit_id) ? to_id(dead_unit_id) : nil
      dead_npc_id       = is_npc?(dead_unit_id) ? to_id(dead_unit_id) : nil
      dead_npc_id       = SceneNpc.find_by_id(dead_npc_id).static_npc_id

      character    = Character.find_by_id(killer_id)
      scene_object = SceneObject.find_by_id(to_id(corpse_id))
      
      KillInterface.kill_items(dead_npc_id, scene_object, character)
      # 尸体掉落
      npc_corpse_info(corpse_id, dead_unit_id, dead_npc_id, x, y, character.id, character.party_id, character.scene_id)
    end

    private
    
      def get_killer_id(unit_id)
        if unit_id.to_s.size < 8
          unit_id
        else
          killer_id = is_character?(killer_unit_id) ? to_id(killer_unit_id) : nil
        end
      end
      
      def is_npc?(unit_id)
        unit_id.to_s[0..0].to_i == 1
      end

      def is_character?(unit_id)
        unit_id.to_s[0..0].to_i == 0
      end

      def to_id(unit_id)
        unit_id.to_s[1..-1].to_i
      end
  end

  class << ClearCorpsesEventHandler.instance
    def execute(event)
      tick = event.tick

      KillInterface.clear_scene_objects
    end
  end
end
