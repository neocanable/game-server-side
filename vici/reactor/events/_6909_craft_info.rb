#          id  6909
# description  制造信息
#         api  craft.craft_info
#      params  branch_id rank:int points:int
#       notes  分支、等级、熟练度
#        call  vici
#     execute  client

module Vici
  class CraftInfoEvent < ViciEvent
    include Singleton

    attr_accessor :branch_id
    attr_accessor :rank
    attr_accessor :points
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6909
      Packet.pack([_event_id, @branch_id, @rank, @points, @_channel_id, @_account_id])
    end

    private
      def handler
        CraftInfoEventHandler.instance
      end
  end
end
