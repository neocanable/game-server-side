#!/usr/local/ruby/bin/ruby

require 'rubygems'
require 'ruby-debug'
require 'active_support'
require 'json'
require 'optparse'

module Vici

  # 正式
  VICI_SERVER_HOST = "0.0.0.0"
  VICI_SERVER_PORT = nil
  VICI_LOG_PATH    = nil
  opts = OptionParser.new do |opts|
    opts.on("-p PORT", "--port PORT", "use port") do |val|
      VICI_SERVER_PORT = val
    end
  
    opts.on("-l LOG_PATH", "--log-path LOG_PATH", "log path") do |log_path|
      VICI_LOG_PATH = log_path
    end
  end 
  opts.parse(ARGV)
  
  raise "PORT not given!!!" if VICI_SERVER_PORT.nil?
  raise "LOG PATH not given!!" if VICI_LOG_PATH.nil?

  default_config = File.expand_path(File.dirname(__FILE__) + "/../conf/conf.rb")
  require default_config


  
  
  require File.expand_path(File.dirname(__FILE__) + '/../common/reactor')
  require File.expand_path(File.dirname(__FILE__) + '/../common/core_ext')
  require File.expand_path(File.dirname(__FILE__) + '/../conf/game_conf')
  require File.expand_path(File.dirname(__FILE__) + '/../common/static_data')

  VICI_LOGGER = Vici::Logger::Info.new(VICI_LOG_PATH) 
  logger = ::Logger.new(VICI_LOG_PATH) 
  logger.level = ::Logger::INFO  
  logger.formatter = proc {|severity, datetime, progname, msg| "%s %s\n" % [datetime.strftime('%Y-%m-%d %H:%M:%S'), msg] }

  INFO_LOGGER = Vici::Logger::Info.new(logger)
  DEBUG_LOGGER = Vici::Logger::Debug.new
  WARN_LOGGER  = Vici::Logger::Warn.new(logger)
  ERROR_LOGGER = Vici::Logger::Error.new(logger)

 
  require File.expand_path(File.dirname(__FILE__) + '/vici_handler')
  require File.expand_path(File.dirname(__FILE__) + '/vici_event')
  require File.expand_path(File.dirname(__FILE__) + '/vici_proc')
  require File.expand_path(File.dirname(__FILE__) + '/generates')
  require File.expand_path(File.dirname(__FILE__) + '/handler')
  require File.expand_path(File.dirname(__FILE__) + '/vici_dispatcher')
  require File.expand_path(File.dirname(__FILE__) + '/streams/vici_server_stream')
  require File.expand_path(File.dirname(__FILE__) + '/streams/game_center_client_stream')
  require File.expand_path(File.dirname(__FILE__) + '/vici_reactor')
  require File.expand_path(File.dirname(__FILE__) + '/connection_manager')
  require File.expand_path(File.dirname(__FILE__) + '/connection_info/vici_connection_info')
  require File.expand_path(File.dirname(__FILE__) + '/connection_info/game_center_connection_info')

  require File.expand_path(File.dirname(__FILE__) + '/../game/model')
  require File.expand_path(File.dirname(__FILE__) + '/../game/helper')
  require File.expand_path(File.dirname(__FILE__) + '/../game/interface')
  
  reactor = Vici::ViciReactor.instance
  reactor.init
  reactor.run
end
