#          id  1201
# description  加载游戏选项
#         api  options.load_options
#      params  
#        call  client
#     execute  vici

module Vici
  class LoadOptionsEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
