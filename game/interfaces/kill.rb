module Vici
  class KillInterface < Interface
    class << self
      
      def kill_items(dead_npc_id, scene_object, character)
        Drop.kill_npc_drop_items(dead_npc_id, scene_object, character)
        # 经验掉落
        if party = character.party
          party_kill_xp(dead_npc_id, character)
        else
          single_kill_xp(dead_npc_id, character)
        end
        kill_npc_quest_event(dead_npc_id, character)  
      end

      def clear_scene_objects
        SceneObject.find(:all, :conditions => ["elapses_at<? AND elapses_at<>0", Time.now.to_i]).each do |scene_object|
           p "delete scene object: #{scene_object.id}"         
           npc_corpse_remove(scene_object.scene_id, scene_object.unit_id, scene_object.scene_id, scene_object.character_id)
           SceneObjectItem.delete_all(:scene_object_id => scene_object.id )
        end
      end


      private
        def single_kill_xp(dead_npc_id, character)
          xp = Drop.exp_drop(dead_npc_id, character)
          character_gain_xp_event(character, xp)
          info_logger.xp_gain(dead_npc_id, character.scene.zone_id, character.id, character.level, character.profession, xp)
        end

        def party_kill_xp(dead_npc_id, character)
          exp = Drop.exp_drop(dead_npc_id, character)
          npc = static_npc(dead_npc_id)
          party = character.party
          party.characters.collect do |member|
            xp = Drop.party_member_exp_drop(character, party, npc, exp, member)
            character_gain_xp_event(member, xp)
          end
        end

    end
  end
end  
