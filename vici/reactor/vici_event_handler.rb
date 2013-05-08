require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_106_clear_corpses')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_107_clear_party_invite_timed_out')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_108_update_players_vigor')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_115_process_equipment_timed_out')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_1101_get_character_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_1103_create_character')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_1105_destroy_character')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_1201_load_options')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_1203_save_options')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_1309_gm_command')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2001_get_spell_book')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2003_get_unspent_spell_points')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2005_learn_spell')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2101_get_action_bar')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2103_action_bar_set_spell')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2104_action_bar_set_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2105_action_bar_erase')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2106_action_bar_swap')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2201_get_container')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2203_destroy_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2204_drag_drop_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_2205_split_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4007_use_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4009_use_container_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4301_consume')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4302_consume_specify_position')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4303_consume_money')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4304_consume_diamond')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4305_consume_voucher')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4306_consume_honor')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4307_damage_weapon')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4308_damage_armor')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_4501_kill')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5001_gossip_talk')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5002_gossip_select_option')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5101_get_quests')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5103_get_available_quests')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5105_get_quest_text')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5110_accept_quest')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5112_abandon_quest')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_5114_complete_quest')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6001_party_get_info')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6003_party_invite_player')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6005_party_accept_invite')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6006_party_decline_invite')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6012_party_leave')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6013_party_uninvite')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6014_party_set_leader')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6101_loot')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6103_loot_one')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6104_loot_all')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6106_loot_release')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6108_loot_close')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6110_loot_need')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6112_loot_greed')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6201_repair')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6202_repair_all')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6203_super_repair')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6204_super_repair_all')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6205_salvation_repair')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6301_get_sell_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6303_buy_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6304_sell_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6305_get_buyback_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6307_buyback')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6401_get_title_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6403_select_title')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6501_trade_initiate')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6502_trade_accept')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6503_trade_unaccept')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6504_trade_cancel')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6505_trade_set_money')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6506_trade_set_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6507_trade_clear_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6601_send_mail')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6604_get_mail_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6606_mail_take_money')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6607_mail_take_item')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6608_mail_mark_as_read')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6610_mail_delete')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6611_get_mail')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6701_get_album')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6801_get_mall_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6803_mall_buy')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6804_mall_give')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6901_craft_get_branch_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6903_craft_learn_branch')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6904_craft_abandon_branch')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6905_craft_get_recipe_list')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6907_craft_learn_recipe')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6908_craft_get_info')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6910_craft_upgrade')
require File.expand_path(File.dirname(__FILE__) + '/event_handlers/_6911_craft_create')
