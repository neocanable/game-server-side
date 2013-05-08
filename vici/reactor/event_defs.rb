module EventDefs
  module AccountScope
    SINGLE = 1  #单个帐号
    GROUP = 2  #一组帐号
    ALL = 3  #所有帐号
  end

  module App
    CLIENT = 1  #客户端
    GATEWAY = 2  #网关
    EVENT_POOL = 3  #事件池
    GAME_CENTER = 4  #游戏服务器
    CHAT = 5  #聊天服务器
    SCENE_MANAGER = 6  #场景服务器管理
    SCENE_WORKER = 7  #场景服务器
    VICI_PROXY = 8  #逻辑服务器代理
    VICI = 9  #逻辑服务器
    PULSE = 10  #心跳服务器
    USER_CENTER = 11  #用户中心
  end

  module Channel
    NONE = 0  #空
    ALL = 1  #全
    SYSTEM = 2  #系统
    ZONE = 3  #区域
    SCENE = 4  #场景
    ACCOUNT = 5  #帐号
    CHARACTER = 6  #角色
    PARTY = 7  #组队
    GUILD = 8  #公会
    SCREEN = 9  #屏幕
  end

  module Scene
    NA = 0  #不相关
    SCENE = 1  #场景
    CHARACTER = 2  #角色
  end

end
