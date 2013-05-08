module Vici
  module InterfaceHelper
    include Vici::ProcHelper
#
##TODO private all methods
#    # 玩家获得经验并且升级
#    def character_gain_xp_event(character, xp)
#      character.gain_xp!(xp)
#      player_xp_gain(xp, character.xp, character.account_id)
#      character_level_event(character) if character.level_up!
#    end
#
#    def character_level_event(character)
#      update_level(character.id, character.level, character.scene_id, character.id)
#      unit_level_up(character.unit_id, character.level, character.scene_id)
#    end
#
#
#
#    def player_gain_diamond_event(character, diamond)
#      character.earn_diamond!(diamond)
#      player_diamond(character.account.diamond, character.account_id)
#    end
#
#    def container_slot_changed_event(items, character)
#      changed_items = items.collect do |arr|
#        item = ContainerSlotChangedEvent::Item.new
#        item.container_index = arr[0]
#        item.slot_index      = arr[1]
#        item.item_id         = arr[2]
#        item.amount          = arr[3]
#        item
#      end
#      inventorys = items.collect {|arr|
#        next unless arr[0] == Vici::ContainerType::INVENTORY
#        inventory_slot = UpdateInventoryEvent::Inventory.new
#        inventory_slot = arr[1]
#        inventory_slot
#      }.compact
#      update_inventory(character.id, inventorys, character.scene_id, character.id) if inventorys.size > 0
#      container_slot_changed(changed_items, character.account_id)
#    end
#
#    def loot_list_event(scene_object, character)
#      items = scene_object.scene_object_items.collect do |scene_object_item|
#        item = LootListEvent::Item.new
#        item.object_item_id = scene_object_item.id
#        item.static_item_id = scene_object_item.static_item_id
#        item.quantity       = scene_object_item.quantity
#        item
#      end
#      loot_list(scene_object.id, items, character.account_id)
#    end
#
#    def execute_action_event(action_id, character)
#      use_action(character.id, action_id, character.scene_id, character.id)
#    end
#
#    # 玩家获得物品
#    def character_gets_items_event(static_item_id, amount, character)
#      changed_items = Container.give_items_to_assign_player(static_item_id, amount, character.id)
#      character_item_quest_event(static_item_id, amount, character)
#      container_slot_changed_event(changed_items, character)  
#    end
#
#
#    def take_away_stacking_items_event(character, static_item_id, quantity)
#      items = character.get_items_by_static_item_id(static_item_id)
#      amount = items.inject(0){|item| item.quantity }
#      raise "NotEnoughItemError" if quantity > amount
#      changes = items.collect do |item|
#        container = item.container
#        if quantity >= item.quantity
#          change = [container.container_type, item.slot_index, nil, 0]
#          quantity = quantity - item.quantity
#          item.destroy
#        else
#          change = [container.container_type, item.slot_index, item.static_item_id, item.quantity - quantity]
#          item.quantity -= quantity 
#          item.save!
#          quantity = 0
#        end
#        change
#        break if quantity == 0
#      end
#      container_slot_changed_event(changes, character)
#      check_item_quest_to_destroy(static_item_id, quantity, character)
#    end
#
#    def take_away_stacking_items_with_index(character, container_index, slot_index)
#      container = Container.player_container(container_index, character.id)
#      item      = container.get_item_by_slot_index(slot_index)
#      check_item_quest_to_destroy(item.static_item_id, item.quantity, character)
#      container_slot_changed_event([[container_index, slot_index, nil, 0]], character)
#      item.destroy
#    end
#
#
##-----------------------------------任务
#
#    def check_item_quest_to_destroy(item_id, stack, character = nil)
#      item = static_item(item_id)
#      player_quests = character.need_item_player_quests(item_id)
#      quest_item_destroy(player_quests, item_id, stack, character)
#    end
#
#    def quest_item_destroy(player_quests, item_id, stack, character)
#      return if character.item_count(item_id) - player_quests.inject(0){|sum, qst| qst.already_have_item_count(item_id) } >= stack.abs
#      player_quests.each do |player_quest|
#        quest = static_quest(player_quest.quest_id)
#        #count = player_quest_already_count(quest, player_quest, item_id)
#        count = player_quest.already_have_item_count(item_id)
#        if count >= stack.abs
#          player_quest.update_item_quest!(item_id, stack)
#        else
#          player_quest.update_item_quest!(item_id, -count)
#          stack = count + stack
#        end
#        quest_progress_changed_event(character, player_quest)
#      end
#    end
#
#    def character_item_quest_event(static_item_id, amount, character)
#      item = static_item(static_item_id)
#      player_quests = character.need_item_unfinish_player_quests(static_item_id)
#      quest_item(player_quests, static_item_id, amount, character)
#    end
#
#    # 任务需要物品
#    def quest_item(player_quests, item_id, stack, character)
#      player_quests.each do |player_quest|
#        next if stack <= 0
#        quest = static_quest(player_quest.quest_id)
#        #count = player_quest_need_item_count(quest, player_quest, item_id)
#        count = player_quest.need_item_count(item_id)
#        if count >= stack
#          player_quest.update_item_quest!(item_id, stack)
#        else
#          player_quest.update_item_quest!(item_id, stack-count)
#          stack = stack - count
#        end
#        quest_progress_changed_event(character, player_quest)
#      end
#    end
#
#    def quest_progress_changed_event(character, player_quest)
#      quest_progress_changed(player_quest.quest_id,player_quest.objective1_progress, player_quest.objective2_progress, player_quest.objective3_progress, player_quest.objective4_progress)
#    end
#
##---------------------party
#    def character_join_party_event(character, party)
#      party.characters.each do |member|
#        party_new_member_joined(member.id, member.name, character.account_id) if member != character
#        party_new_member_joined(character.id, character.name, member.account_id) if member != character
#      end       
#      party_joined(party.id, character.account_id)
#      party_leader_changed(party.leader_id, party.leader.name, character.account_id)
#    end
#
#    # 玩家离开组队
#    def character_leave_party_event(character, party, leader_changed = false)
#      party.characters.each do |member|
#        party_member_leaved(character.id, character.name, member.account_id)
#        party_leader_changed(party.leader_id, party.leader.name, member.account_id)  if leader_changed
#      end
#      party_leaved(party.id, character.account_id)
#    end
#
#    def party_diband_event(party)
#      party.characters.each do |member|
#        party_leaved(party.id, member.account_id)
#        party.characters.each do |character|
#          party_member_leaved(character.id, character.name, member.account_id) if member != character
#        end
#      end
#    end
#
#    def party_leader_changed_event(party)
#      party.characters.each do |character|
#        party_leader_changed(party.leader_id, party.leader.name, character.account_id)
#      end
#    end
#
#    def party_created_event(party, leader, member)
#      party_new_member_joined(leader.id, leader.name, member.account_id)
#      party_new_member_joined(member.id, member.name, leader.account_id)  
#      party.characters.each do |character|
#        party_leader_changed(leader.id, leader.name, character.account_id)
#      end
#      party_created(party.id, leader.account_id, member.account_id)
#    end
#
##----------------拾取包物品
#    def loot_item_removed_event(scene_object, item, character)
#      removed_items = []
#      removed_item = LootItemRemovedEvent::Item.new
#      removed_item.object_item_id = item.id
#      removed_items << removed_item
#      channel_id = character.party_id.nil? ? 4 : 7
#      loot_item_removed(scene_object.id, removed_items, character.party_id, channel_id)
#      item.destroy  
#      scene_object.reload  
#      if scene_object.scene_object_items.count == 0
#        npc_corpse_remove(character.scene_id, scene_object.unit_id, character.scene_id, character.id)
#      end
#    end
#
##----------------技能
#    def spell_book_event(character_spells, character)
#      spells = character_spells.collect do |spell|
#        spell_item = SpellBookEvent::Spell.new
#        spell_item.spell_id = spell.spell_id
#        spell_item.rank     = spell.rank
#        spell_item
#      end
#      spell_book(spells, character.account_id)
#    end
##----------------对话
#    def gossip_event(npc_id, content, gossip_options, character)
#      options = gossip_options.collect do |gossip_option|
#        option = GossipContentEvent::Option.new
#        option.gossip_id = gossip_option[0]
#        option.content   = gossip_option[1]
#        option.type      = gossip_option[2]
#        option.quest_id  = gossip_option[3]
#        option
#      end        
#
#      gossip_content(npc_id, content, options, character.account_id)
#    end
##---------------任务
#    def character_doing_quests_event(player_quests, character)
#      doing_quests = player_quests.collect do |player_quest|
#        quest = QuestsEvent::Quest.new
#        quest.quest_id = player_quest.quest_id
#        quest.objective1 = player_quest.objective1_progress 
#        quest.objective2 = player_quest.objective2_progress
#        quest.objective3 = player_quest.objective3_progress
#        quest.objective4 = player_quest.objective4_progress
#        quest
#      end
#      quests(doing_quests, character.account_id)
#    end
#
#    def character_available_quests_event(quests, character)
#      character_available_quests = quests.collect do |quest_id, c|
#        quest = AvailableQuestsEvent::Quest.new
#        quest.quest_id = quest_id
#        quest
#      end
#      available_quests(character_available_quests, character.account_id)
#    end
#
##------------------------------邮件
#    def mail_list_event(character, mails, page, pages)
#      mail_items = mails.collect do |mail|
#        mail_item = MailListEvent::Mail.new
#        mail_item.mail_id = mail.id
#        mail_item.time = mail.created_at.strftime("%Y-%d-%m %H-%M-%S")
#        mail_item.sender = mail.sender.name
#        mail_item.subject = mail.subject
#        mail_item.has_money = mail.money.to_i > 0
#        mail_item.has_attachments = mail.mail_attachments.size > 0 
#        mail_item.has_read = mail.unread
#        mail_item
#      end
#      mail_list(page, pages, mail_items, character.account_id)
#    end
#
#    def mail_event(character, mail)
#      attachments = mail.mail_attachments.collect do |attachment|
#         attachment_item = MailEvent::Attachment.new
#         attachment_item.mail_attachment_id = attachment.id
#         attachment_item.item_id = attachment.item_id
#         attachment_item.quantity = attachment.quantity
#         attachment_item
#      end
#      mail(mail.id, mail.created_at.strftime("%Y-%d-%m %H-%M-%S"), mail.sender.name, mail.subject, mail.content, mail.money, attachments, mail.unread, character.account_id)
#    end
#
##------------------------------------商城
#    def mall_list_event(character, mall_items, tab, page, total_pages)
#      items = mall_items.collect do |mall_item|
#        item = MallListEvent::Item.new
#        item.mall_item_id = mall_item.id
#        item.static_item_id = mall_item.static_item_id
#        item.stack = mall_item.stack
#        item.diamond_price = mall_item.diamond_price
#        item.voucher_price = mall_item.voucher_price
#        item
#      end
#      mall_list(tab, page, total_pages, items, character.account_id)
#    end
#
##------------------------------------维修
#    def durability_changed_event(character, item)
#      container = item.container  
#      durability_changed(container.container_type, item.slot_index, item.static_item_id, item.durability, item.max_durability, character.account_id)
#    end
#
##------------------------------------npc买卖列表
#    def sell_list_event(character, items, npc_id)
#      merchant_items = items.collect do |item|
#        merchant_item = SellListEvent::Item.new
#        merchant_item.merchant_item_id = item[0]
#        merchant_item.static_item_id   = item[1]
#        merchant_item.stack            = item[2]
#        merchant_item.price            = item[3]
#        merchant_item.honor_price      = item[5]
#        merchant_item
#      end
#      sell_list(npc_id, merchant_items, character.account_id)
#    end
#
#    def buyback_list_event(character, items)
#      buyback_items = items.collect do |item|
#        buyback_item = BuybackListEvent::Item.new
#        buyback_item.buyback_item_id = item.id
#        buyback_item.static_item_id  = item.static_item_id
#        buyback_item.quantity        = item.quantity
#        buyback_item.price           = item.buyback_price
#        buyback_item
#      end
#      buyback_list(buyback_items, character.account_id)
#    end
#
##----------------------------------------称号
#    def title_list_event(character, titles)
#      event_titles = titles.collect do |title|
#        event_title = TitleListEvent::Title.new
#        event_title.title_id = title.title_id
#        event_title
#      end
#
#      title_list(titles, character.account_id)
#    end
#
    private
      def connection_manager
        ConnectionManager.instance
      end
  end
end  

