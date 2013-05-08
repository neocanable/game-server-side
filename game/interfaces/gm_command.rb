module Vici
  class GmCommandInterface < Interface
    class << self
  
      GM_COMMANDS = {
        :add          => {:method => :add,          :message => "add <item_id> <amount=1> <player_name=self_name>"},
        :learn        => {:method => :learn,        :message => "learn <spell_id>"},
        :setlevel     => {:method => :setlevel,     :message => "setlevel <level=1> <player_name=self_name>" },
        :kill         => {:method => :kill_target,  :message => "kill 杀死选中目标，没选就自己挂"},
        :goto         => {:method => :goto_location,:message => "goto <location_id>"},
        :gotozone     => {:method => :gotomap,      :message => "gotomap <zone_id>"},
        :setxp        => {:method => :setxp,        :message => "setxp <xp> <player_name=self_name>"},
        :setdiamond  => {:method => :set_diamond,  :message => "setdiamond <amount> <player_name=self_name>"},
        :setmoney    => {:method => :set_money,    :message => "setmoney <amount> <player_name=self_name>"},
        :sethp       => {:method => :set_player_hp,:message => "sethp <hp=1000>"},
        :accept_quest => {:method => :accept_quest, :message => "acceptquest <quest_id>"},
        :finish_quest => {:method => :finish_quest, :message  => "finishquest <quest_id>"},
        :clear_quest  => {:method => :clear_quest,  :message => "clearquest"},
        :flash        => {:method => :flashto,      :message => "flash <x> <y>"},
        :talk         => {:method => :talk,         :message => "talk <npc_id>"},
        :profession   => {:method => :change_profession, :message => "profession <profession_id>"},
        :learncraft  => {:method => :learn_craft,  :message => "learncraft <branch_id>"},
        :dropcraft   => {:method => :abandon_craft,:message => "dropcraft <branch_id>"},
        :useaction   => {:method => :gm_use_action,:message => "useaction <action_id>"},
        :learnrecipe => {:method => :learn_recipe, :message => "learnrecipe <recipe_id>"},
        :unlockbank  => {:method => :open_bank,    :message => "unlockbank <size>"},
        :help         => {:method => :help,         :message => "help <command_name=null> 如果不指定command_name,那么显示所有"},
        :l           => {:alias => :setlevel},
        :m           => {:alias => :setmoney},
        :z           => {:alias => :gotozone}
      }
    
    
      def gm_command(character, command)
        params = command.split(/\s\s*/)
        command_name = params.first.to_sym
        return unless command_tip = GM_COMMANDS[command_name]

        method = get_method_name(command_tip)
        args = params[1..-1].size > 0 ? params[1..-1].join("','") : ""
        p "self.send(:#{method},character,'#{args}')"
        instance_eval <<-EOS
          self.send(:#{method},character,'#{args}')
        EOS
      end

      def open_bank(character, size)
        #Container.unlock_bank(character, 1)
        container = Container.player_container(Vici::ContainerType::BANK, character.id)
        container.change_max_slot(size.to_i)
        container_max_slot_changed_event(character, container) 
      end

      def change_profession(character, profession_id)
        character.change_profession!(profession_id.to_i)
        unit_profession_chanaged(character.unit_id, character.profession, character.scene_id)
        update_profession(character.id, character.profession, character.scene_id, character.id)
      end

      def set_player_hp(character, hp = 1000)
        character.health = hp
        character.save!
      end

      def gm_use_action(character, action_id)
        use_action(character.id, action_id.to_i, character.scene_id, character.id)
      end

      def learn_craft(character, branch_id)
        CraftInterface.learn_craft_branch(character, branch_id.to_i)
      end

      def abandon_craft(character, branch_id)
        CraftInterface.abandon_craft_branch(character, branch_id.to_i)
      end

      def learn_recipe(character, recipe_id)
        CraftInterface.learn_craft_recipe(character, recipe_id.to_i)
      end
      
      def goto_location(character, location_id)
        SceneInterface.goto_portal(character, location_id.to_i)
      end

      def clear_quest(character, params = nil)
        PlayerCompletedQuest.delete_all(:character_id => character.id)
        PlayerQuest.delete_all(:character_id => character.id)
        character_available_quests_event(character)
      end

      def gotomap(character, zone_id)
        location = Vici::Code.first(:LOCATION, 'zone', zone_id.to_i)
        unless Zone.is_public_zone?(zone_id.to_i)
          puts "不能gotozone 到副本"
          return
        end
        scene_enter(character.id, location["zone"].to_i, location["x"].to_i, location["y"].to_i)
      end
        
#        MESSAGES.each do |exp|
#          if exp =~ message
#            arr = message.gsub(/^\//,"").split(".")
#            #p arr[1..-1]
#            #p "(#{arr.first}, #{arr[1..-1].join(",")})"
#            args = arr[1..-1].size > 0 ? ",'#{arr[1..-1].join("','")}'" : ""
#            #if arr.size > 1
#            #  self.send(:#{arr.first}, '#{arr[1..-1].join("','")}') 
#            #else
#            #  self.send(:#{arr.first}) 
#            #end
#            p "(#{arr.first}#{args})"
#            instance_eval <<-EOS
#              self.send(:#{arr.first}#{args})
#            EOS
#            return true
#          end
#        end
      
      def add(character, item_id, amount = 1, player_name = nil)
        player = Character.find_by_name(player_name)
        character = player if player
        character_gets_items_event(item_id.to_i, amount.to_i, character)
      end

      def learn(character, spell_id)
        SpellInterface.learn(spell_id, character.id)
      end

      def setlevel(character, level, player_name = nil)
        player = Character.find_by_name(player_name)
        character = player if player
        static_profession = static_profession(character.profession)
        old_level = character.level
        #level = level.to_i > static_profession["max_level"].to_i ? static_profession["max_level"] : level

        retuen if level.to_i == 0
        character.level = level.to_i
        character.save!
        #
        #if character.level > old_level
        #  unlock_times = character.level % 10 == 0 ? 1 : 0
        #  ((character.level - old_level - 1)/10 + unlock_times).times do |i|
        #    Container.unlock_bank(character, 1) 
        #  end
        #else
        #  unlock_times = character.level % -10 == 0 ? 1 : 0
        #  ((character.level - old_level + 1)/-10 + unlock_times).times do |i|
        #    Container.unlock_bank(character, -1)
        #  end
        #end
        unlock_bank(character, old_level) if character.level <= 50
        
        character_level_event(character)
      end

      

      def kill_target(character, *args)
        # TODO 杀死人的action是30900 -_-!!!
        use_action_event(character, 30900)
      end

      def goto(character, location_id)

      end

      def setxp(character, xp, player_name = nil)
        player = Character.find_by_name(player_name)
        character = player if player
        character_gain_xp_event(character, xp.to_i)
      end

      def set_diamond(character, diamond, player_name = nil)
        player = Character.find_by_name(player_name)
        character = player if player
        player_gain_diamond_event(character, diamond.to_i)       
      end

      def set_money(character, money, player_name = nil)
        player = Character.find_by_name(player_name)
        character = player if player   
        character_gain_money_event(character, money.to_i)
      end

      def flashto(character, x, y)
        flash(character.id, x.to_i, y.to_i, character.scene_id, character.id)
      end

      def talk(character, npc_id)
        GossipInterface.talk(character.id, npc_id.to_i)
      end

      def accept_quest(character, quest_id)
        PlayerCompletedQuest.delete_all(:character_id => character.id, :quest_id => quest_id)
        PlayerQuest.delete_all(:character_id => character.id, :quest_id => quest_id)
        PlayerQuest.create :quest_id => quest_id, :character_id => character.id
        character_doing_quests_event(character.player_quests, character)
        character_available_quests_event(character)
      end

      def help(character, command_name = nil)
        
      end

      private

        def unlock_bank(character, old_level)
          if character.level > old_level
            unlock_times = character.level % 10 == 0 ? 1 : 0
            ((character.level - old_level - 1)/10 + unlock_times).times do |i|
              Container.unlock_bank(character, 1) 
            end
          else
            #TODO
          end
          container = Container.player_container(Vici::ContainerType::BANK, character.id)
          container_max_slot_changed_event(character, container) 
        end

        def get_method_name(command_tip)
          return command_tip[:method] if command_tip[:method] 
          if alias_name = command_tip[:alias]
            return GM_COMMANDS[alias_name][:method] 
          end
          raise "擦,输入错误"
        end

    end
  end
end  

