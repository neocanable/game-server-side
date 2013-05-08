=begin
  error(error_code, _account_id = nil, _channel_id = 5)
  scene_enter(character_id, zone_id, x, y)
  character_list(characters, last_online_character_id, _account_id = nil, _channel_id = 5)
  character_created(character_id, _account_id = nil, _channel_id = 5)
  character_destroyed(_account_id = nil, _channel_id = 5)
  game_options(show_newbie_tips, block_trades, block_party_invites, mute, music_volume, sound_volume, field_of_vision, _account_id = nil, _channel_id = 5)
  game_options_saved(_account_id = nil, _channel_id = 5)
  announce(message)
  system_message(message, account_id)
  spell_book(spells, _account_id = nil, _channel_id = 5)
  unspent_spell_point_changed(unspent_points, _account_id = nil, _channel_id = 5)
  spell_changed(spell_id, rank, _account_id = nil, _channel_id = 5)
  update_spell(character_id, _scene_id = nil, _character_id = nil)
  action_bar(action_bars, _account_id = nil, _channel_id = 5)
  action_bar_slot_changed(slot_index, action_type, action_id, _account_id = nil, _channel_id = 5)
  container(container_index, max_slots, items, _account_id = nil, _channel_id = 5)
  container_slot_changed(items, _account_id = nil, _channel_id = 5)
  update_inventory(character_id, inventorys, _scene_id = nil, _character_id = nil)
  container_expired_items(items, _account_id = nil, _channel_id = 5)
  container_max_slots_changed(container_index, max_slots, _account_id = nil, _channel_id = 5)
  container_slot_locked(container_index, slot_index, _account_id = nil, _channel_id = 5)
  container_slot_unlocked(container_index, slot_index, _account_id = nil, _channel_id = 5)
  use_action(character_id, action_id, _scene_id = nil, _character_id = nil)
  use_consumable(character_id, static_item_id, container_index, slot_index, _scene_id = nil, _character_id = nil)
  flash(character_id, dest_x, dest_y, _scene_id = nil, _character_id = nil)
  cancel_aura(aura_id, _scene_id = nil, _character_id = nil)
  player_money(money, _account_id = nil, _channel_id = 5)
  player_money_gain(money_gained, money, _account_id = nil, _channel_id = 5)
  player_diamond(diamond, _account_id = nil, _channel_id = 5)
  player_diamond_gain(diamond_gained, diamond, _account_id = nil, _channel_id = 5)
  player_voucher(voucher, _account_id = nil, _channel_id = 5)
  player_voucher_gain(voucher_gained, voucher, _account_id = nil, _channel_id = 5)
  player_honor(honor, _account_id = nil, _channel_id = 5)
  player_honor_gain(honor_gained, honor, _account_id = nil, _channel_id = 5)
  npc_corpse_info(object_id, unit_id, static_npc_id, x, y, owner_character_id, owner_party_id, _scene_id = nil, _channel_id = 4)
  npc_corpse_remove(scene_id, object_id, _scene_id = nil, _character_id = nil)
  player_xp(xp, _account_id = nil, _channel_id = 5)
  player_xp_gain(xp_gained, xp, _account_id = nil, _channel_id = 5)
  update_level(character_id, new_level, _scene_id = nil, _character_id = nil)
  unit_level_up(unit_id, level, _scene_id = nil, _channel_id = 4)
  gossip_content(npc_id, content, options, _account_id = nil, _channel_id = 5)
  quests(quests, _account_id = nil, _channel_id = 5)
  available_quests(quests, _account_id = nil, _channel_id = 5)
  quest_text_description(quest_id, _account_id = nil, _channel_id = 5)
  quest_text_progress(quest_id, _account_id = nil, _channel_id = 5)
  quest_text_complete(quest_id, _account_id = nil, _channel_id = 5)
  quest_progress_changed(quest_id, objective1, objective2, objective3, objective4, _account_id = nil, _channel_id = 5)
  quest_accepted(quest_id, _account_id = nil, _channel_id = 5)
  quest_abandoned(quest_id, _account_id = nil, _channel_id = 5)
  quest_completed(quest_id, next_quest_id, _account_id = nil, _channel_id = 5)
  update_profession(character_id, new_profession_id, _scene_id = nil, _character_id = nil)
  unit_profession_chanaged(unit_id, new_profession_id, _scene_id = nil, _channel_id = 4)
  party_invite_request(request_id, leader_character_id, leader_name, _account_id = nil, _channel_id = 5)
  party_invite_declined(character_id, character_name, _account_id = nil, _channel_id = 5)
  party_new_member_joined(character_id, character_name, _account_id = nil, _channel_id = 5)
  party_member_leaved(character_id, character_name, _account_id = nil, _channel_id = 5)
  party_update_leader(party_id, leader_character_id, leader_name)
  party_created(party_id, account1_id, account2_id)
  party_joined(party_id, account_id)
  party_leaved(party_id, account_id)
  party_disbanded(party_id)
  loot_list(scene_object_id, items, _account_id = nil, _channel_id = 5)
  loot_item_removed(scene_object_id, items, _account_id = nil, _channel_id = 5)
  loot_roll(loot_id, static_item_id, quantity, _account_id = nil, _channel_id = 5)
  loot_pass(loot_id, party_member_id, _account_id = nil, _channel_id = 5)
  loot_need_roll(loot_id, party_member_id, number, _account_id = nil, _channel_id = 5)
  loot_greed_roll(loot_id, party_member_id, number, _account_id = nil, _channel_id = 5)
  player_get_item(item_id, quantity, _account_id = nil, _channel_id = 5)
  durability_changed(container_type, slot_index, item_id, durability, max_durability, _account_id = nil, _channel_id = 5)
  sell_list(npc_id, items, _account_id = nil, _channel_id = 5)
  buyback_list(items, _account_id = nil, _channel_id = 5)
  title_list(titles, selected_title_id, _account_id = nil, _channel_id = 5)
  update_title(character_id, title_id, _scene_id = nil, _character_id = nil)
  unit_title_changed(unit_id, new_title_id, _scene_id = nil, _channel_id = 4)
  trade_money_changed(character_id, money, _account_id = nil, _channel_id = 5)
  trade_item_changed(character_id, trade_slot_index, static_item_id, quantity, _account_id = nil, _channel_id = 5)
  trade_status_initiate(target_character_id, _account_id = nil, _channel_id = 5)
  trade_status_cancel(_account_id = nil, _channel_id = 5)
  trade_status_accept(character_id, _account_id = nil, _channel_id = 5)
  trade_status_unaccept(character_id, _account_id = nil, _channel_id = 5)
  trade_status_failed(_account_id = nil, _channel_id = 5)
  trade_status_complete(_account_id = nil, _channel_id = 5)
  mail_send_success(_account_id = nil, _channel_id = 5)
  update_pending_mail(_account_id = nil, _channel_id = 5)
  mail_list(page, total_pages, mails, _account_id = nil, _channel_id = 5)
  mail(mail_id, time, sender_name, subject, body, money, attachments, has_read, _account_id = nil, _channel_id = 5)
  mail_deleted(mail_id, _account_id = nil, _channel_id = 5)
  album(page, cards, _account_id = nil, _channel_id = 5)
  mall_list(tab, page, total_pages, items, _account_id = nil, _channel_id = 5)
  craft_branch_list(branch_lists, _account_id = nil, _channel_id = 5)
  craft_recipe_list(branch_id, recipes, _account_id = nil, _channel_id = 5)
  craft_info(branch_id, rank, points, _account_id = nil, _channel_id = 5)
  craft_create_completed(_account_id = nil, _channel_id = 5)
=end
module Vici
  module ProcHelper
    def error(error_code, _account_id = nil, _channel_id = 5)
      event = ErrorEvent.instance
      event.error_code = error_code
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ErrorProc.instance.remote_call(connection, event)
    end
    def scene_enter(character_id, zone_id, x, y)
      event = SceneEnterEvent.instance
      event.character_id = character_id
      event.zone_id = zone_id
      event.x = x
      event.y = y
      connection = connection_manager.game_center
      SceneEnterProc.instance.remote_call(connection, event)
    end
    def character_list(characters, last_online_character_id, _account_id = nil, _channel_id = 5)
      event = CharacterListEvent.instance
      event.characters = characters
      event.last_online_character_id = last_online_character_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CharacterListProc.instance.remote_call(connection, event)
    end
    def character_created(character_id, _account_id = nil, _channel_id = 5)
      event = CharacterCreatedEvent.instance
      event.character_id = character_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CharacterCreatedProc.instance.remote_call(connection, event)
    end
    def character_destroyed(_account_id = nil, _channel_id = 5)
      event = CharacterDestroyedEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CharacterDestroyedProc.instance.remote_call(connection, event)
    end
    def game_options(show_newbie_tips, block_trades, block_party_invites, mute, music_volume, sound_volume, field_of_vision, _account_id = nil, _channel_id = 5)
      event = GameOptionsEvent.instance
      event.show_newbie_tips = show_newbie_tips
      event.block_trades = block_trades
      event.block_party_invites = block_party_invites
      event.mute = mute
      event.music_volume = music_volume
      event.sound_volume = sound_volume
      event.field_of_vision = field_of_vision
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      GameOptionsProc.instance.remote_call(connection, event)
    end
    def game_options_saved(_account_id = nil, _channel_id = 5)
      event = GameOptionsSavedEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      GameOptionsSavedProc.instance.remote_call(connection, event)
    end
    def announce(message)
      event = AnnounceEvent.instance
      event.message = message
      connection = connection_manager.game_center
      AnnounceProc.instance.remote_call(connection, event)
    end
    def system_message(message, account_id)
      event = SystemMessageEvent.instance
      event.message = message
      event.account_id = account_id
      connection = connection_manager.game_center
      SystemMessageProc.instance.remote_call(connection, event)
    end
    def spell_book(spells, _account_id = nil, _channel_id = 5)
      event = SpellBookEvent.instance
      event.spells = spells
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      SpellBookProc.instance.remote_call(connection, event)
    end
    def unspent_spell_point_changed(unspent_points, _account_id = nil, _channel_id = 5)
      event = UnspentSpellPointChangedEvent.instance
      event.unspent_points = unspent_points
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      UnspentSpellPointChangedProc.instance.remote_call(connection, event)
    end
    def spell_changed(spell_id, rank, _account_id = nil, _channel_id = 5)
      event = SpellChangedEvent.instance
      event.spell_id = spell_id
      event.rank = rank
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      SpellChangedProc.instance.remote_call(connection, event)
    end
    def update_spell(character_id, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UpdateSpellEvent.instance
      event.character_id = character_id
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UpdateSpellProc.instance.remote_call(connection, event)
    end
    def action_bar(action_bars, _account_id = nil, _channel_id = 5)
      event = ActionBarEvent.instance
      event.action_bars = action_bars
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ActionBarProc.instance.remote_call(connection, event)
    end
    def action_bar_slot_changed(slot_index, action_type, action_id, _account_id = nil, _channel_id = 5)
      event = ActionBarSlotChangedEvent.instance
      event.slot_index = slot_index
      event.action_type = action_type
      event.action_id = action_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ActionBarSlotChangedProc.instance.remote_call(connection, event)
    end
    def container(container_index, max_slots, items, _account_id = nil, _channel_id = 5)
      event = ContainerEvent.instance
      event.container_index = container_index
      event.max_slots = max_slots
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ContainerProc.instance.remote_call(connection, event)
    end
    def container_slot_changed(items, _account_id = nil, _channel_id = 5)
      event = ContainerSlotChangedEvent.instance
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ContainerSlotChangedProc.instance.remote_call(connection, event)
    end
    def update_inventory(character_id, inventorys, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UpdateInventoryEvent.instance
      event.character_id = character_id
      event.inventorys = inventorys
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UpdateInventoryProc.instance.remote_call(connection, event)
    end
    def container_expired_items(items, _account_id = nil, _channel_id = 5)
      event = ContainerExpiredItemsEvent.instance
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ContainerExpiredItemsProc.instance.remote_call(connection, event)
    end
    def container_max_slots_changed(container_index, max_slots, _account_id = nil, _channel_id = 5)
      event = ContainerMaxSlotsChangedEvent.instance
      event.container_index = container_index
      event.max_slots = max_slots
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ContainerMaxSlotsChangedProc.instance.remote_call(connection, event)
    end
    def container_slot_locked(container_index, slot_index, _account_id = nil, _channel_id = 5)
      event = ContainerSlotLockedEvent.instance
      event.container_index = container_index
      event.slot_index = slot_index
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ContainerSlotLockedProc.instance.remote_call(connection, event)
    end
    def container_slot_unlocked(container_index, slot_index, _account_id = nil, _channel_id = 5)
      event = ContainerSlotUnlockedEvent.instance
      event.container_index = container_index
      event.slot_index = slot_index
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      ContainerSlotUnlockedProc.instance.remote_call(connection, event)
    end
    def use_action(character_id, action_id, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UseActionEvent.instance
      event.character_id = character_id
      event.action_id = action_id
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UseActionProc.instance.remote_call(connection, event)
    end
    def use_consumable(character_id, static_item_id, container_index, slot_index, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UseConsumableEvent.instance
      event.character_id = character_id
      event.static_item_id = static_item_id
      event.container_index = container_index
      event.slot_index = slot_index
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UseConsumableProc.instance.remote_call(connection, event)
    end
    def flash(character_id, dest_x, dest_y, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = FlashEvent.instance
      event.character_id = character_id
      event.dest_x = dest_x
      event.dest_y = dest_y
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      FlashProc.instance.remote_call(connection, event)
    end
    def cancel_aura(aura_id, _scene_id = nil, _character_id = nil)
      event = CancelAuraEvent.instance
      event.aura_id = aura_id
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      CancelAuraProc.instance.remote_call(connection, event)
    end
    def player_money(money, _account_id = nil, _channel_id = 5)
      event = PlayerMoneyEvent.instance
      event.money = money
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerMoneyProc.instance.remote_call(connection, event)
    end
    def player_money_gain(money_gained, money, _account_id = nil, _channel_id = 5)
      event = PlayerMoneyGainEvent.instance
      event.money_gained = money_gained
      event.money = money
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerMoneyGainProc.instance.remote_call(connection, event)
    end
    def player_diamond(diamond, _account_id = nil, _channel_id = 5)
      event = PlayerDiamondEvent.instance
      event.diamond = diamond
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerDiamondProc.instance.remote_call(connection, event)
    end
    def player_diamond_gain(diamond_gained, diamond, _account_id = nil, _channel_id = 5)
      event = PlayerDiamondGainEvent.instance
      event.diamond_gained = diamond_gained
      event.diamond = diamond
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerDiamondGainProc.instance.remote_call(connection, event)
    end
    def player_voucher(voucher, _account_id = nil, _channel_id = 5)
      event = PlayerVoucherEvent.instance
      event.voucher = voucher
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerVoucherProc.instance.remote_call(connection, event)
    end
    def player_voucher_gain(voucher_gained, voucher, _account_id = nil, _channel_id = 5)
      event = PlayerVoucherGainEvent.instance
      event.voucher_gained = voucher_gained
      event.voucher = voucher
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerVoucherGainProc.instance.remote_call(connection, event)
    end
    def player_honor(honor, _account_id = nil, _channel_id = 5)
      event = PlayerHonorEvent.instance
      event.honor = honor
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerHonorProc.instance.remote_call(connection, event)
    end
    def player_honor_gain(honor_gained, honor, _account_id = nil, _channel_id = 5)
      event = PlayerHonorGainEvent.instance
      event.honor_gained = honor_gained
      event.honor = honor
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerHonorGainProc.instance.remote_call(connection, event)
    end
    def npc_corpse_info(object_id, unit_id, static_npc_id, x, y, owner_character_id, owner_party_id, _scene_id = nil, _channel_id = 4)
      event = NpcCorpseInfoEvent.instance
      event.object_id = object_id
      event.unit_id = unit_id
      event.static_npc_id = static_npc_id
      event.x = x
      event.y = y
      event.owner_character_id = owner_character_id
      event.owner_party_id = owner_party_id
      event._channel_id = _channel_id
      event._scene_id = _scene_id
      connection = connection_manager.game_center
      NpcCorpseInfoProc.instance.remote_call(connection, event)
    end
    def npc_corpse_remove(scene_id, object_id, _scene_id = nil, _character_id = nil)
      _scene_id ||= scene_id
      event = NpcCorpseRemoveEvent.instance
      event.scene_id = scene_id
      event.object_id = object_id
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      NpcCorpseRemoveProc.instance.remote_call(connection, event)
    end
    def player_xp(xp, _account_id = nil, _channel_id = 5)
      event = PlayerXpEvent.instance
      event.xp = xp
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerXpProc.instance.remote_call(connection, event)
    end
    def player_xp_gain(xp_gained, xp, _account_id = nil, _channel_id = 5)
      event = PlayerXpGainEvent.instance
      event.xp_gained = xp_gained
      event.xp = xp
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerXpGainProc.instance.remote_call(connection, event)
    end
    def update_level(character_id, new_level, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UpdateLevelEvent.instance
      event.character_id = character_id
      event.new_level = new_level
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UpdateLevelProc.instance.remote_call(connection, event)
    end
    def unit_level_up(unit_id, level, _scene_id = nil, _channel_id = 4)
      event = UnitLevelUpEvent.instance
      event.unit_id = unit_id
      event.level = level
      event._channel_id = _channel_id
      event._scene_id = _scene_id
      connection = connection_manager.game_center
      UnitLevelUpProc.instance.remote_call(connection, event)
    end
    def gossip_content(npc_id, content, options, _account_id = nil, _channel_id = 5)
      event = GossipContentEvent.instance
      event.npc_id = npc_id
      event.content = content
      event.options = options
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      GossipContentProc.instance.remote_call(connection, event)
    end
    def quests(quests, _account_id = nil, _channel_id = 5)
      event = QuestsEvent.instance
      event.quests = quests
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestsProc.instance.remote_call(connection, event)
    end
    def available_quests(quests, _account_id = nil, _channel_id = 5)
      event = AvailableQuestsEvent.instance
      event.quests = quests
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      AvailableQuestsProc.instance.remote_call(connection, event)
    end
    def quest_text_description(quest_id, _account_id = nil, _channel_id = 5)
      event = QuestTextDescriptionEvent.instance
      event.quest_id = quest_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestTextDescriptionProc.instance.remote_call(connection, event)
    end
    def quest_text_progress(quest_id, _account_id = nil, _channel_id = 5)
      event = QuestTextProgressEvent.instance
      event.quest_id = quest_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestTextProgressProc.instance.remote_call(connection, event)
    end
    def quest_text_complete(quest_id, _account_id = nil, _channel_id = 5)
      event = QuestTextCompleteEvent.instance
      event.quest_id = quest_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestTextCompleteProc.instance.remote_call(connection, event)
    end
    def quest_progress_changed(quest_id, objective1, objective2, objective3, objective4, _account_id = nil, _channel_id = 5)
      event = QuestProgressChangedEvent.instance
      event.quest_id = quest_id
      event.objective1 = objective1
      event.objective2 = objective2
      event.objective3 = objective3
      event.objective4 = objective4
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestProgressChangedProc.instance.remote_call(connection, event)
    end
    def quest_accepted(quest_id, _account_id = nil, _channel_id = 5)
      event = QuestAcceptedEvent.instance
      event.quest_id = quest_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestAcceptedProc.instance.remote_call(connection, event)
    end
    def quest_abandoned(quest_id, _account_id = nil, _channel_id = 5)
      event = QuestAbandonedEvent.instance
      event.quest_id = quest_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestAbandonedProc.instance.remote_call(connection, event)
    end
    def quest_completed(quest_id, next_quest_id, _account_id = nil, _channel_id = 5)
      event = QuestCompletedEvent.instance
      event.quest_id = quest_id
      event.next_quest_id = next_quest_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      QuestCompletedProc.instance.remote_call(connection, event)
    end
    def update_profession(character_id, new_profession_id, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UpdateProfessionEvent.instance
      event.character_id = character_id
      event.new_profession_id = new_profession_id
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UpdateProfessionProc.instance.remote_call(connection, event)
    end
    def unit_profession_chanaged(unit_id, new_profession_id, _scene_id = nil, _channel_id = 4)
      event = UnitProfessionChanagedEvent.instance
      event.unit_id = unit_id
      event.new_profession_id = new_profession_id
      event._channel_id = _channel_id
      event._scene_id = _scene_id
      connection = connection_manager.game_center
      UnitProfessionChanagedProc.instance.remote_call(connection, event)
    end
    def party_invite_request(request_id, leader_character_id, leader_name, _account_id = nil, _channel_id = 5)
      event = PartyInviteRequestEvent.instance
      event.request_id = request_id
      event.leader_character_id = leader_character_id
      event.leader_name = leader_name
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PartyInviteRequestProc.instance.remote_call(connection, event)
    end
    def party_invite_declined(character_id, character_name, _account_id = nil, _channel_id = 5)
      event = PartyInviteDeclinedEvent.instance
      event.character_id = character_id
      event.character_name = character_name
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PartyInviteDeclinedProc.instance.remote_call(connection, event)
    end
    def party_new_member_joined(character_id, character_name, _account_id = nil, _channel_id = 5)
      event = PartyNewMemberJoinedEvent.instance
      event.character_id = character_id
      event.character_name = character_name
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PartyNewMemberJoinedProc.instance.remote_call(connection, event)
    end
    def party_member_leaved(character_id, character_name, _account_id = nil, _channel_id = 5)
      event = PartyMemberLeavedEvent.instance
      event.character_id = character_id
      event.character_name = character_name
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PartyMemberLeavedProc.instance.remote_call(connection, event)
    end
    def party_update_leader(party_id, leader_character_id, leader_name)
      event = PartyUpdateLeaderEvent.instance
      event.party_id = party_id
      event.leader_character_id = leader_character_id
      event.leader_name = leader_name
      connection = connection_manager.game_center
      PartyUpdateLeaderProc.instance.remote_call(connection, event)
    end
    def party_created(party_id, account1_id, account2_id)
      event = PartyCreatedEvent.instance
      event.party_id = party_id
      event.account1_id = account1_id
      event.account2_id = account2_id
      connection = connection_manager.game_center
      PartyCreatedProc.instance.remote_call(connection, event)
    end
    def party_joined(party_id, account_id)
      event = PartyJoinedEvent.instance
      event.party_id = party_id
      event.account_id = account_id
      connection = connection_manager.game_center
      PartyJoinedProc.instance.remote_call(connection, event)
    end
    def party_leaved(party_id, account_id)
      event = PartyLeavedEvent.instance
      event.party_id = party_id
      event.account_id = account_id
      connection = connection_manager.game_center
      PartyLeavedProc.instance.remote_call(connection, event)
    end
    def party_disbanded(party_id)
      event = PartyDisbandedEvent.instance
      event.party_id = party_id
      connection = connection_manager.game_center
      PartyDisbandedProc.instance.remote_call(connection, event)
    end
    def loot_list(scene_object_id, items, _account_id = nil, _channel_id = 5)
      event = LootListEvent.instance
      event.scene_object_id = scene_object_id
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      LootListProc.instance.remote_call(connection, event)
    end
    def loot_item_removed(scene_object_id, items, _account_id = nil, _channel_id = 5)
      event = LootItemRemovedEvent.instance
      event.scene_object_id = scene_object_id
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      LootItemRemovedProc.instance.remote_call(connection, event)
    end
    def loot_roll(loot_id, static_item_id, quantity, _account_id = nil, _channel_id = 5)
      event = LootRollEvent.instance
      event.loot_id = loot_id
      event.static_item_id = static_item_id
      event.quantity = quantity
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      LootRollProc.instance.remote_call(connection, event)
    end
    def loot_pass(loot_id, party_member_id, _account_id = nil, _channel_id = 5)
      event = LootPassEvent.instance
      event.loot_id = loot_id
      event.party_member_id = party_member_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      LootPassProc.instance.remote_call(connection, event)
    end
    def loot_need_roll(loot_id, party_member_id, number, _account_id = nil, _channel_id = 5)
      event = LootNeedRollEvent.instance
      event.loot_id = loot_id
      event.party_member_id = party_member_id
      event.number = number
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      LootNeedRollProc.instance.remote_call(connection, event)
    end
    def loot_greed_roll(loot_id, party_member_id, number, _account_id = nil, _channel_id = 5)
      event = LootGreedRollEvent.instance
      event.loot_id = loot_id
      event.party_member_id = party_member_id
      event.number = number
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      LootGreedRollProc.instance.remote_call(connection, event)
    end
    def player_get_item(item_id, quantity, _account_id = nil, _channel_id = 5)
      event = PlayerGetItemEvent.instance
      event.item_id = item_id
      event.quantity = quantity
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      PlayerGetItemProc.instance.remote_call(connection, event)
    end
    def durability_changed(container_type, slot_index, item_id, durability, max_durability, _account_id = nil, _channel_id = 5)
      event = DurabilityChangedEvent.instance
      event.container_type = container_type
      event.slot_index = slot_index
      event.item_id = item_id
      event.durability = durability
      event.max_durability = max_durability
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      DurabilityChangedProc.instance.remote_call(connection, event)
    end
    def sell_list(npc_id, items, _account_id = nil, _channel_id = 5)
      event = SellListEvent.instance
      event.npc_id = npc_id
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      SellListProc.instance.remote_call(connection, event)
    end
    def buyback_list(items, _account_id = nil, _channel_id = 5)
      event = BuybackListEvent.instance
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      BuybackListProc.instance.remote_call(connection, event)
    end
    def title_list(titles, selected_title_id, _account_id = nil, _channel_id = 5)
      event = TitleListEvent.instance
      event.titles = titles
      event.selected_title_id = selected_title_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TitleListProc.instance.remote_call(connection, event)
    end
    def update_title(character_id, title_id, _scene_id = nil, _character_id = nil)
      _character_id ||= character_id
      event = UpdateTitleEvent.instance
      event.character_id = character_id
      event.title_id = title_id
      event._scene_id = _scene_id
      event._character_id = _character_id
      connection = connection_manager.game_center
      UpdateTitleProc.instance.remote_call(connection, event)
    end
    def unit_title_changed(unit_id, new_title_id, _scene_id = nil, _channel_id = 4)
      event = UnitTitleChangedEvent.instance
      event.unit_id = unit_id
      event.new_title_id = new_title_id
      event._channel_id = _channel_id
      event._scene_id = _scene_id
      connection = connection_manager.game_center
      UnitTitleChangedProc.instance.remote_call(connection, event)
    end
    def trade_money_changed(character_id, money, _account_id = nil, _channel_id = 5)
      event = TradeMoneyChangedEvent.instance
      event.character_id = character_id
      event.money = money
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeMoneyChangedProc.instance.remote_call(connection, event)
    end
    def trade_item_changed(character_id, trade_slot_index, static_item_id, quantity, _account_id = nil, _channel_id = 5)
      event = TradeItemChangedEvent.instance
      event.character_id = character_id
      event.trade_slot_index = trade_slot_index
      event.static_item_id = static_item_id
      event.quantity = quantity
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeItemChangedProc.instance.remote_call(connection, event)
    end
    def trade_status_initiate(target_character_id, _account_id = nil, _channel_id = 5)
      event = TradeStatusInitiateEvent.instance
      event.target_character_id = target_character_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeStatusInitiateProc.instance.remote_call(connection, event)
    end
    def trade_status_cancel(_account_id = nil, _channel_id = 5)
      event = TradeStatusCancelEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeStatusCancelProc.instance.remote_call(connection, event)
    end
    def trade_status_accept(character_id, _account_id = nil, _channel_id = 5)
      event = TradeStatusAcceptEvent.instance
      event.character_id = character_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeStatusAcceptProc.instance.remote_call(connection, event)
    end
    def trade_status_unaccept(character_id, _account_id = nil, _channel_id = 5)
      event = TradeStatusUnacceptEvent.instance
      event.character_id = character_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeStatusUnacceptProc.instance.remote_call(connection, event)
    end
    def trade_status_failed(_account_id = nil, _channel_id = 5)
      event = TradeStatusFailedEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeStatusFailedProc.instance.remote_call(connection, event)
    end
    def trade_status_complete(_account_id = nil, _channel_id = 5)
      event = TradeStatusCompleteEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      TradeStatusCompleteProc.instance.remote_call(connection, event)
    end
    def mail_send_success(_account_id = nil, _channel_id = 5)
      event = MailSendSuccessEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      MailSendSuccessProc.instance.remote_call(connection, event)
    end
    def update_pending_mail(_account_id = nil, _channel_id = 5)
      event = UpdatePendingMailEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      UpdatePendingMailProc.instance.remote_call(connection, event)
    end
    def mail_list(page, total_pages, mails, _account_id = nil, _channel_id = 5)
      event = MailListEvent.instance
      event.page = page
      event.total_pages = total_pages
      event.mails = mails
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      MailListProc.instance.remote_call(connection, event)
    end
    def mail(mail_id, time, sender_name, subject, body, money, attachments, has_read, _account_id = nil, _channel_id = 5)
      event = MailEvent.instance
      event.mail_id = mail_id
      event.time = time
      event.sender_name = sender_name
      event.subject = subject
      event.body = body
      event.money = money
      event.attachments = attachments
      event.has_read = has_read
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      MailProc.instance.remote_call(connection, event)
    end
    def mail_deleted(mail_id, _account_id = nil, _channel_id = 5)
      event = MailDeletedEvent.instance
      event.mail_id = mail_id
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      MailDeletedProc.instance.remote_call(connection, event)
    end
    def album(page, cards, _account_id = nil, _channel_id = 5)
      event = AlbumEvent.instance
      event.page = page
      event.cards = cards
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      AlbumProc.instance.remote_call(connection, event)
    end
    def mall_list(tab, page, total_pages, items, _account_id = nil, _channel_id = 5)
      event = MallListEvent.instance
      event.tab = tab
      event.page = page
      event.total_pages = total_pages
      event.items = items
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      MallListProc.instance.remote_call(connection, event)
    end
    def craft_branch_list(branch_lists, _account_id = nil, _channel_id = 5)
      event = CraftBranchListEvent.instance
      event.branch_lists = branch_lists
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CraftBranchListProc.instance.remote_call(connection, event)
    end
    def craft_recipe_list(branch_id, recipes, _account_id = nil, _channel_id = 5)
      event = CraftRecipeListEvent.instance
      event.branch_id = branch_id
      event.recipes = recipes
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CraftRecipeListProc.instance.remote_call(connection, event)
    end
    def craft_info(branch_id, rank, points, _account_id = nil, _channel_id = 5)
      event = CraftInfoEvent.instance
      event.branch_id = branch_id
      event.rank = rank
      event.points = points
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CraftInfoProc.instance.remote_call(connection, event)
    end
    def craft_create_completed(_account_id = nil, _channel_id = 5)
      event = CraftCreateCompletedEvent.instance
      event._channel_id = _channel_id
      event._account_id = _account_id
      connection = connection_manager.game_center
      CraftCreateCompletedProc.instance.remote_call(connection, event)
    end
  end
end
