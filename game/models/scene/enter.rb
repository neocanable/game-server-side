class Scene < ActiveRecord::Base
  class << self
    def retrieve_scene(zone, character)
      #      p "=========================="
      #      zone = Vici::Code.find(:ZONE, "id", 29)
      #      scene = Scene.find(26)
      #      return scene
      return retrieve_public_scene(zone) if is_public_zone?(zone["id"].to_i)
      character.party.nil? ? retrieve_player_scene(zone, character) : retrieve_party_scene(zone, character)
    end

    def find_public_scene(zone_id)
      #raise "not a public zone!" unless Zone.is_public?(zone_id)
      find_by_zone_id(zone_id)
    end


    private
      def retrieve_public_scene(zone)
        scene = Scene.first(:conditions => ["zone_id=?", zone["id"]])   
      end
      
      def retrieve_party_scene(zone, character)
        party = character.party
        return unless party_satisfy_conditions?(zone, party)
        scene,owner = get_party_scenes(zone, party)
      
        # 如果副本不存在
        if scene.nil?
          scene = Scene.create_scene(:zone_id => zone["id"], :difficulty_level => character.difficult_level, :in_queue => false)
        # 副本已经被污染了，并且副本的拥有者不是队长
        elsif !is_clean_scene?(scene) and owner != party.leader
          scene = Scene.create_scene(:zone_id => zone["id"], :difficulty_level => character.difficult_level, :in_queue => false)
        end
        scene
      end

      def retrieve_player_scene(zone, character)
        character ||= @player
        return unless member_satisfy_conditions?(zone, character)
        scene = character.scenes.first(:conditions => ["zone_id=?", zone["id"]])
        scene = Scene.create_scene(:zone_id => zone["id"], :difficulty_level => character.difficult_level, :in_queue => false) if scene.nil?
        scene
      end

      def get_party_scenes(zone, party)
        # 队长的副本
        scene = party.leader.scenes.first(:conditions => ["zone_id=?", zone['id']]) if party.leader
        return [scene, party.leader] if scene  # 如果队长有副本，那么使用队长的   
        # 队里面其他人的副本
        party.characters.each do |member|
          next if member == party.leader
          scene = member.scenes.first(:conditions => ["zone_id=?", zone["id"]])
          return [scene, member] if scene  # 返回队员的
        end 
        nil  # 队伍里面没有人拥有这个副本
      end 


  end


end
