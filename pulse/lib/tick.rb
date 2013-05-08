# encoding: utf-8
module Pulse
  class Tick
    def self.now
      @tick
    end
  
    def self.wait_till_next_tick
      loop do
        break if new_tick?
        sleep SLEEP_INTERVAL
      end
    end
  
    private
      @tick = 0
      @tick_time = Time.new
  
      def self.new_tick?
        now_time = Time.new
        return false if (now_time - @tick_time) < TICK_INTERVAL
        @tick_time = now_time
        @tick += 1
        return true
      end
  end
end
