module Vici
  # 标准时钟
  TICK_PER_SECOND = 4

  # 场景NPC_ID偏移
  NPC_ID_OFFSET = 100_000_000

  # 场景物品ID偏移
  OBJECT_ID_OFFSET = 200_000_000




  # 和NPC对话的合法距离（格子数）
  GOSSIP_VALID_DISTANCE = 10



  # 角色移动力
  MAX_MOVE_POINTS = 1900
  # 角色移动速度
  STANDARD_SPEED = 200

  # 副本过期时间
  INSTANCE_EXPIRED_TIME = 5 * 60  # 5 minutes

  # 动作条的槽位数量
  ACTION_BAR_MAX_SLOTS = 10

  # 角色副本精力值
  MAX_VIGOR = 230



  BAG_DEFAULT_SLOTS = 28
  BAG_MAX_SLOTS = 49
  
  BANK_DEFAULT_SLOTS = 45
  BANK_MAX_SLOTS = 15*9

  BANK_UNLOCK_SIZE = 15

  INVENTORY_MAX_SLOTS = 12

  BUYBACK_MAX_SLOTS = 12

  # 配方最多的材料数量
  RECIPE_MAX_MATERIALS = 6

  # 队伍最大成员（5人）
  PARTY_MAX_MEMBERS = 5
  PARTY_INVITE_TIMEOUT = 30


  # 任务目标
  QUEST_MAX_OBJECTIVES = 4
  # 任务奖励
  QUEST_MAX_REWARDS = 6

  # 玩家最多能接的任务
  PLAYER_MAX_QUEST = 25

  # 商城每页显示的商品数量
  MALL_ITEMS_PER_PAGE = 12
  
  # 世界聊天频道消耗钻石
  SYSTEM_CHANNEL_DIAMOND = 1


  # 集卡册，每页显示的卡片数量（扉页，普通页）
  CARD_NUMS_IN_FIRST_PAGE = (1 + 9)
  CARD_NUMS_PER_PAGE = (9 + 9)

  # 装备耐久几率
  ARAMOR_DAMAGE_PROBABILITY = 100
  ARAMOR_DAMAGE_POINT       = 1

  # 武器耐久几率
  WEAPON_DAMAGE_PROBABILITY = 100
  WEAPON_DAMAGE_POINT       = 1

  # 如果超过时间没进入战场，则取消资格
  BATTLEGROUND_EXPIRED_TIME = 30

  # 战场会给予玩家一些准备时间才开始
  BATTLEGROUND_BEGIN_TIME = 60

  # 战场人数不够，或战场结束后，会在一定时间内关闭
  BATTLEGROUND_CLOSE_TIME = 60

  # 每页显示多少战场
  BATTLEGROUNDS_PER_PAGE = 10


  # 玩家荣誉上限
  PLAYER_MAX_HONOR = 75000

  
  # 掉线玩家缺省删除时间
  DROPLINE_CHARACTERS_EXPIRED_TIME = 30


  # 缺省的消失时间
  SCENE_OBJECT_ELAPSE_TIME = 30 

  # 关闭拾取框后的消失时间
  SCENE_OBJECT_ELAPSE_TIME_AFTER_LOOT = 10 

  # 邮件分页
  MAILS_PER_PAGE = 5
  
  # 邮资
  MAIL_COST = 10

  # 好友分页,忽略列表分页
  FRIENDS_PER_PAGE = 20
  IGNORES_PER_PAGE = 20
  MAX_FRIENDS_SIZE = 100
  MAX_IGNORES_SIZE = 100


  MONEY_ID = 200
#  MONEY_ID = Vici::Code.first(:ITEM, 'name', "钱").id

  DEBUG_REQUEST_INFO = true
  DEBUG_TRACE_EXCEPTION = true
  DEBUG_TRACE_CREATE_ACCOUNT = true
end

