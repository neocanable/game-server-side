# encoding: utf-8
require 'yaml'

module Pulse
  class PulseWorker
      include ProcHelper
      include Singleton

      attr_accessor :system_channel_inited

      def initialize
        #@public_zones          = Vici::Code.find(:ZONE, 'type', Vici::ZoneType::SAFETY_AREA, Vici::ZoneType::WILD_AREA)
        @system_channel_inited = false
        @tasks_inited          = false

        connect_to_database    # 连接数据库
        reset_tables           # 重置数据库表
        reset_character_status # 重置玩家状态
      end
      
      def startup
        init_system_channel    # 初始化系统频道
        #init_public_scenes     # 创建公共场景 
        init_tasks             # 初始化定时任务
        send_system_up
      end
    
      def shutdown
        TASKS.clear
        close_connection
        puts "server down."
      end

      def has_finish_initialize?
        #has_init_public_scenes? and @system_channel_inited and @tasks_inited
        #has_init_public_scenes? and 
        @system_channel_inited and @tasks_inited
      end

      private
        def reset_character_status
          db_connection.execute("UPDATE `characters` set `online`=#{Vici::Online::OFFLINE}")
        end

        def connect_to_database
          dbconfig = YAML::load(File.new(Conf::DATABASE_CONFIG))
          ActiveRecord::Base.establish_connection(dbconfig["development"])
        end

        def close_connection
          ActiveRecord::Base.clear_active_connections!
        end

        def game_center_connected?
          ConnectionManager.instance.pulse_center.size >= 2
        end

        def connection_manager
          ConnectionManager.instance
        end

        def db_connection
          ActiveRecord::Base.connection
        end
        
  end  
end
