# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110511062743) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "last_login"
    t.integer  "role"
    t.string   "token"
    t.integer  "last_access"
    t.boolean  "multi_login"
    t.integer  "diamond",         :default => 0, :null => false
    t.boolean  "mute"
    t.integer  "music_volume"
    t.integer  "sound_volume"
    t.integer  "field_of_vision"
    t.string   "user_id",                        :null => false
  end

  create_table "action_bars", :force => true do |t|
    t.integer "character_id"
    t.integer "slot_index"
    t.integer "spell_id"
    t.integer "item_id"
  end

  create_table "albums", :force => true do |t|
    t.integer  "character_id"
    t.integer  "card_num"
    t.datetime "gain_time"
  end

  create_table "auras", :force => true do |t|
    t.integer  "character_id", :null => false
    t.integer  "aura_id",      :null => false
    t.datetime "elapses_at",   :null => false
  end

  create_table "battle_players", :force => true do |t|
    t.integer "character_id"
    t.integer "battleground_id",      :default => 0, :null => false
    t.integer "battleground_faction"
    t.integer "kills",                :default => 0, :null => false
    t.integer "deaths",               :default => 0, :null => false
    t.integer "bouns_honor",          :default => 0, :null => false
  end

  create_table "battle_queues", :force => true do |t|
    t.integer "character_id",           :default => 0, :null => false
    t.boolean "first_avaliable"
    t.integer "battleground_id",        :default => 0, :null => false
    t.integer "battleground_faction"
    t.integer "battleground_joined_at"
    t.integer "elapses_at"
  end

  create_table "battleground_objectives", :force => true do |t|
    t.integer "battleground_id"
    t.integer "objective_id"
  end

  create_table "battlegrounds", :force => true do |t|
    t.integer "battle_id"
    t.integer "red_kills",   :default => 0
    t.integer "blue_kills",  :default => 0
    t.integer "created_at"
    t.integer "closes_at"
    t.integer "began_at"
    t.integer "scene_id"
    t.integer "red_number",  :default => 0
    t.integer "blue_number", :default => 0
    t.integer "max_number"
  end

  create_table "buybacks", :force => true do |t|
    t.integer "character_id"
    t.integer "item_id"
  end

  create_table "characters", :force => true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.integer  "appearance"
    t.integer  "profession"
    t.integer  "level"
    t.integer  "xp"
    t.integer  "money"
    t.integer  "static_zone_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "online"
    t.datetime "logout_time"
    t.integer  "health"
    t.integer  "power"
    t.integer  "scene_id"
    t.integer  "unspent_points"
    t.integer  "party_id",            :default => 0, :null => false
    t.integer  "difficult_level"
    t.integer  "vigor"
    t.integer  "voucher",             :default => 0, :null => false
    t.integer  "current_title"
    t.integer  "is_dead",             :default => 0
    t.integer  "dead_at",             :default => 0
    t.integer  "honor",               :default => 0, :null => false
    t.boolean  "show_newbie_tips"
    t.boolean  "block_trades"
    t.boolean  "block_party_invites"
  end

  create_table "containers", :force => true do |t|
    t.integer "character_id"
    t.integer "container_type"
    t.integer "max_slot"
  end

  create_table "cooldowns", :force => true do |t|
    t.integer  "character_id", :null => false
    t.integer  "cooldown_id",  :null => false
    t.datetime "elapses_at",   :null => false
  end

  create_table "crafts", :force => true do |t|
    t.integer "character_id"
    t.integer "craft_branch_id"
    t.integer "points",          :default => 0
    t.integer "rank"
  end

  create_table "friends", :force => true do |t|
    t.integer  "character_id", :default => 0,  :null => false
    t.string   "note",         :default => ""
    t.datetime "created_at"
    t.integer  "friend_id",    :default => 0,  :null => false
  end

  create_table "ignores", :force => true do |t|
    t.integer  "character_id", :default => 0,  :null => false
    t.string   "note",         :default => ""
    t.datetime "created_at"
    t.integer  "ignore_id",    :default => 0,  :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "character_id"
    t.integer  "container_id"
    t.integer  "slot_index"
    t.integer  "static_item_id"
    t.integer  "durability"
    t.integer  "max_durability"
    t.datetime "expired"
    t.integer  "quantity"
    t.datetime "updated_at"
    t.integer  "strength"
    t.integer  "intellect"
    t.integer  "vitality"
    t.integer  "hit_rating"
    t.integer  "crit_rating"
    t.integer  "dodge_rating"
    t.integer  "min_attack"
    t.integer  "max_attack"
    t.integer  "damage"
    t.integer  "defense"
    t.integer  "spell_min_attack"
    t.integer  "spell_max_attack"
    t.integer  "spell_damage"
    t.integer  "spell_defense"
    t.integer  "max_health"
    t.integer  "health_regeneration"
    t.integer  "max_power"
    t.integer  "power_regeneration"
    t.integer  "attack_speed"
    t.integer  "move_speed"
    t.boolean  "locked",              :default => false, :null => false
  end

  create_table "loot_rolls", :force => true do |t|
    t.integer "loot_id",         :default => 0, :null => false
    t.integer "character_id",    :default => 0, :null => false
    t.integer "option_id"
    t.integer "number"
    t.integer "scene_object_id", :default => 0, :null => false
  end

  create_table "loots", :force => true do |t|
    t.integer "scene_object_item_id", :default => 0, :null => false
    t.integer "elapses_at"
  end

  create_table "mail_attachments", :force => true do |t|
    t.integer "mail_id"
    t.integer "item_id"
    t.integer "quantity"
  end

  create_table "mails", :force => true do |t|
    t.integer  "character_id"
    t.string   "subject"
    t.string   "content"
    t.integer  "money"
    t.boolean  "unread"
    t.datetime "created_at"
    t.integer  "sender_id"
  end

  create_table "malls", :force => true do |t|
    t.integer "tab"
    t.integer "index"
    t.integer "static_item_id"
    t.integer "stack"
    t.integer "diamond_price"
    t.integer "voucher_price"
  end

  create_table "open_loots", :force => true do |t|
    t.integer "scene_object_id"
    t.integer "character_id"
  end

  create_table "parties", :force => true do |t|
    t.integer "leader_id",         :default => 0, :null => false
    t.integer "loot_method"
    t.integer "loot_threshold"
    t.integer "number_of_members"
    t.integer "loot_order"
  end

  create_table "party_invite_requests", :force => true do |t|
    t.integer "leader_id"
    t.integer "target_id"
    t.integer "elapsed"
  end

  create_table "paths", :force => true do |t|
    t.integer "character_id"
    t.integer "x"
    t.integer "y"
    t.integer "o"
    t.integer "cost"
  end

  create_table "player_completed_quests", :force => true do |t|
    t.integer  "character_id"
    t.integer  "quest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completed_times"
  end

  add_index "player_completed_quests", ["character_id"], :name => "index_player_completed_quests_on_character_id"

  create_table "player_dungeon_scores", :force => true do |t|
    t.integer  "character_id",    :null => false
    t.integer  "dungeon_zone_id"
    t.integer  "score"
    t.datetime "updated_at"
  end

  create_table "player_quests", :force => true do |t|
    t.integer "character_id",        :default => 0, :null => false
    t.integer "quest_id",            :default => 0, :null => false
    t.integer "objective1_progress", :default => 0
    t.integer "objective2_progress", :default => 0
    t.integer "objective3_progress", :default => 0
    t.integer "objective4_progress", :default => 0
  end

  add_index "player_quests", ["character_id"], :name => "index_player_quests_on_character_id"

  create_table "player_scenes", :force => true do |t|
    t.integer "character_id"
    t.integer "scene_id"
    t.integer "score1",       :default => 0
    t.integer "score2",       :default => 0
    t.integer "score3",       :default => 0
    t.integer "score4",       :default => 0
  end

  create_table "recipes", :force => true do |t|
    t.integer "character_id"
    t.string  "recipe"
    t.integer "craft_branch_id"
  end

  create_table "resurrects", :force => true do |t|
    t.integer "character_id"
    t.integer "elapses_at"
  end

  create_table "scene_npcs", :force => true do |t|
    t.integer "static_npc_id", :null => false
    t.integer "scene_id",      :null => false
    t.integer "x",             :null => false
    t.integer "y",             :null => false
    t.boolean "is_dead",       :null => false
    t.integer "dead_at"
  end

  create_table "scene_object_items", :force => true do |t|
    t.integer "scene_object_id", :default => 0, :null => false
    t.integer "static_item_id",  :default => 0, :null => false
    t.integer "quantity"
  end

  create_table "scene_objects", :force => true do |t|
    t.integer "scene_id"
    t.integer "created_at"
    t.integer "elapses_at"
    t.integer "x",            :null => false
    t.integer "y",            :null => false
    t.integer "character_id"
    t.integer "party_id"
  end

  create_table "scenes", :force => true do |t|
    t.integer  "zone_id",          :null => false
    t.integer  "player_number",    :null => false
    t.datetime "leave_at"
    t.boolean  "in_queue"
    t.integer  "difficulty_level"
    t.integer  "open_at"
  end

  create_table "slots", :force => true do |t|
    t.integer "container_id"
    t.integer "slot_index"
    t.integer "item_id"
  end

  create_table "spells", :force => true do |t|
    t.integer "character_id"
    t.integer "spell_id"
    t.integer "rank"
  end

  create_table "titles", :force => true do |t|
    t.integer "character_id"
    t.integer "title_id"
  end

  create_table "trade_items", :force => true do |t|
    t.integer "trade_id"
    t.integer "character_id"
    t.integer "trade_slot_index"
    t.integer "container_id"
    t.integer "slot_index"
    t.integer "static_item_id"
    t.integer "quantity"
  end

  create_table "trades", :force => true do |t|
    t.integer "state"
    t.integer "character1_id"
    t.integer "character1_money", :default => 0
    t.integer "character2_id"
    t.integer "character2_money", :default => 0
  end

end
