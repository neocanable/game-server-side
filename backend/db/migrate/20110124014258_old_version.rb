class OldVersion < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string   :name
      t.string   :salt
      t.datetime :created_at
      t.datetime :last_login
      t.integer  :role
      t.string   :token
      t.integer  :last_access
      t.boolean  :multi_login
      t.integer  :diamond,         :default => 0, :null => false
      t.boolean  :mute
      t.integer  :music_volume
      t.integer  :sound_volume
      t.integer  :field_of_vision
    end

    create_table :action_bars do |t|
      t.integer :character_id
      t.integer :slot_index
      t.integer :spell_id
      t.integer :item_id
    end

    create_table :albums do |t|
      t.integer  :character_id
      t.integer  :card_num
      t.datetime :gain_time
    end

    create_table :auras do |t|
      t.integer  :character_id, :null => false
      t.integer  :aura_id,      :null => false
      t.datetime :elapses_at,   :null => false
    end

    create_table :battle_players do |t|
      t.integer :character_id
      t.integer :battleground_id,       :null => false, :default => 0
      t.integer :battleground_faction
      t.integer :kills,                 :null => false, :default => 0
      t.integer :deaths,                :null => false, :default => 0
      t.integer :bouns_honor,           :null => false, :default => 0
    end

    create_table :battle_queues do |t|
      t.integer :character_id,          :null => false, :default => 0
      t.boolean :first_avaliable
      t.integer :battleground_id,       :null => false, :default => 0
      t.integer :battleground_faction
      t.integer :battleground_joined_at
      t.integer :elapses_at
    end

    create_table :battleground_objectives do |t|
      t.integer :battleground_id
      t.integer :objective_id
    end

    create_table :battlegrounds do |t|
      t.integer :battle_id
      t.integer :red_kills,           :default => 0
      t.integer :blue_kills,          :default => 0
      t.integer :created_at
      t.integer :closes_at
      t.integer :began_at
      t.integer :scene_id
      t.integer :red_number,          :default => 0
      t.integer :blue_number,         :default => 0
      t.integer :max_number
    end

    create_table :buybacks do |t|
      t.integer :character_id
      t.integer :item_id
    end

    create_table :characters do |t|
      t.integer  :account_id
      t.string   :name
      t.integer  :appearance
      t.integer  :profession
      t.integer  :level
      t.integer  :xp
      t.integer  :money
      t.integer  :static_zone_id
      t.integer  :x
      t.integer  :y
      t.integer  :online
      t.datetime :logout_time
      t.integer  :health
      t.integer  :power
      t.integer  :scene_id
      t.integer  :unspent_points
      t.integer  :craft
      t.integer  :craft_rank
      t.integer  :craft_points
      t.integer  :party_id,            :default => 0, :null => false
      t.integer  :difficult_level
      t.integer  :vigor
      t.integer  :voucher,             :default => 0, :null => false
      t.integer  :current_title
      t.integer  :is_dead,             :default => 0
      t.integer  :dead_at,             :default => 0
      t.integer  :honor,               :default => 0, :null => false
      t.boolean  :show_newbie_tips
      t.boolean  :block_trades
      t.boolean  :block_party_invites
    end

    create_table :containers do |t|
      t.integer :character_id
      t.integer :container_type
      t.integer :max_slot
    end

    create_table :cooldowns do |t|
      t.integer  :character_id, :null => false
      t.integer  :cooldown_id,  :null => false
      t.datetime :elapses_at,   :null => false
    end

    create_table :friends do |t|
      t.integer  :character_id,   :default => 0, :null => false
      t.string   :note,           :default => ""
      t.datetime :created_at
      t.integer  :friend_id,      :default => 0, :null => false
    end

    create_table :ignores do |t|
      t.integer  :character_id,   :default => 0, :null => false
      t.string   :note,           :default => ""
      t.datetime :created_at
      t.integer  :ignore_id,      :default => 0, :null => false
    end

    create_table :items do |t|
      t.integer  :character_id
      t.integer  :container_id
      t.integer  :slot_index
      t.integer  :static_item_id
      t.integer  :durability
      t.integer  :max_durability
      t.datetime :expired
      t.integer  :quantity
      t.datetime :updated_at
      t.integer  :strength
      t.integer  :intellect
      t.integer  :vitality
      t.integer  :hit_rating
      t.integer  :crit_rating
      t.integer  :dodge_rating
      t.integer  :min_attack
      t.integer  :max_attack
      t.integer  :damage
      t.integer  :defense
      t.integer  :spell_min_attack
      t.integer  :spell_max_attack
      t.integer  :spell_damage
      t.integer  :spell_defense
      t.integer  :max_health
      t.integer  :health_regeneration
      t.integer  :max_power
      t.integer  :power_regeneration
      t.integer  :attack_speed
      t.integer  :move_speed
    end

    create_table :loot_rolls do |t|
      t.integer :loot_id,              :null => false, :default => 0
      t.integer :character_id,         :null => false, :default => 0
      t.integer :option_id
      t.integer :number
      t.integer :scene_object_id,      :null => false, :default => 0
    end

    create_table :loots do |t|
      t.integer :scene_object_item_id, :null => false, :default => 0
      t.integer :elapses_at
    end

    create_table :mail_attachments do |t|
      t.integer :mail_id
      t.integer :item_id
      t.integer :quantity
    end

    create_table :mails do |t|
      t.integer  :character_id
      t.string   :subject
      t.string   :content
      t.integer  :money
      t.boolean  :unread
      t.datetime :created_at
      t.integer  :sender_id
    end

    create_table :malls do |t|
      t.integer :tab
      t.integer :index
      t.integer :static_item_id
      t.integer :stack
      t.integer :diamond_price
      t.integer :voucher_price
    end

    create_table :open_loots do |t|
      t.integer :scene_object_id
      t.integer :character_id
    end

    create_table :parties do |t|
      t.integer :leader_id,         :default => 0, :null => false
      t.integer :loot_method
      t.integer :loot_threshold
      t.integer :number_of_members
      t.integer :loot_order
    end

    create_table :party_invite_requests do |t|
      t.integer :leader_id
      t.integer :target_id
      t.integer :elapsed
    end

    create_table :paths do |t|
      t.integer :character_id
      t.integer :x
      t.integer :y
      t.integer :o
      t.integer :cost
    end

    create_table :player_completed_quests do |t|
      t.integer  :character_id
      t.integer  :quest_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :completed_times
    end

    add_index(:player_completed_quests, :character_id)

    #add_index :player_completed_quests, [character_id], :name => index_player_completed_quests_on_character_id

    create_table :player_quests do |t|
      t.integer :character_id,        :default => 0, :null => false
      t.integer :quest_id,            :default => 0, :null => false
      t.integer :objective1_progress, :default => 0
      t.integer :objective2_progress, :default => 0
      t.integer :objective3_progress, :default => 0
      t.integer :objective4_progress, :default => 0
    end

    add_index(:player_quests, :character_id)

    #add_index :player_quests, [character_id], :name => index_player_quests_on_character_id

    create_table :player_scenes do |t|
      t.integer :character_id
      t.integer :scene_id
    end

    create_table :recipes do |t|
      t.integer :character_id
      t.string  :recipe
    end

    create_table :resurrects do |t|
      t.integer :character_id
      t.integer :elapses_at
    end

    create_table :scene_npcs do |t|
      t.integer :static_npc_id, :null => false
      t.integer :scene_id,      :null => false
      t.integer :x,             :null => false
      t.integer :y,             :null => false
      t.boolean :is_dead,       :null => false
      t.integer :dead_at
    end

    #add_index :scene_npcs, [scene_id], :name => index_scene_npcs_on_scene_id

    create_table :scene_object_items do |t|
      t.integer :scene_object_id, :null => false, :default => 0
      t.integer :static_item_id,  :null => false, :default => 0
      t.integer :quantity
    end

    create_table :scene_objects do |t|
      t.integer :scene_id
      t.integer :created_at
      t.integer :elapses_at
      t.integer :x,            :null => false
      t.integer :y,            :null => false
      t.integer :character_id
      t.integer :party_id
    end

    create_table :scenes do |t|
      t.integer  :zone_id,          :null => false
      t.integer  :player_number,    :null => false
      t.datetime :leave_at
      t.boolean  :in_queue
      t.integer  :difficulty_level
      t.integer  :open_at
    end

    #add_index :scenes, [zone_id], :name => index_scenes_on_zone_id

    create_table :slots do |t|
      t.integer :container_id
      t.integer :slot_index
      t.integer :item_id
    end

    create_table :spells do |t|
      t.integer :character_id
      t.integer :spell_id
      t.integer :rank
    end

    #add_index :spells, [character_id], :name => index_spells_on_character_id

    create_table :titles do |t|
      t.integer :character_id
      t.integer :title_id
    end

    create_table :trade_items do |t|
      t.integer :trade_id
      t.integer :character_id
      t.integer :trade_slot_index
      t.integer :container_id
      t.integer :slot_index
      t.integer :static_item_id
      t.integer :quantity
    end

    create_table :trades do |t|
      t.integer :state
      t.integer :character1_id
      t.integer :character1_money, :default => 0
      t.integer :character2_id
      t.integer :character2_money, :default => 0
    end


  end

  def self.down
    [:accounts, :action_bars, :albums, :auras, :battle_players, :battle_queues, :battleground_objectives, :battlegrounds, :buybacks, :characters, :containers, :cool,
:friends, :ignores, :items, :loot_rolls, :loots, :mail_attachments, :mails, :malls, :open_loots, :parties, :party_invite_requests, :paths, :player_completed_quests, :player_quests, :player_scenes, :recipes, :resurrects, :scene_npcs, :scene_object_items, :scene_objects, :scenes, :slots, :spells, :titles, :trade_items, :trades].each do |table_name|
      drop_table table_name
    end
  end
end
