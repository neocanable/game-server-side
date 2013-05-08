module Conf
  GAME_CENTER_HOST = "192.168.254.50" 
  GAME_CENTER_PORT = 10603

#  GAME_CENTER_HOST = "192.168.254.189" 
#  GAME_CENTER_PORT = 10603

  PULSE_HOST = "0.0.0.0" 
  PULSE_PORT = 10604

  DATABASE_CONFIG = File.expand_path(File.dirname(__FILE__) + "/../backend/config/database.yml") 
end
