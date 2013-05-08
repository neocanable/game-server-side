require 'ruby-debug'
require File.expand_path(File.dirname(__FILE__) + "/model_conf")

module Spec
  module Example
    class ExampleGroup
      extend StaticHelper
      include StaticHelper
    end
  end
end 

dbconfig = YAML::load(File.new(Conf::DATABASE_CONFIG))
ActiveRecord::Base.establish_connection(dbconfig["test"])

module Vici
  logger = ::Logger.new(STDOUT) 
  logger.level = ::Logger::DEBUG  
  logger.formatter = proc {|severity, datetime, progname, msg| "%s %s\n" % [datetime.strftime('%Y-%m-%d %H:%M:%S'), msg] }
  
  INFO_LOGGER = Vici::Logger::Info.new(logger)
  DEBUG_LOGGER = Vici::Logger::Debug.new
  WARN_LOGGER  = Vici::Logger::Warn.new(logger)
  ERROR_LOGGER = Vici::Logger::Error.new(logger)
end
