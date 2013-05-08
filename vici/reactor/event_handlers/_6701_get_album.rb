#          id  6701
# description  集卡册
#         api  album.get_album
#      params  page
#        call  client
#     execute  vici

module Vici
  class GetAlbumEventHandler < ViciEventHandler
    def execute(event)
      page = event.page
      raise "Overwrite me!"
    end
  end
end
