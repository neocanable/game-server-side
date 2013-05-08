# encoding: utf-8
require 'yaml'
require 'timeout'

module Pulse
  class PulseWorker

      def init_public_scenes
        #return if has_init_public_scenes?
        return unless game_center_connected?
        puts "running for create_public_scenes"
        create_public_scenes

        sleep(5)
      end 


      def init_system_channel
        return if @system_channel_inited
        return unless game_center_connected?
        create_system_channel
        @system_channel_inited = true
      end

      def remove_public_zone(scene_id)
        sql = "SELECT * FROM scenes WHERE id='#{scene_id}'" 
        scene = db_connection.select_one(sql)
        next if scene.nil?
        @public_zones.delete_if{|zone| zone['id'].to_i == scene["zone_id"].to_i }
      end

      def send_system_up
        return if @system_up
        return unless has_finish_initialize?
        return unless game_center_connected?
        system_up
        @system_up = true
      end

  
      private

        def can_send_system_up?
          #has_init_public_scenes? and @system_channel_inited
          @system_channel_inited
        end

        def has_init_public_scenes?
          @public_zones.size == 0 
        end
    
        def reset_tables
          %w(battlegrounds battleground_objectives battle_players battle_queues buybacks loots loot_rolls open_loots party_invite_requests player_scenes resurrects scenes scene_npcs scene_objects scene_object_items trades trade_items parties).each do |table_name|
            db_connection.execute "TRUNCATE #{table_name}"
          end
          db_connection.execute "UPDATE `characters` set party_id=0"
        end
    
        def create_public_scenes
          @public_zones.each do |zone|
            zone_id = zone['id']
            scene = find_scene_by_zone_id(zone_id)
            scene_id = scene.nil? ? create_scene_with_zone_id(zone_id) : scene["id"].to_i
            create_public_scene(scene_id, zone_id)
          end 
          #@public_zones = []
        end

        def find_scene_by_zone_id(zone_id)
          select_sql = "SELECT * FROM scenes where zone_id=#{zone_id}"
          db_connection.select_one(select_sql)         
        end

        def create_scene_with_zone_id(zone_id)
          sql = "INSERT INTO scenes(zone_id,player_number,in_queue) values(#{zone_id},0,0)"
          db_connection.insert_sql(sql)
        end

  end  
end
