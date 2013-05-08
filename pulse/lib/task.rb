# encoding: utf-8
module Pulse
  TASKS = []
  class Task
    def initialize(interval)
      raise "block is required!" unless block_given?
      @interval = interval
      @next_run = 0
      @proc = Proc.new
    end
  
    def process(tick)
      puts tick
      if tick >= @next_run then
        @next_run += @interval
        @proc.call(tick)
      end
    end
  
#    def self.connection
#      ActiveRecord::Base.connection       
#    end
#  
#  
#    # TODO 副本，运行
#    def self.process_scenes(tick)
#      GatewayServer.process("pulse/process_scenes")
#    end
#  
#    def self.process_instance(tick)
#      #puts "process_instance"
#      20.times { print '.' }
#      sleep 0.001
#      x = Instance.find_all
#      p x
#      GatewayServer.process("pulse/process_instance")
#    end
#  
#    # TODO 副本回收
#    def self.destroy_instance(tick)
#      GatewayServer.process("pulse/destroy_instance")
#    end
#  
#    # TODO 超时掉线
#    def self.clean_dropped_players(tick)
#      GatewayServer.process("pulse/clean_dropped_players")
#    end
#  
#    # TODO 系统公告
#    def self.announcement(tick)
#      GatewayServer.process("pulse/announcement")
#    end
#  
#    # TODO 临时，移动
#    def self.move_all(tick)
#      GatewayServer.process("pulse/move_all")
#    end
#  	
#    # 组队邀请
#    def self.set_party_invite_time_out(tick)
#      delete_sql = "DELETE FROM `party_invite_requests` WHERE `elapsed`< #{Time.now.to_i - Vici::PARTY_INVITE_TIMEOUT}"
#      connection.execute(delete_sql)
#    end   
#  
#    # 玩家精力值
#    def self.update_player_vigor
#      connection.execute("UPDATE `characters` set vigor=vigor+10 where vigor < #{Vici::MAX_VIGOR}")
#      connection.execute("UPDATE `characters` set vigor=240 where vigor > #{Vici::MAX_VIGOR}")
#    end
#  
#    def self.update_battleground_queue
#  		GatewayServer.process("pulse/battle_queue_timer")
#  	end		
#      
#    # 掉落物品清理
#    def self.scene_object_clean_up
#      sql = "SELECT `scene_id`,`id` FROM `scene_objects` where `elapses_at`< #{Time.now.to_i} AND `elapses_at`<>0"
#      connection.select_all(sql).each do |scene_object|
#         id = scene_object["id"].to_i
#         p "delete scene object: #{scene_object["id"]}"
#         if Vici::SceneManager.instance.destroy_object(scene_object["scene_id"].to_i, Vici::OBJECT_ID_OFFSET+scene_object["id"].to_i)
#           connection.execute("DELETE FROM `scene_object_items` where `scene_object_id`=#{id}")
#         end
#      end
#    end
#  
#    # 玩家掉线
#    def self.drop_line_expire
#      select_sql = "SELECT * FROM `characters` WHERE `online`=#{Vici::Online::DROPLINE} and `logout_time`< '#{Time.now.strftime("%Y-%m-%d %H-%M-%S")}'"
#      update_sql = "UPDATE `characters` set `online`=#{Vici::Online::OFFLINE} WHERE `online`=#{Vici::Online::DROPLINE} and `logout_time`< '#{Time.now.strftime("%Y-%m-%d %H-%M-%S")}'"
#      connection.select_all(select_sql).each do |character|
#        Vici::SceneManager.instance.leave_scene(character["id"].to_i)
#      end
#      connection.execute(update_sql)
#    end
  
  
  end
end
