module Vici
  class ViciDispatcher < Reactor::Dispatcher
    include Singleton

    protected
      def event_hash
        {
          1 => ErrorEvent.instance,
          106 => ClearCorpsesEvent.instance,
          107 => ClearPartyInviteTimedOutEvent.instance,
          108 => UpdatePlayersVigorEvent.instance,
          115 => ProcessEquipmentTimedOutEvent.instance,
          242 => SceneEnterEvent.instance,
          1101 => GetCharacterListEvent.instance,
          1102 => CharacterListEvent.instance,
          1103 => CreateCharacterEvent.instance,
          1104 => CharacterCreatedEvent.instance,
          1105 => DestroyCharacterEvent.instance,
          1106 => CharacterDestroyedEvent.instance,
          1201 => LoadOptionsEvent.instance,
          1202 => GameOptionsEvent.instance,
          1203 => SaveOptionsEvent.instance,
          1204 => GameOptionsSavedEvent.instance,
          1307 => AnnounceEvent.instance,
          1309 => GmCommandEvent.instance,
          1310 => SystemMessageEvent.instance,
          2001 => GetSpellBookEvent.instance,
          2002 => SpellBookEvent.instance,
          2003 => GetUnspentSpellPointsEvent.instance,
          2004 => UnspentSpellPointChangedEvent.instance,
          2005 => LearnSpellEvent.instance,
          2006 => SpellChangedEvent.instance,
          2007 => UpdateSpellEvent.instance,
          2101 => GetActionBarEvent.instance,
          2102 => ActionBarEvent.instance,
          2103 => ActionBarSetSpellEvent.instance,
          2104 => ActionBarSetItemEvent.instance,
          2105 => ActionBarEraseEvent.instance,
          2106 => ActionBarSwapEvent.instance,
          2107 => ActionBarSlotChangedEvent.instance,
          2201 => GetContainerEvent.instance,
          2202 => ContainerEvent.instance,
          2203 => DestroyItemEvent.instance,
          2204 => DragDropItemEvent.instance,
          2205 => SplitItemEvent.instance,
          2206 => ContainerSlotChangedEvent.instance,
          2207 => UpdateInventoryEvent.instance,
          2209 => ContainerExpiredItemsEvent.instance,
          2210 => ContainerMaxSlotsChangedEvent.instance,
          2211 => ContainerSlotLockedEvent.instance,
          2212 => ContainerSlotUnlockedEvent.instance,
          4007 => UseItemEvent.instance,
          4008 => UseActionEvent.instance,
          4009 => UseContainerItemEvent.instance,
          4010 => UseConsumableEvent.instance,
          4011 => FlashEvent.instance,
          4115 => CancelAuraEvent.instance,
          4301 => ConsumeEvent.instance,
          4302 => ConsumeSpecifyPositionEvent.instance,
          4303 => ConsumeMoneyEvent.instance,
          4304 => ConsumeDiamondEvent.instance,
          4305 => ConsumeVoucherEvent.instance,
          4306 => ConsumeHonorEvent.instance,
          4307 => DamageWeaponEvent.instance,
          4308 => DamageArmorEvent.instance,
          4309 => PlayerMoneyEvent.instance,
          4310 => PlayerMoneyGainEvent.instance,
          4311 => PlayerDiamondEvent.instance,
          4312 => PlayerDiamondGainEvent.instance,
          4313 => PlayerVoucherEvent.instance,
          4314 => PlayerVoucherGainEvent.instance,
          4315 => PlayerHonorEvent.instance,
          4316 => PlayerHonorGainEvent.instance,
          4401 => NpcCorpseInfoEvent.instance,
          4402 => NpcCorpseRemoveEvent.instance,
          4501 => KillEvent.instance,
          4502 => PlayerXpEvent.instance,
          4503 => PlayerXpGainEvent.instance,
          4504 => UpdateLevelEvent.instance,
          4505 => UnitLevelUpEvent.instance,
          5001 => GossipTalkEvent.instance,
          5002 => GossipSelectOptionEvent.instance,
          5003 => GossipContentEvent.instance,
          5101 => GetQuestsEvent.instance,
          5102 => QuestsEvent.instance,
          5103 => GetAvailableQuestsEvent.instance,
          5104 => AvailableQuestsEvent.instance,
          5105 => GetQuestTextEvent.instance,
          5106 => QuestTextDescriptionEvent.instance,
          5107 => QuestTextProgressEvent.instance,
          5108 => QuestTextCompleteEvent.instance,
          5109 => QuestProgressChangedEvent.instance,
          5110 => AcceptQuestEvent.instance,
          5111 => QuestAcceptedEvent.instance,
          5112 => AbandonQuestEvent.instance,
          5113 => QuestAbandonedEvent.instance,
          5114 => CompleteQuestEvent.instance,
          5115 => QuestCompletedEvent.instance,
          5201 => UpdateProfessionEvent.instance,
          5202 => UnitProfessionChanagedEvent.instance,
          6001 => PartyGetInfoEvent.instance,
          6003 => PartyInvitePlayerEvent.instance,
          6004 => PartyInviteRequestEvent.instance,
          6005 => PartyAcceptInviteEvent.instance,
          6006 => PartyDeclineInviteEvent.instance,
          6007 => PartyInviteDeclinedEvent.instance,
          6008 => PartyNewMemberJoinedEvent.instance,
          6009 => PartyMemberLeavedEvent.instance,
          6010 => PartyUpdateLeaderEvent.instance,
          6012 => PartyLeaveEvent.instance,
          6013 => PartyUninviteEvent.instance,
          6014 => PartySetLeaderEvent.instance,
          6015 => PartyCreatedEvent.instance,
          6018 => PartyJoinedEvent.instance,
          6021 => PartyLeavedEvent.instance,
          6024 => PartyDisbandedEvent.instance,
          6101 => LootEvent.instance,
          6102 => LootListEvent.instance,
          6103 => LootOneEvent.instance,
          6104 => LootAllEvent.instance,
          6105 => LootItemRemovedEvent.instance,
          6106 => LootReleaseEvent.instance,
          6107 => LootRollEvent.instance,
          6108 => LootCloseEvent.instance,
          6109 => LootPassEvent.instance,
          6110 => LootNeedEvent.instance,
          6111 => LootNeedRollEvent.instance,
          6112 => LootGreedEvent.instance,
          6113 => LootGreedRollEvent.instance,
          6114 => PlayerGetItemEvent.instance,
          6201 => RepairEvent.instance,
          6202 => RepairAllEvent.instance,
          6203 => SuperRepairEvent.instance,
          6204 => SuperRepairAllEvent.instance,
          6205 => SalvationRepairEvent.instance,
          6206 => DurabilityChangedEvent.instance,
          6301 => GetSellListEvent.instance,
          6302 => SellListEvent.instance,
          6303 => BuyItemEvent.instance,
          6304 => SellItemEvent.instance,
          6305 => GetBuybackListEvent.instance,
          6306 => BuybackListEvent.instance,
          6307 => BuybackEvent.instance,
          6401 => GetTitleListEvent.instance,
          6402 => TitleListEvent.instance,
          6403 => SelectTitleEvent.instance,
          6404 => UpdateTitleEvent.instance,
          6405 => UnitTitleChangedEvent.instance,
          6501 => TradeInitiateEvent.instance,
          6502 => TradeAcceptEvent.instance,
          6503 => TradeUnacceptEvent.instance,
          6504 => TradeCancelEvent.instance,
          6505 => TradeSetMoneyEvent.instance,
          6506 => TradeSetItemEvent.instance,
          6507 => TradeClearItemEvent.instance,
          6508 => TradeMoneyChangedEvent.instance,
          6509 => TradeItemChangedEvent.instance,
          6510 => TradeStatusInitiateEvent.instance,
          6511 => TradeStatusCancelEvent.instance,
          6512 => TradeStatusAcceptEvent.instance,
          6513 => TradeStatusUnacceptEvent.instance,
          6514 => TradeStatusFailedEvent.instance,
          6515 => TradeStatusCompleteEvent.instance,
          6601 => SendMailEvent.instance,
          6602 => MailSendSuccessEvent.instance,
          6603 => UpdatePendingMailEvent.instance,
          6604 => GetMailListEvent.instance,
          6605 => MailListEvent.instance,
          6606 => MailTakeMoneyEvent.instance,
          6607 => MailTakeItemEvent.instance,
          6608 => MailMarkAsReadEvent.instance,
          6610 => MailDeleteEvent.instance,
          6611 => GetMailEvent.instance,
          6612 => MailEvent.instance,
          6613 => MailDeletedEvent.instance,
          6701 => GetAlbumEvent.instance,
          6702 => AlbumEvent.instance,
          6801 => GetMallListEvent.instance,
          6802 => MallListEvent.instance,
          6803 => MallBuyEvent.instance,
          6804 => MallGiveEvent.instance,
          6901 => CraftGetBranchListEvent.instance,
          6902 => CraftBranchListEvent.instance,
          6903 => CraftLearnBranchEvent.instance,
          6904 => CraftAbandonBranchEvent.instance,
          6905 => CraftGetRecipeListEvent.instance,
          6906 => CraftRecipeListEvent.instance,
          6907 => CraftLearnRecipeEvent.instance,
          6908 => CraftGetInfoEvent.instance,
          6909 => CraftInfoEvent.instance,
          6910 => CraftUpgradeEvent.instance,
          6911 => CraftCreateEvent.instance,
          6912 => CraftCreateCompletedEvent.instance,
        }
      end
  end
end
