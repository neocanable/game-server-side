#          id  6702
# description  集卡册
#         api  album.album
#      params  page card[card_index gain_time:str]
#        call  vici
#     execute  client

module Vici
  class AlbumProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
