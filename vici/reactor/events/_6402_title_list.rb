#          id  6402
# description  玩家称号列表
#         api  title.title_list
#      params  title[title_id] selected_title_id:int
#        call  vici
#     execute  client

module Vici
  class TitleListEvent < ViciEvent
    include Singleton

    class Title
      attr_accessor :title_id
    end
    attr_accessor :titles
    attr_accessor :selected_title_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      titles = @titles.collect do |title|
        [title.title_id]
      end
      _event_id = 6402
      Packet.pack([_event_id, titles, @selected_title_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TitleListEventHandler.instance
      end
  end
end
