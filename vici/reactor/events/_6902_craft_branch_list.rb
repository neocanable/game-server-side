#          id  6902
# description  制造分支列表
#         api  craft.craft_branch_list
#      params  branch_list[branch_id]
#        call  vici
#     execute  client

module Vici
  class CraftBranchListEvent < ViciEvent
    include Singleton

    class BranchList
      attr_accessor :branch_id
    end
    attr_accessor :branch_lists
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      branch_lists = @branch_lists.collect do |branch_list|
        [branch_list.branch_id]
      end
      _event_id = 6902
      Packet.pack([_event_id, branch_lists, @_channel_id, @_account_id])
    end

    private
      def handler
        CraftBranchListEventHandler.instance
      end
  end
end
