#!/usr/local/ruby/bin/ruby

require 'rubygems'
require 'ruby-debug'
require 'active_support'
require 'json'
require 'optparse'

module Pulse
    
  PULSE_LOG_PATH = nil
  opts = OptionParser.new do |opts|
    opts.on("-l LOG_PATH", "--log-path LOG_PATH", "log path") do |log_path|
      PULSE_LOG_PATH = log_path
    end 
  end 
  opts.parse(ARGV)
          
  raise "LOG PATH not given!!" if PULSE_LOG_PATH.nil?


  default_config = File.expand_path(File.dirname(__FILE__) + "/../conf/conf.rb")
  pulse_config   = File.expand_path(File.dirname(__FILE__) + "/../conf/pulse_conf.rb")
  require default_config
  require pulse_config
  
  require File.expand_path(File.dirname(__FILE__) + '/../common/reactor')
  require File.expand_path(File.dirname(__FILE__) + '/../common/core_ext')
  require File.expand_path(File.dirname(__FILE__) + '/../conf/game_conf')
  require File.expand_path(File.dirname(__FILE__) + '/../common/static_data' )
  
  require File.expand_path(File.dirname(__FILE__) + '/../game/model')
  #require File.expand_path(File.dirname(__FILE__) + '/../game/helper')
  
  require File.expand_path(File.dirname(__FILE__) + '/pulse_handler')
  require File.expand_path(File.dirname(__FILE__) + '/pulse_event')
  require File.expand_path(File.dirname(__FILE__) + '/pulse_proc')
  require File.expand_path(File.dirname(__FILE__) + '/generates')
  require File.expand_path(File.dirname(__FILE__) + '/handler')
  
  require File.expand_path(File.dirname(__FILE__) + '/lib/pulse_worker')
  require File.expand_path(File.dirname(__FILE__) + '/lib/init_scene')
  require File.expand_path(File.dirname(__FILE__) + '/lib/init_task')
  require File.expand_path(File.dirname(__FILE__) + '/lib/tick')
  
  
  require File.expand_path(File.dirname(__FILE__) + '/pulse_dispatcher')
  require File.expand_path(File.dirname(__FILE__) + '/pulse_server_connection_info')
  require File.expand_path(File.dirname(__FILE__) + '/streams/game_center_client_stream')
  require File.expand_path(File.dirname(__FILE__) + '/streams/pulse_server_stream')
  require File.expand_path(File.dirname(__FILE__) + '/pulse_reactor')
  require File.expand_path(File.dirname(__FILE__) + '/connection_manager')
  
  
  
  PULSE_LOGGER = ::Logger.new(PULSE_LOG_PATH)
  PULSE_LOGGER.formatter = proc {|severity, datetime, progname, msg| "%s %s\n" % [datetime.strftime('%Y-%m-%d %H:%M:%S'), msg] } 
  PULSE_LOGGER.level = ::Logger::INFO
  
  
  TICK_INTERVAL = 0.25
  SLEEP_INTERVAL = 0.01
  
  reactor = Pulse::PulseReactor.instance
  reactor.init
  reactor.run
end
