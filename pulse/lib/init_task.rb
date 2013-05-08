# encoding: utf-8
require 'yaml'
require 'timeout'

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
  end

  class PulseWorker

      def init_tasks
        return if @tasks_inited
        #return unless @system_channel_inited and has_init_public_scenes?
        return unless @system_channel_inited
        TASKS.clear
        # 时钟
        TASKS << Task.new(Conf::TICK){|tick| process(tick) }
        TASKS << Task.new(16){|tick| process_game_center(tick) }
        
        TASKS << Task.new(16){|tick| clear_corpses(tick) }
        TASKS << Task.new(480){|tick| clear_party_invite_timed_out(tick) }
        TASKS << Task.new(480){|tick| process_equipment_timed_out(tick)}  
        # TASK << Task.new(16){|tick| update_players_vigor(tick) }

        @tasks_inited = true
      end
       
  end  
end
