package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2755")]
   public class OverworldHUD extends MovieClip
   {
      
      internal static var instance:OverworldHUD;
      
      public var shoplabel:TextField;
      
      public var chatlabel:TextField;
      
      public var hasStatPointMark:MovieClip;
      
      public var warButtonRed:SimpleButton;
      
      public var shopButton:SimpleButton;
      
      public var warButtonCustom:SimpleButton;
      
      public var bufftext:TextField;
      
      public var interactLabel:TextField;
      
      public var optionslabel:TextField;
      
      public var overworldHUD_xp:MovieClip;
      
      public var bigmap:Bigmap;
      
      public var minimap:Minimap;
      
      public var chatButton:SimpleButton;
      
      public var playerStatsButton:SimpleButton;
      
      public var duelmodeButton:SimpleButton;
      
      public var changestancelabel:TextField;
      
      public var warButtonGreen:SimpleButton;
      
      public var duellabel:TextField;
      
      public var skillslabel:TextField;
      
      public var bustUI:MovieClip;
      
      public var chatText:MovieClip;
      
      public var warButtonBlue:SimpleButton;
      
      public var buttonsBar:MovieClip;
      
      public var overworldHUD_ap:MovieClip;
      
      public var playerlabel:TextField;
      
      public var warButtonBlack:SimpleButton;
      
      public var playerQuestLogButton:SimpleButton;
      
      public var territorymap:Territorymap;
      
      public var warButtonYellow:SimpleButton;
      
      public var playerSkillsButton:SimpleButton;
      
      public var optionsButton:SimpleButton;
      
      public var nodeUI:NodeUI;
      
      public var questloglabel:TextField;
      
      public var info:MovieClip;
      
      public var warButton:SimpleButton;
      
      public var key:MovieClip;
      
      public var hasWarMoveMark:MovieClip;
      
      public var adventureModeItem:AdventureItem;
      
      public var warlabel:TextField;
      
      public var hasSkillPointMark:MovieClip;
      
      internal var inventoryUI:InventoryUI;
      
      internal var showItemUI:ShowItemUI;
      
      internal var bankUI:BankUI;
      
      internal var craftingUI:CraftingUI;
      
      internal var questLogUI:QuestLogUI;
      
      internal var skillUI:SkillScreenUI;
      
      internal var duelmodeUI:DuelModeUI;
      
      internal var optionsUI:OptionsUI;
      
      internal var achievementUI:AchievementUI;
      
      internal var worldMapUI:WorldMapUI;
      
      internal var warUI:WarUI;
      
      internal var miniInventory:MiniInventory;
      
      internal var dialog:DialogBox;
      
      internal var dialogBig:DialogBoxBig;
      
      internal var lootDialog:LootDialog;
      
      internal var globalVarDialog:GlobalVarDialog;
      
      internal var levelUpDialog:LevelUpDialog;
      
      internal var duelRequestDialog:DuelRequestDialog;
      
      internal var questCompletedDialog:QuestCompletedDialogBox;
      
      internal var tutorialUI:TutorialUI;
      
      internal var screenTransition:ScreenTransition;
      
      internal var payUI:PayUI;
      
      internal var playerPanelDisplay:PlayerPanel;
      
      internal var friendpanel:FriendPanel;
      
      internal var interactUI:InteractUI;
      
      internal var giveCoinsDialog:GiveCoinsDialog;
      
      internal var gotGiftDialog:GotGiftDialog;
      
      internal var getGoldPromptDialog:GetGoldPromptDialog;
      
      internal var changeNameDialog:ChangeNameDialog;
      
      internal var createClanDialog:CreateClanDialog;
      
      internal var dragonDanceUI:DragonDanceUI;
      
      internal var achievementUnlockedUI:AchievementUnlockedUI;
      
      internal var chikakoRefundUI:ChikakoRefundUI;
      
      internal var questTextUI:QuestTextUI;
      
      internal var questOptionUI:QuestOptionUI;
      
      internal var questImageUI:QuestImageUI;
      
      internal var questDialogueUI:QuestDialogueUI;
      
      internal var shopUI:ShopUI;
      
      internal var chatMode:int;
      
      internal var duelClickX:Number = 0;
      
      internal var duelClickY:Number = 0;
      
      internal var duelClickSameTimes:int = 0;
      
      internal var duelPlace:int = 0;
      
      internal var duelSamePlaceTimes:int = 0;
      
      internal var previouswords:String = "";
      
      internal var hasItemInChat:Boolean = false;
      
      internal var chatKeyArray:Array = new Array();
      
      internal var chatItemArray:Array = new Array();
      
      internal var previousChat:String = "";
      
      internal var spamCount:int = 0;
      
      internal var lvlup:int = 0;
      
      public function OverworldHUD()
      {
         super();
         instance = this;
         LangManager.initTextField(this.info.coinslabel,true);
         this.info.coinslabel.text = LangManager.getString(63);
         LangManager.initTextField(this.info.goldlabel,true);
         this.info.goldlabel.text = LangManager.getString(64);
         LangManager.initTextField(this.overworldHUD_ap.aplabel,true);
         this.overworldHUD_ap.aplabel.text = LangManager.getString(65);
         LangManager.initTextField(this.overworldHUD_ap.apbaricon,true);
         this.overworldHUD_ap.apbaricon.text = LangManager.getString(223);
         LangManager.initTextField(this.overworldHUD_xp.xplabel,true);
         this.overworldHUD_xp.xplabel.text = LangManager.getString(66);
         LangManager.initTextField(this.bustUI.locationtext);
         this.playerlabel.mouseEnabled = false;
         this.playerlabel.visible = false;
         LangManager.initTextField(this.playerlabel,true);
         this.playerlabel.text = LangManager.getString(67);
         this.skillslabel.mouseEnabled = false;
         this.skillslabel.visible = false;
         LangManager.initTextField(this.skillslabel,true);
         this.skillslabel.text = LangManager.getString(81);
         this.questloglabel.mouseEnabled = false;
         this.questloglabel.visible = false;
         LangManager.initTextField(this.questloglabel,true);
         this.questloglabel.text = LangManager.getString(77);
         this.duellabel.mouseEnabled = false;
         this.duellabel.visible = false;
         LangManager.initTextField(this.duellabel,true);
         this.duellabel.text = LangManager.getString(173);
         this.optionslabel.mouseEnabled = false;
         this.optionslabel.visible = false;
         LangManager.initTextField(this.optionslabel,true);
         this.optionslabel.text = LangManager.getString(10);
         this.shoplabel.mouseEnabled = false;
         this.shoplabel.visible = false;
         LangManager.initTextField(this.shoplabel,true);
         this.shoplabel.text = LangManager.getString(625);
         this.chatlabel.mouseEnabled = false;
         this.chatlabel.visible = false;
         LangManager.initTextField(this.chatlabel,true);
         this.chatlabel.text = LangManager.getString(206);
         this.warlabel.mouseEnabled = false;
         this.warlabel.visible = false;
         LangManager.initTextField(this.warlabel,true);
         this.warlabel.text = LangManager.getString(305);
         this.changestancelabel.mouseEnabled = false;
         this.changestancelabel.visible = false;
         LangManager.initTextField(this.changestancelabel,true);
         this.changestancelabel.text = LangManager.getString(208);
         this.bustUI.battlemodebust.highlight.visible = false;
         LangManager.initTextField(this.info.payUIButton.getgoldlabel,true);
         this.info.payUIButton.getgoldlabel.mouseEnabled = false;
         this.info.payUIButton.getgoldlabel.text = LangManager.getString(486);
         LangManager.initTextField(this.interactLabel,true);
         this.interactLabel.mouseEnabled = false;
         this.interactLabel.cacheAsBitmap = true;
         LangManager.initTextField(this.bufftext,true);
         this.bufftext.text = "";
         this.bufftext.htmlText = "";
         this.bufftext.mouseEnabled = false;
         this.bufftext.visible = false;
         this.changeNameDialog = new ChangeNameDialog();
         addChild(this.changeNameDialog);
         this.changeNameDialog.visible = false;
         this.showItemUI = new ShowItemUI();
         addChild(this.showItemUI);
         this.showItemUI.visible = false;
         this.inventoryUI = new InventoryUI();
         addChild(this.inventoryUI);
         this.inventoryUI.visible = false;
         this.questLogUI = new QuestLogUI();
         addChild(this.questLogUI);
         this.questLogUI.visible = false;
         this.skillUI = new SkillScreenUI();
         addChild(this.skillUI);
         this.skillUI.visible = false;
         this.duelmodeUI = new DuelModeUI();
         addChild(this.duelmodeUI);
         this.duelmodeUI.visible = false;
         this.optionsUI = new OptionsUI();
         addChild(this.optionsUI);
         this.optionsUI.visible = false;
         this.worldMapUI = new WorldMapUI();
         addChild(this.worldMapUI);
         this.worldMapUI.visible = false;
         this.warUI = new WarUI();
         addChild(this.warUI);
         this.warUI.visible = false;
         this.nodeUI.visible = false;
         this.miniInventory = new MiniInventory();
         addChild(this.miniInventory);
         this.miniInventory.visible = false;
         this.adventureModeItem.visible = false;
         this.adventureModeItem.costText.text = "";
         this.playerPanelDisplay = new PlayerPanel();
         addChild(this.playerPanelDisplay);
         this.playerPanelDisplay.visible = false;
         this.interactUI = new InteractUI();
         addChild(this.interactUI);
         this.interactUI.visible = false;
         this.bankUI = new BankUI();
         addChild(this.bankUI);
         this.bankUI.visible = false;
         this.craftingUI = new CraftingUI();
         addChild(this.craftingUI);
         this.craftingUI.visible = false;
         this.achievementUI = new AchievementUI();
         addChild(this.achievementUI);
         this.achievementUI.visible = false;
         this.shopUI = new ShopUI();
         addChild(this.shopUI);
         this.shopUI.visible = false;
         this.lootDialog = new LootDialog();
         addChild(this.lootDialog);
         this.lootDialog.visible = false;
         this.globalVarDialog = new GlobalVarDialog();
         addChild(this.globalVarDialog);
         this.globalVarDialog.visible = false;
         this.questCompletedDialog = new QuestCompletedDialogBox();
         addChild(this.questCompletedDialog);
         this.questCompletedDialog.visible = false;
         this.levelUpDialog = new LevelUpDialog();
         addChild(this.levelUpDialog);
         this.levelUpDialog.visible = false;
         this.duelRequestDialog = new DuelRequestDialog();
         addChild(this.duelRequestDialog);
         this.duelRequestDialog.visible = false;
         this.questTextUI = new QuestTextUI();
         addChild(this.questTextUI);
         this.questOptionUI = new QuestOptionUI();
         addChild(this.questOptionUI);
         this.questImageUI = new QuestImageUI();
         addChild(this.questImageUI);
         this.questDialogueUI = new QuestDialogueUI();
         addChild(this.questDialogueUI);
         this.dialog = new DialogBox();
         addChild(this.dialog);
         this.dialog.visible = false;
         this.dialogBig = new DialogBoxBig();
         addChild(this.dialogBig);
         this.dialogBig.visible = false;
         this.giveCoinsDialog = new GiveCoinsDialog();
         addChild(this.giveCoinsDialog);
         this.giveCoinsDialog.visible = false;
         this.getGoldPromptDialog = new GetGoldPromptDialog();
         addChild(this.getGoldPromptDialog);
         this.getGoldPromptDialog.visible = false;
         this.payUI = new PayUI();
         addChild(this.payUI);
         this.payUI.visible = false;
         this.gotGiftDialog = new GotGiftDialog();
         addChild(this.gotGiftDialog);
         this.gotGiftDialog.visible = false;
         this.tutorialUI = new TutorialUI();
         addChild(this.tutorialUI);
         this.dragonDanceUI = new DragonDanceUI();
         addChild(this.dragonDanceUI);
         this.screenTransition = new ScreenTransition();
         addChild(this.screenTransition);
         this.chikakoRefundUI = new ChikakoRefundUI();
         this.chikakoRefundUI.x = 578;
         this.chikakoRefundUI.y = 480;
         this.chikakoRefundUI.visible = false;
         addChild(this.chikakoRefundUI);
         this.achievementUnlockedUI = new AchievementUnlockedUI();
         this.achievementUnlockedUI.x = 490;
         this.achievementUnlockedUI.y = 480;
         this.achievementUnlockedUI.visible = false;
         addChild(this.achievementUnlockedUI);
         this.chatText.visible = false;
         if(StatsManager.language == LangManager.CHINESE)
         {
            this.chatText.words.maxChars = 32;
         }
         else
         {
            this.chatText.words.maxChars = 55;
         }
         if(StatsManager.consoleEnabled)
         {
            this.chatText.words.maxChars = 0;
         }
         LangManager.initTextField(this.chatText.words,false);
         LangManager.initTextField(this.chatText.chatlog,true);
         this.chatText.chatlog.text = "";
         this.setActiveQuestText("");
         this.friendpanel = new FriendPanel();
         addChild(this.friendpanel);
         this.friendpanel.y = 480;
         if(StatsManager.showFriends)
         {
            this.friendpanel.init();
         }
         else
         {
            this.friendpanel.hideAll();
         }
         this.reset();
         this.doResize();
         this.chatButton.upState.cacheAsBitmap = true;
         this.chatButton.downState.cacheAsBitmap = true;
         this.chatButton.overState.cacheAsBitmap = true;
         this.playerStatsButton.upState.cacheAsBitmap = true;
         this.playerStatsButton.downState.cacheAsBitmap = true;
         this.playerStatsButton.overState.cacheAsBitmap = true;
         this.playerSkillsButton.upState.cacheAsBitmap = true;
         this.playerSkillsButton.downState.cacheAsBitmap = true;
         this.playerSkillsButton.overState.cacheAsBitmap = true;
         this.duelmodeButton.upState.cacheAsBitmap = true;
         this.duelmodeButton.downState.cacheAsBitmap = true;
         this.duelmodeButton.overState.cacheAsBitmap = true;
         this.playerQuestLogButton.upState.cacheAsBitmap = true;
         this.playerQuestLogButton.downState.cacheAsBitmap = true;
         this.playerQuestLogButton.overState.cacheAsBitmap = true;
         this.shopButton.upState.cacheAsBitmap = true;
         this.shopButton.downState.cacheAsBitmap = true;
         this.shopButton.overState.cacheAsBitmap = true;
         this.optionsButton.upState.cacheAsBitmap = true;
         this.optionsButton.downState.cacheAsBitmap = true;
         this.optionsButton.overState.cacheAsBitmap = true;
      }
      
      public static function getInstance() : OverworldHUD
      {
         if(instance == null)
         {
            return new OverworldHUD();
         }
         return instance;
      }
      
      public function reset() : *
      {
         this.removeEventListeners();
         this.addEventListeners();
         var bust:MCSBust = StatsManager.getPlayerBust();
         this.bustUI.battlemodebust.bustcanvas.addChild(bust);
         this.bustUI.battlemodebust.stancecolor1.gotoAndStop(2);
         this.bustUI.battlemodebust.buttonMode = true;
         bust.scaleX = 2;
         bust.scaleY = 2;
         if(Boolean(this.inventoryUI) && this.inventoryUI.visible)
         {
            this.inventoryUI.onLeave(null);
         }
         if(Boolean(this.showItemUI) && this.showItemUI.visible)
         {
            this.showItemUI.visible = false;
         }
         if(Boolean(this.bankUI) && this.bankUI.visible)
         {
            this.bankUI.onLeave(null);
         }
         if(Boolean(this.craftingUI) && this.craftingUI.visible)
         {
            this.craftingUI.onLeave(null);
         }
         if(this.questLogUI)
         {
            this.questLogUI.visible = false;
         }
         if(this.skillUI)
         {
            this.skillUI.visible = false;
         }
         if(this.duelmodeUI)
         {
            this.duelmodeUI.visible = false;
         }
         if(this.optionsUI)
         {
            this.optionsUI.visible = false;
         }
         if(this.worldMapUI)
         {
            this.worldMapUI.visible = false;
         }
         if(this.warUI)
         {
            this.warUI.visible = false;
         }
         if(this.achievementUI)
         {
            this.achievementUI.visible = false;
         }
         if(this.miniInventory)
         {
            this.miniInventory.visible = false;
         }
         if(this.interactUI)
         {
            this.interactUI.hide();
         }
         if(this.shopUI)
         {
            this.shopUI.visible = false;
         }
         if(this.levelUpDialog)
         {
            this.levelUpDialog.visible = false;
         }
         if(this.lootDialog)
         {
            this.lootDialog.visible = false;
         }
         if(this.globalVarDialog)
         {
            this.globalVarDialog.visible = false;
         }
         if(this.dialog)
         {
            this.dialog.visible = false;
         }
         if(this.questTextUI)
         {
            this.questTextUI.visible = false;
         }
         if(this.questOptionUI)
         {
            this.questOptionUI.visible = false;
         }
         if(this.questImageUI)
         {
            this.questImageUI.visible = false;
         }
         if(this.questDialogueUI)
         {
            this.questDialogueUI.visible = false;
         }
         if(this.duelRequestDialog)
         {
            this.duelRequestDialog.visible = false;
         }
         if(this.payUI)
         {
            this.payUI.visible = false;
         }
         if(this.playerPanelDisplay)
         {
            this.playerPanelDisplay.visible = false;
         }
         if(this.dragonDanceUI)
         {
            this.dragonDanceUI.visible = false;
         }
         this.showInfoBustButtons(true);
         this.adventureModeItem.visible = false;
         this.nodeUI.visible = false;
         this.chatText.visible = false;
         this.interactLabel.visible = false;
         this.minimap.visible = false;
         this.bigmap.visible = false;
         this.worldMapUI.visible = false;
         this.territorymap.visible = false;
         this.key.visible = false;
         if(StatsManager.stance == MCSPlayer.LIGHT_STANCE)
         {
            this.updateBustText(LangManager.getString(643));
         }
         else if(StatsManager.stance == MCSPlayer.BALANCED_STANCE)
         {
            this.updateBustText(LangManager.getString(644));
         }
         else if(StatsManager.stance == MCSPlayer.HEAVY_STANCE)
         {
            this.updateBustText(LangManager.getString(645));
         }
         this.bustUI.battlemodebust.stancecolor1.gotoAndStop(StatsManager.stance + 1);
         this.updateHUD();
         if(QueryManager.instance.offlineMode)
         {
            this.info.payUIButton.visible = false;
            this.info.payUIButton.getgoldlabel.visible = false;
            this.info.getCoinsButton.visible = false;
            this.overworldHUD_ap.getAPButton.visible = false;
         }
      }
      
      public function leaveClan() : *
      {
         this.warButton.visible = true;
         this.warButtonRed.visible = false;
         this.warButtonGreen.visible = false;
         this.warButtonBlue.visible = false;
         this.warButtonYellow.visible = false;
         this.warButtonBlack.visible = false;
         this.warButtonCustom.visible = false;
      }
      
      public function setCustomClan() : *
      {
         this.warButton.visible = false;
         this.warButtonRed.visible = false;
         this.warButtonGreen.visible = false;
         this.warButtonBlue.visible = false;
         this.warButtonYellow.visible = false;
         this.warButtonBlack.visible = false;
         this.warButtonCustom.visible = true;
      }
      
      public function showDialog(msg:String, buttonText:String, showOK:Boolean = true) : *
      {
         this.dialog.show(msg,buttonText,showOK);
      }
      
      public function showYesNoDialog(msg:String, yesFunction:Function = null, noFunction:Function = null) : *
      {
         this.dialog.showYesNoDialog(msg,yesFunction,noFunction);
      }
      
      public function showDialogAP(msg:String, buttonText:String, showOK:Boolean = true) : *
      {
         this.getGoldPromptDialog.showAP();
      }
      
      public function showDialogDT() : *
      {
         this.getGoldPromptDialog.showDT();
      }
      
      public function showDialogIncreaseStorage() : *
      {
         this.getGoldPromptDialog.showIncreaseStorage();
      }
      
      public function showDialogRepairWeapon() : *
      {
         this.getGoldPromptDialog.showRepairWeapon();
      }
      
      public function showGetDailyPrize() : *
      {
         this.getGoldPromptDialog.showGetDailyPrize();
      }
      
      public function showDialogBig(msg:String, buttonText:String, showOK:Boolean = true) : *
      {
         this.dialogBig.show(msg,buttonText,showOK);
      }
      
      public function closeOpenDialogs(dontCloseWarUI:Boolean = false) : *
      {
         if(this.inventoryUI.visible)
         {
            this.inventoryUI.onLeave(null);
         }
         if(this.showItemUI.visible)
         {
            this.showItemUI.onClick(null);
         }
         if(this.bankUI.visible)
         {
            this.bankUI.onLeave(null);
         }
         if(this.craftingUI.visible)
         {
            this.craftingUI.onLeave(null);
         }
         if(this.questLogUI.visible)
         {
            this.questLogUI.onLeave(null);
         }
         if(this.skillUI.visible)
         {
            this.skillUI.onLeave(null);
         }
         if(this.optionsUI.visible)
         {
            this.optionsUI.onLeave(null);
         }
         if(this.achievementUI.visible)
         {
            this.achievementUI.onLeave(null);
         }
         if(this.worldMapUI.visible)
         {
            this.worldMapUI.hide();
         }
         if(!dontCloseWarUI && this.warUI.visible)
         {
            this.warUI.forceClose();
         }
         if(this.dialog.visible)
         {
            this.dialog.onClick(null);
         }
         if(this.dialogBig.visible)
         {
            this.dialogBig.onClick(null);
         }
         if(this.lootDialog.visible)
         {
            this.lootDialog.onClick(null);
         }
         if(this.globalVarDialog.visible)
         {
            this.globalVarDialog.onClick(null);
         }
         if(this.levelUpDialog.visible)
         {
            this.levelUpDialog.onClick(null);
         }
         if(this.duelRequestDialog.visible)
         {
            this.duelRequestDialog.onCancel();
         }
         if(this.questCompletedDialog.visible)
         {
            this.questCompletedDialog.onClick(null);
         }
         if(this.payUI.visible)
         {
            this.payUI.onLeave(null);
         }
         if(this.interactUI.visible)
         {
            this.interactUI.hide();
         }
         if(this.giveCoinsDialog.visible)
         {
            this.giveCoinsDialog.cancelClick(null);
         }
         if(this.getGoldPromptDialog.visible)
         {
            this.getGoldPromptDialog.onNoClick(null);
         }
         if(this.playerPanelDisplay.visible)
         {
            this.playerPanelDisplay.closePanel();
         }
         if(this.gotGiftDialog.visible)
         {
            this.gotGiftDialog.onClick(null);
         }
         if(this.createClanDialog != null && this.createClanDialog.visible)
         {
            this.createClanDialog.cancelClick(null);
         }
         if(this.shopUI.visible)
         {
            this.shopUI.onLeave(null);
         }
      }
      
      public function showQuestCompletedDialog(questID:int) : *
      {
         var questData:XMLQuest = QuestEngine.getQuestData(questID);
         this.questCompletedDialog.show(questData.name,LangManager.getString(5));
      }
      
      public function showDuelRequestDialog(msg:Object, sender:String) : *
      {
         if(!QueryManager.instance.checkCurrentSessionId())
         {
            OverworldHUD.instance.showMultipleClients();
            return;
         }
         this.duelRequestDialog.show(msg,sender);
      }
      
      public function showDuelDeclinedDialog(msg:String) : *
      {
         this.duelRequestDialog.showDeclinedMode(msg);
      }
      
      public function cancelDuelRequestDialog() : *
      {
         this.duelRequestDialog.onCancel();
      }
      
      public function addEventListeners() : *
      {
         this.playerStatsButton.addEventListener(MouseEvent.CLICK,this.onShowInventory);
         this.playerStatsButton.addEventListener(MouseEvent.MOUSE_OVER,this.showPlayerLabel);
         this.playerStatsButton.addEventListener(MouseEvent.MOUSE_OUT,this.hidePlayerLabel);
         this.playerSkillsButton.addEventListener(MouseEvent.CLICK,this.onShowSkill);
         this.playerSkillsButton.addEventListener(MouseEvent.MOUSE_OVER,this.showSkillLabel);
         this.playerSkillsButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideSkillLabel);
         this.playerQuestLogButton.addEventListener(MouseEvent.CLICK,this.onShowQuestLog);
         this.playerQuestLogButton.addEventListener(MouseEvent.MOUSE_OVER,this.showQuestLogLabel);
         this.playerQuestLogButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideQuestLogLabel);
         this.duelmodeButton.addEventListener(MouseEvent.CLICK,this.onShowDuelMode);
         this.duelmodeButton.addEventListener(MouseEvent.MOUSE_OVER,this.showDuelLabel);
         this.duelmodeButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideDuelLabel);
         this.optionsButton.addEventListener(MouseEvent.CLICK,this.onShowOptions);
         this.optionsButton.addEventListener(MouseEvent.MOUSE_OVER,this.showOptionsLabel);
         this.optionsButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideOptionsLabel);
         this.shopButton.addEventListener(MouseEvent.CLICK,this.showNinjaServices);
         this.shopButton.addEventListener(MouseEvent.MOUSE_OVER,this.showShopLabel);
         this.shopButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideShopLabel);
         this.chatButton.addEventListener(MouseEvent.CLICK,this.onShowChat);
         this.chatButton.addEventListener(MouseEvent.MOUSE_OVER,this.showChatLabel);
         this.chatButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideChatLabel);
         var side:int = StatsManager.getSide();
         if(side == 0)
         {
            this.warButton.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButton.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButton.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         else if(side == 1)
         {
            this.warButtonRed.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButtonRed.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButtonRed.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         else if(side == 2)
         {
            this.warButtonGreen.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButtonGreen.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButtonGreen.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         else if(side == 3)
         {
            this.warButtonBlue.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButtonBlue.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButtonBlue.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         else if(side == 4)
         {
            this.warButtonYellow.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButtonYellow.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButtonYellow.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         else if(side == 5)
         {
            this.warButtonBlack.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButtonBlack.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButtonBlack.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         else
         {
            this.warButtonCustom.addEventListener(MouseEvent.CLICK,this.onShowWar);
            this.warButtonCustom.addEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
            this.warButtonCustom.addEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         }
         this.bustUI.battlemodebust.addEventListener(MouseEvent.CLICK,this.nextStance);
         this.bustUI.battlemodebust.addEventListener(MouseEvent.MOUSE_OVER,this.showChangeStanceLabel);
         this.bustUI.battlemodebust.addEventListener(MouseEvent.MOUSE_OUT,this.hideChangeStanceLabel);
         this.info.payUIButton.addEventListener(MouseEvent.CLICK,this.showPayUI);
         this.info.getCoinsButton.addEventListener(MouseEvent.CLICK,this.showGetCoins);
         this.overworldHUD_ap.getAPButton.addEventListener(MouseEvent.CLICK,this.showGetAP);
         this.bustUI.getHPButton.addEventListener(MouseEvent.CLICK,this.showGetHP);
         this.minimap.addEventListener(MouseEvent.CLICK,this.minimapClick);
         this.bigmap.addEventListener(MouseEvent.CLICK,this.bigmapClick);
         this.territorymap.addEventListener(MouseEvent.CLICK,this.bigmapClick);
         this.chatText.words.addEventListener(MouseEvent.CLICK,this.onChatClick);
         this.chatText.words.addEventListener(KeyboardEvent.KEY_UP,this.onChatTextKeyUp);
         this.chatText.chatEnterButton.addEventListener(MouseEvent.CLICK,this.onChatEnterButtonClick);
         this.chatText.chatModeButton.addEventListener(MouseEvent.CLICK,this.onChatMode);
         this.chatText.chatModeButton.addEventListeners();
         this.chatText.chatlog.addEventListener(TextEvent.LINK,this.handleChatLogLink);
      }
      
      public function removeEventListeners() : *
      {
         this.playerStatsButton.removeEventListener(MouseEvent.CLICK,this.onShowInventory);
         this.playerStatsButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showPlayerLabel);
         this.playerStatsButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hidePlayerLabel);
         this.playerSkillsButton.removeEventListener(MouseEvent.CLICK,this.onShowSkill);
         this.playerSkillsButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showSkillLabel);
         this.playerSkillsButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideSkillLabel);
         this.playerQuestLogButton.removeEventListener(MouseEvent.CLICK,this.onShowQuestLog);
         this.playerQuestLogButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showQuestLogLabel);
         this.playerQuestLogButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideQuestLogLabel);
         this.duelmodeButton.removeEventListener(MouseEvent.CLICK,this.onShowDuelMode);
         this.duelmodeButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showDuelLabel);
         this.duelmodeButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideDuelLabel);
         this.optionsButton.removeEventListener(MouseEvent.CLICK,this.onShowOptions);
         this.optionsButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showOptionsLabel);
         this.optionsButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideOptionsLabel);
         this.shopButton.removeEventListener(MouseEvent.CLICK,this.showNinjaServices);
         this.shopButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showShopLabel);
         this.shopButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideShopLabel);
         this.warButton.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.warButtonRed.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButtonRed.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButtonRed.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.warButtonGreen.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButtonGreen.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButtonGreen.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.warButtonBlue.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButtonBlue.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButtonBlue.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.warButtonYellow.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButtonYellow.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButtonYellow.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.warButtonBlack.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButtonBlack.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButtonBlack.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.warButtonCustom.removeEventListener(MouseEvent.CLICK,this.onShowWar);
         this.warButtonCustom.removeEventListener(MouseEvent.MOUSE_OVER,this.showWarLabel);
         this.warButtonCustom.removeEventListener(MouseEvent.MOUSE_OUT,this.hideWarLabel);
         this.chatButton.removeEventListener(MouseEvent.CLICK,this.onShowChat);
         this.chatButton.removeEventListener(MouseEvent.MOUSE_OVER,this.showChatLabel);
         this.chatButton.removeEventListener(MouseEvent.MOUSE_OUT,this.hideChatLabel);
         this.bustUI.battlemodebust.removeEventListener(MouseEvent.CLICK,this.nextStance);
         this.bustUI.battlemodebust.removeEventListener(MouseEvent.MOUSE_OVER,this.showChangeStanceLabel);
         this.bustUI.battlemodebust.removeEventListener(MouseEvent.MOUSE_OUT,this.hideChangeStanceLabel);
         this.info.payUIButton.removeEventListener(MouseEvent.CLICK,this.showPayUI);
         this.info.getCoinsButton.removeEventListener(MouseEvent.CLICK,this.showGetCoins);
         this.overworldHUD_ap.getAPButton.removeEventListener(MouseEvent.CLICK,this.showGetAP);
         this.bustUI.getHPButton.removeEventListener(MouseEvent.CLICK,this.showGetHP);
         this.minimap.removeEventListener(MouseEvent.CLICK,this.minimapClick);
         this.bigmap.removeEventListener(MouseEvent.CLICK,this.bigmapClick);
         this.territorymap.removeEventListener(MouseEvent.CLICK,this.bigmapClick);
         this.chatText.words.removeEventListener(MouseEvent.CLICK,this.onChatClick);
         this.chatText.words.removeEventListener(KeyboardEvent.KEY_UP,this.onChatTextKeyUp);
         this.chatText.chatEnterButton.removeEventListener(MouseEvent.CLICK,this.onChatEnterButtonClick);
         this.chatText.chatModeButton.removeEventListener(MouseEvent.CLICK,this.onChatMode);
         this.chatText.chatModeButton.removeEventListeners();
         this.chatText.chatlog.removeEventListener(TextEvent.LINK,this.handleChatLogLink);
      }
      
      public function onShowSkill(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            if(InputManager.isDisabled())
            {
               return;
            }
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
         this.skillUI.show();
         this.hideAll();
         if(this.tutorialUI.getState() == 3)
         {
            this.tutorialUI.setState(8);
         }
         else
         {
            this.tutorialUI.setState(0);
         }
      }
      
      public function onShowInventory(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            if(InputManager.isDisabled())
            {
               return;
            }
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
         this.hideAll();
         this.inventoryUI.show();
         this.tutorialUI.setState(0);
      }
      
      public function showShowItemUI(item:Item) : *
      {
         this.showItemUI.show(item);
      }
      
      public function onShowInventoryGive() : *
      {
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            InputManager.disableInput();
         }
         this.inventoryUI.showGive();
      }
      
      public function onShowBank() : *
      {
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            InputManager.disableInput();
         }
         this.bankUI.show();
      }
      
      public function onShowCrafting() : *
      {
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            InputManager.disableInput();
         }
         this.craftingUI.show();
      }
      
      public function onShowGiveCoinsDialog() : *
      {
         this.giveCoinsDialog.show();
      }
      
      public function onShowGetGoldPromptDialog(num:int) : *
      {
         this.getGoldPromptDialog.show(num);
      }
      
      public function showPayUI(event:Event) : *
      {
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            if(InputManager.isDisabled())
            {
               return;
            }
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
         this.payUI.show();
      }
      
      public function showGetCoins(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(QueryManager.instance.offlineMode)
         {
            this.showDialog(LangManager.getString(632),LangManager.getString(5));
         }
         else
         {
            this.interactUI.show(InteractUI.UIMODE_GETCOINS,1);
         }
      }
      
      public function showGetAP(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(QueryManager.instance.offlineMode)
         {
            this.showDialog(LangManager.getString(632),LangManager.getString(5));
         }
         else
         {
            this.interactUI.show(InteractUI.UIMODE_GETAP);
         }
      }
      
      public function showGetHP(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(QueryManager.instance.offlineMode)
         {
            this.showDialog(LangManager.getString(632),LangManager.getString(5));
         }
         else
         {
            this.interactUI.show(InteractUI.UIMODE_GETCOINS,2);
         }
      }
      
      public function showNinjaServices(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(QueryManager.instance.offlineMode)
         {
            this.showDialog(LangManager.getString(632),LangManager.getString(5));
         }
         else
         {
            this.interactUI.show(InteractUI.UIMODE_GETCOINS);
         }
      }
      
      public function showPremiumShop() : *
      {
         var shopData:XMLShopData = new XMLShopData(new XMLList());
         shopData.initPremiumItems();
         OverworldHUD.instance.shopUI.showBuy(shopData);
         OverworldHUD.instance.shopUI.showShopDTAP();
      }
      
      public function onShowQuestLog(event:Event) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            if(InputManager.isDisabled())
            {
               return;
            }
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
         this.questLogUI.show();
         this.hideAll();
         this.tutorialUI.setState(0);
      }
      
      public function onShowDuelMode(event:MouseEvent = null) : *
      {
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(false);
         }
         else
         {
            if(InputManager.isDisabled())
            {
               return;
            }
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
         this.tutorialUI.setState(0);
         if(QueryManager.instance.offlineMode)
         {
            this.showDialog(LangManager.getString(294),LangManager.getString(5));
         }
         else if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.showDialog(LangManager.getString(860),LangManager.getString(5));
         }
         else if(StatsManager.getLevel() < 2)
         {
            this.showDialog(LangManager.getString(667),LangManager.getString(5));
         }
         else if(event != null)
         {
            if(this.duelClickX == event.stageX && this.duelClickY == event.stageY)
            {
               ++this.duelClickSameTimes;
            }
            else
            {
               this.duelClickSameTimes = 0;
            }
            if(StageManager.getCurrentNode() == this.duelPlace)
            {
               ++this.duelSamePlaceTimes;
            }
            else
            {
               this.duelSamePlaceTimes = 0;
            }
            this.duelClickX = event.stageX;
            this.duelClickY = event.stageY;
            this.duelPlace = StageManager.getCurrentNode();
            if(this.duelClickSameTimes >= 3)
            {
               this.duelClickSameTimes = 0;
               QueryManager.instance.logMessage("[human check] same click");
               this.showHumanCheck();
            }
            else if(this.duelSamePlaceTimes >= 30)
            {
               this.duelSamePlaceTimes = 0;
               this.showHumanCheck();
            }
            else
            {
               this.hideAll();
               this.duelmodeUI.show();
            }
         }
         else
         {
            this.hideAll();
            this.duelmodeUI.show();
         }
      }
      
      public function onShowOptions(event:Event) : *
      {
         if(!GameEngine.isOverworld())
         {
            if(InputManager.isDisabled())
            {
               return;
            }
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
         this.showInfoBustButtons(false);
         this.optionsUI.show();
         this.tutorialUI.setState(0);
      }
      
      public function onShowAchievement(mouseEvent:MouseEvent) : *
      {
         this.achievementUI.show();
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
      }
      
      public function onShowDragonDanceUI() : *
      {
         this.dragonDanceUI.show();
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving(false);
         }
      }
      
      public function onShowWar(event:Event) : *
      {
         if(StatsManager.charname.slice(0,6) == "player")
         {
            this.showDialog("War Room is disabled for this character","OK");
            return;
         }
         if(StatsManager.getLevel() < 10 && StatsManager.getPlayerStats(StatsManager.STAT_DAN) == 0)
         {
            this.showDialog(LangManager.getString(320),LangManager.getString(5));
            return;
         }
         if(QueryManager.instance.offlineMode)
         {
            this.showDialog("Not available in offline mode",LangManager.getString(5));
            return;
         }
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         this.warUI.onShow();
         this.hideAll();
         StatsManager.getPlayer().stopMoving(false);
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
         }
      }
      
      public function showCreateClanDialog(isEdit:Boolean = false) : *
      {
         this.createClanDialog = new CreateClanDialog();
         addChild(this.createClanDialog);
         this.createClanDialog.show(isEdit);
      }
      
      public function destroyCreateClanDialog() : *
      {
         removeChild(this.createClanDialog);
         this.createClanDialog = null;
      }
      
      public function getNodeUI() : NodeUI
      {
         return this.nodeUI;
      }
      
      public function showNodeUI(flag:Boolean) : *
      {
         this.nodeUI.visible = flag;
         this.nodeUI.scaleX = 1;
         this.nodeUI.scaleY = 1;
      }
      
      public function showInteractUI(uimode:int, param:int = 0, item:Item = null) : *
      {
         this.interactUI.show(uimode,param,item);
      }
      
      public function updateHUD(force:Boolean = false) : *
      {
         if(!force && !GameEngine.isAdventureMode() && !GameEngine.isPvPRoomMode())
         {
            return;
         }
         var Level:int = StatsManager.getStat(10);
         this.updateLeveltext(Level);
         if(!StatsManager.consoleEnabled && StatsManager.charname != "admin")
         {
            if(Level > StatsManager.levelCap)
            {
               QueryManager.instance.reportHack("level cap");
               return;
            }
            if(StatsManager.getStat(StatsManager.STAT_HGOLD) > 60 && StatsManager.getStat(StatsManager.STAT_DAN) < 9)
            {
               QueryManager.instance.reportHack("gold");
               return;
            }
            if(StatsManager.getStat(StatsManager.STAT_GOLD) > 10000)
            {
               QueryManager.instance.reportHack("coins");
               return;
            }
         }
         this.updateAP(StatsManager.getStat(13) / StatsManager.getStat(14));
         this.updateAPtext(StatsManager.getStat(13),StatsManager.getStat(14));
         this.updateHpChi(StatsManager.getStat(0),StatsManager.getStat(1) + StatsManager.findBonusStat(1),StatsManager.getStat(3),StatsManager.getStat(4) + StatsManager.findBonusStat(4));
         this.updateTokenText(StatsManager.getStat(15));
         this.updateEXP((StatsManager.getXP() - StatsManager.getXPLevelThreshhold(Level - 1)) / (StatsManager.getXPLevelThreshhold(Level) - StatsManager.getXPLevelThreshhold(Level - 1)));
         this.updateEXPtext(StatsManager.getXP(),StatsManager.getXPLevelThreshhold(Level));
         this.updateGGoldText(StatsManager.getStat(11));
         this.updateHGoldText(StatsManager.getHeavenlyGold());
         this.key.visible = StatsManager.hasKey() && this.minimap.visible;
         if(this.playerStatsButton.visible)
         {
            this.hasStatPointMark.visible = StatsManager.getStat(StatsManager.STAT_STATPOINTS) > 0;
            this.hasSkillPointMark.visible = StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) > 0;
            this.hasWarMoveMark.visible = StatsManager.getSide() != 0 && StatsManager.getPlayerStats(StatsManager.STAT_WARMOVES) > 0;
         }
         if(this.inventoryUI.visible)
         {
            this.inventoryUI.updateAP();
         }
         if(this.duelmodeUI.visible)
         {
            this.duelmodeUI.updateDT();
         }
         if(this.shopUI.visible)
         {
            this.shopUI.updateDT();
            this.shopUI.updateAP();
         }
      }
      
      public function updateAP(percentage:Number) : *
      {
         this.overworldHUD_ap.APbar.bar.scaleX = percentage;
      }
      
      public function updateAPtimer(duration:String) : *
      {
         if(this.overworldHUD_ap.APtimer.text != duration)
         {
            this.overworldHUD_ap.APtimer.text = duration;
            this.overworldHUD_ap.APtimershadow.text = duration;
         }
      }
      
      public function updateBuff(bufftype:int, duration:int) : *
      {
         var buffstr:String = null;
         if(duration <= 0 || !this.playerStatsButton.visible)
         {
            this.bufftext.htmlText = "";
            this.bufftext.visible = false;
         }
         else if(duration > 0)
         {
            if(bufftype == StatsManager.BUFF_XP)
            {
               buffstr = "150% XP";
            }
            else if(bufftype == StatsManager.BUFF_ATTACK)
            {
               buffstr = "150% DAMAGE";
            }
            else if(bufftype == StatsManager.BUFF_DEFENSE)
            {
               buffstr = "150% DEFENSE";
            }
            else if(bufftype == StatsManager.BUFF_SPEED)
            {
               buffstr = "150% SPEED";
            }
            else if(bufftype == StatsManager.BUFF_AP)
            {
               buffstr = "200% AP REGEN";
            }
            else if(bufftype == StatsManager.BUFF_DUELTOKENS)
            {
               buffstr = "200% DUEL TOKEN REGEN";
            }
            else if(bufftype == StatsManager.BUFF_COINS)
            {
               buffstr = "Increased chance of finding more coins";
            }
            else if(bufftype == StatsManager.BUFF_RARELOOT)
            {
               buffstr = "Increased chance of finding rare loot";
            }
            else if(bufftype == StatsManager.BUFF_MUTE)
            {
               buffstr = "Anti-Spam Muting";
            }
            else if(bufftype == StatsManager.BUFF_FULLMUTE)
            {
               buffstr = "Anti-Spam Full Muting";
            }
            else if(bufftype == StatsManager.BUFF_HELL)
            {
               buffstr = "Hell Imprisonment";
            }
            else if(bufftype == StatsManager.BUFF_INJURED)
            {
               buffstr = "Injured";
            }
            else if(bufftype == StatsManager.BUFF_MODERATOR)
            {
               buffstr = "Moderator";
            }
            this.bufftext.visible = true;
            this.bufftext.htmlText = buffstr + " <font color=\'#FFFFFF\'>" + this.getTimeString(duration) + "</font>";
         }
      }
      
      internal function getTimeString(totalSecs:int) : String
      {
         var secStr:String = null;
         var minStr:String = null;
         var secs:int = totalSecs % 60;
         var temp:int = (totalSecs - secs) / 60;
         var mins:int = temp % 60;
         var hours:int = (temp - mins) / 60;
         if(secs < 10)
         {
            secStr = "0" + secs.toString();
         }
         else
         {
            secStr = secs.toString();
         }
         if(mins < 10)
         {
            minStr = "0" + mins.toString();
         }
         else
         {
            minStr = mins.toString();
         }
         if(hours == 0)
         {
            return minStr + ":" + secStr;
         }
         return hours + ":" + minStr + ":" + secStr;
      }
      
      public function updateAPtext(ap:int, apmax:int) : *
      {
         this.overworldHUD_ap.APtext.text = ap + " / " + apmax;
         this.overworldHUD_ap.APtextshadow.text = ap + " / " + apmax;
         if(ap == apmax || GameEngine.isPvPRoomMode())
         {
            this.overworldHUD_ap.getAPButton.visible = false;
         }
         else
         {
            this.overworldHUD_ap.getAPButton.visible = true;
         }
      }
      
      public function updateHpChi(hp:int, maxhp:int, chi:int, maxchi:int) : *
      {
         if(hp > maxhp)
         {
            hp = maxhp;
         }
         this.bustUI.hptext.text = hp + " / " + maxhp;
         this.bustUI.hptextshadow.text = hp + " / " + maxhp;
         this.bustUI.hpbar.bar.scaleX = hp / maxhp;
         if(chi > maxchi)
         {
            chi = maxchi;
         }
         this.bustUI.chitext.text = chi + " / " + maxchi;
         this.bustUI.chitextshadow.text = chi + " / " + maxchi;
         this.bustUI.chibar.bar.scaleX = chi / maxchi;
         if(hp == maxhp && chi == maxchi || StatsManager.getLevel() == 1)
         {
            this.bustUI.getHPButton.visible = false;
         }
         else
         {
            this.bustUI.getHPButton.visible = true;
         }
      }
      
      public function updateEXP(percentage:Number) : *
      {
         if(StatsManager.getLevel() >= StatsManager.levelCap)
         {
            percentage = 1;
         }
         this.overworldHUD_xp.EXPbar.bar.scaleX = percentage;
      }
      
      public function updateEXPtext(exp:int, expthreshold:int) : *
      {
         if(StatsManager.getLevel() < StatsManager.levelCap)
         {
            this.overworldHUD_xp.EXPtext.text = exp + " / " + expthreshold;
            this.overworldHUD_xp.EXPtextshadow.text = this.overworldHUD_xp.EXPtext.text;
         }
         else
         {
            this.overworldHUD_xp.EXPtext.text = exp + " / " + exp;
            this.overworldHUD_xp.EXPtextshadow.text = this.overworldHUD_xp.EXPtext.text;
         }
      }
      
      public function updateLeveltext(level:int) : *
      {
         this.overworldHUD_xp.Leveltext.text = String(level);
      }
      
      public function updateGGoldText(gold:int) : *
      {
         this.info.coinstext.text = String(gold);
         if(StatsManager.isCoinPurseFull())
         {
            this.info.getCoinsButton.visible = false;
         }
         else
         {
            this.info.getCoinsButton.visible = true;
         }
      }
      
      public function updateHGoldText(gold:int) : *
      {
         this.info.goldtext.text = String(gold);
      }
      
      public function updateTokenText(num:int) : *
      {
         if(this.playerPanelDisplay.visible)
         {
            this.playerPanelDisplay.tokenText.text = String(num);
         }
      }
      
      public function updateTokenTimer(duration:String) : *
      {
         if(this.playerPanelDisplay.visible)
         {
            this.playerPanelDisplay.DTTimer.text = duration;
            this.playerPanelDisplay.DTTimerShadow.text = duration;
         }
         if(this.duelmodeUI.visible && this.duelmodeUI.DTTimer.text != duration)
         {
            this.duelmodeUI.DTTimer.text = duration;
         }
      }
      
      public function updateBustText(str:String) : *
      {
         this.bustUI.locationtext.text = str;
      }
      
      public function showInfoBustButtons(flag:Boolean) : *
      {
         this.info.visible = flag;
         this.overworldHUD_ap.visible = flag;
         this.overworldHUD_xp.visible = flag;
         this.bustUI.visible = flag;
         this.showButtons(flag);
         if(!flag)
         {
            this.nodeUI.visible = false;
         }
         if(GameEngine.isAdventureMode())
         {
            this.showChatButton(flag);
            this.territorymap.visible = flag;
            this.minimap.visible = false;
            this.key.visible = false;
         }
         this.showItemUI.visible = false;
      }
      
      internal function showButtons(flag:Boolean) : *
      {
         var side:int = 0;
         this.chatButton.visible = flag;
         this.playerStatsButton.visible = flag;
         this.playerSkillsButton.visible = flag;
         this.duelmodeButton.visible = flag;
         this.playerQuestLogButton.visible = flag;
         this.warButtonCustom.visible = flag;
         this.shopButton.visible = flag;
         this.optionsButton.visible = flag;
         this.buttonsBar.visible = flag;
         if(flag)
         {
            this.hasStatPointMark.visible = StatsManager.getStat(StatsManager.STAT_STATPOINTS) > 0;
            this.hasSkillPointMark.visible = StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) > 0;
            this.hasWarMoveMark.visible = StatsManager.getSide() != 0 && StatsManager.getPlayerStats(StatsManager.STAT_WARMOVES) > 0;
         }
         else
         {
            this.hasStatPointMark.visible = false;
            this.hasSkillPointMark.visible = false;
            this.hasWarMoveMark.visible = false;
            this.bufftext.visible = false;
         }
         this.warButton.visible = false;
         this.warButtonRed.visible = false;
         this.warButtonGreen.visible = false;
         this.warButtonBlue.visible = false;
         this.warButtonYellow.visible = false;
         this.warButtonBlack.visible = false;
         this.warButtonCustom.visible = false;
         if(flag)
         {
            side = StatsManager.getSide();
            if(side == 0)
            {
               this.warButton.visible = true;
            }
            else if(side == 1)
            {
               this.warButtonRed.visible = true;
            }
            else if(side == 2)
            {
               this.warButtonGreen.visible = true;
            }
            else if(side == 3)
            {
               this.warButtonBlue.visible = true;
            }
            else if(side == 4)
            {
               this.warButtonYellow.visible = true;
            }
            else if(side == 5)
            {
               this.warButtonBlack.visible = true;
            }
            else
            {
               this.warButtonCustom.visible = true;
            }
         }
      }
      
      public function showBustButtons(flag:Boolean) : *
      {
         this.bustUI.visible = flag;
         this.showButtons(flag);
         if(!flag)
         {
            this.nodeUI.visible = false;
         }
         if(GameEngine.isAdventureMode())
         {
            this.showChatButton(flag);
         }
      }
      
      public function showPVPNormalMode() : *
      {
         this.info.visible = false;
         this.overworldHUD_ap.visible = true;
         this.overworldHUD_xp.visible = false;
         this.bustUI.visible = false;
         this.showButtons(false);
         this.showNodeUI(true);
         this.nodeUI.scaleX = 1;
         this.nodeUI.scaleY = 1;
      }
      
      public function showPVPChatMode() : *
      {
         this.info.visible = false;
         this.overworldHUD_ap.visible = false;
         this.overworldHUD_xp.visible = false;
         this.bustUI.visible = false;
         this.showButtons(false);
         this.showNodeUI(true);
         this.nodeUI.scaleX = 0.85;
         this.nodeUI.scaleY = 0.85;
      }
      
      public function showChatButton(flag:Boolean) : *
      {
         this.chatButton.visible = flag;
         this.chatText.visible = false;
      }
      
      public function onChatMode(mouseEvent:MouseEvent) : *
      {
         ++this.chatMode;
         if(this.chatMode == 3 || this.chatMode == 2 && StatsManager.getSide() == 0)
         {
            this.chatMode = 0;
         }
         if(this.chatMode == 0)
         {
            this.chatText.chatModeButton.setText(LangManager.getString(419));
         }
         else if(this.chatMode == 1)
         {
            this.chatText.chatModeButton.setText(LangManager.getString(420));
         }
         else if(this.chatMode == 2)
         {
            this.chatText.chatModeButton.setText(LangManager.getString(421));
         }
         StatsManager.chatMode = this.chatMode;
      }
      
      public function updateChatLog(speaker:String, words:String, color:String = "") : *
      {
         var firstChar:String = null;
         var restOfString:String = null;
         var strArray:Array = null;
         if(speaker + words == this.previouswords)
         {
            return;
         }
         this.previouswords = speaker + words;
         if(StatsManager.hasChatNotification)
         {
            if(InputManager.isDisabled())
            {
               SoundManager.instance.playSlash();
            }
         }
         if(speaker == "")
         {
            if(color != "")
            {
               this.chatText.chatlog.htmlText += "<b><font color=\'" + color + "\'>" + words + "</font></b>";
            }
            else
            {
               this.chatText.chatlog.htmlText += "<b>" + words + "</b>";
            }
         }
         else
         {
            firstChar = speaker.substr(0,1);
            restOfString = speaker.substr(1,speaker.length);
            speaker = firstChar.toUpperCase() + restOfString;
            if(color != "")
            {
               this.chatText.chatlog.htmlText += "<b><font color=\'" + color + "\'>" + speaker + ":   " + words + "</font></b>";
            }
            else
            {
               this.chatText.chatlog.htmlText += "<b>" + speaker + ":   " + words + "</b>";
            }
         }
         if(this.chatText.chatlog.numLines > 50)
         {
            strArray = this.chatText.chatlog.htmlText.split("</P>");
            strArray.splice(0,1);
            this.chatText.chatlog.htmlText = strArray.join("</P>") + "</P>";
         }
         if(this.chatText.chatlog.numLines > 10)
         {
            this.chatText.chatlog.scrollV = this.chatText.chatlog.maxScrollV;
         }
      }
      
      public function updateChatLogWordsOnly(words:String, color:String = "") : *
      {
         var strArray:Array = null;
         if(color != "")
         {
            this.chatText.chatlog.htmlText += "<b><font color=\'" + color + "\'>" + words + "</font></b>";
         }
         else
         {
            this.chatText.chatlog.htmlText += "<b>" + words + "</b>";
         }
         if(this.chatText.chatlog.numLines > 50)
         {
            strArray = this.chatText.chatlog.htmlText.split("</P>");
            strArray.splice(0,1);
            this.chatText.chatlog.htmlText = strArray.join("</P>") + "</P>";
         }
         if(this.chatText.chatlog.numLines > 10)
         {
            this.chatText.chatlog.scrollV = this.chatText.chatlog.maxScrollV;
         }
      }
      
      public function clearChatLog() : *
      {
         this.chatText.chatlog.htmlText = "";
      }
      
      public function updateChatLogConnected(speaker:String) : *
      {
         var strArray:Array = null;
         this.chatText.chatlog.htmlText += "<b>" + speaker + " connected</b>";
         if(this.chatText.chatlog.numLines > 50)
         {
            strArray = this.chatText.chatlog.htmlText.split("</P>");
            strArray.splice(0,1);
            this.chatText.chatlog.htmlText = strArray.join("</P>") + "</P>";
         }
         if(this.chatText.chatlog.numLines > 10)
         {
            this.chatText.chatlog.scrollV = this.chatText.chatlog.maxScrollV;
         }
      }
      
      public function showPlayerPanel(enemyPlayer:EnemyPlayer) : *
      {
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         this.playerPanelDisplay.show(enemyPlayer.charname,enemyPlayer.level,enemyPlayer.equipmentStr,enemyPlayer.id.toString(),enemyPlayer.side);
      }
      
      public function getPlayerPanel() : PlayerPanel
      {
         return this.playerPanelDisplay;
      }
      
      public function getAdventureModeItem() : AdventureItem
      {
         return this.adventureModeItem;
      }
      
      public function showAdventureModeItem() : *
      {
         this.adventureModeItem.visible = true;
         this.adventureModeItem.buttonMode = true;
         this.adventureModeItem.addEventListeners();
         this.adventureModeItem.addEventListener(MouseEvent.CLICK,this.onShowMiniInventory);
      }
      
      public function hideAdventureModeItem() : *
      {
         this.adventureModeItem.visible = false;
         this.adventureModeItem.buttonMode = true;
         this.adventureModeItem.removeEventListeners();
         this.adventureModeItem.removeEventListener(MouseEvent.CLICK,this.onShowMiniInventory);
      }
      
      public function onShowMiniInventory(mouseevent:MouseEvent) : *
      {
         this.miniInventory.show();
         InputManager.disableInput();
         StatsManager.getPlayer().stopMoving();
         this.showInfoBustButtons(false);
         this.showChatButton(false);
         this.showNodeUI(false);
      }
      
      internal function onShowChat(event:Event) : *
      {
         this.chatText.visible = !this.chatText.visible;
         StatsManager.setChatShowing(this.chatText.visible);
         if(this.chatText.visible)
         {
            this.chatText.words.text = LangManager.getString(184);
            GameEngine.getStageMC().focus = this.chatText.words;
            this.chatText.words.setSelection(0,this.chatText.words.text.length);
            this.chatMode = StatsManager.chatMode - 1;
            this.onChatMode(null);
            this.clearItemInChat();
         }
      }
      
      internal function onChatClick(mouseEvent:MouseEvent) : *
      {
         mouseEvent.stopPropagation();
         if(this.chatText.words.text == LangManager.getString(184))
         {
            this.chatText.words.text = "";
         }
      }
      
      internal function onChatTextKeyUp(keyboardEvent:KeyboardEvent) : *
      {
         if(this.chatText.words.text == "")
         {
            this.clearItemInChat();
         }
         if(keyboardEvent.keyCode == 13)
         {
            this.processChat();
         }
      }
      
      internal function onChatEnterButtonClick(mouseEvent:MouseEvent) : *
      {
         if(this.chatText.words.text != LangManager.getString(184))
         {
            this.processChat();
         }
         GameEngine.getStageMC().focus = this.chatText.words;
      }
      
      public function showItemInChat(item:Item) : *
      {
         var key:String = null;
         var hasDuplicate:Boolean = false;
         var max:int = 0;
         var i:int = 0;
         if(!this.chatText.visible)
         {
            this.onShowChat(null);
            this.chatText.words.text = "";
         }
         if(this.chatText.words.text == LangManager.getString(184))
         {
            this.chatText.words.text = "";
         }
         key = item.getPlainName();
         var keyCounter:int = -1;
         do
         {
            hasDuplicate = false;
            keyCounter++;
            max = int(this.chatKeyArray.length);
            for(i = 0; i < max; i++)
            {
               if(keyCounter == 0 && this.chatKeyArray[i] == "[" + key + "]" || keyCounter > 0 && this.chatKeyArray[i] == "[" + key + keyCounter + "]")
               {
                  hasDuplicate = true;
                  break;
               }
            }
         }
         while(hasDuplicate);
         if(keyCounter == 0)
         {
            this.chatKeyArray.push("[" + key + "]");
            this.chatText.words.appendText("[" + key + "] ");
         }
         else
         {
            this.chatKeyArray.push("[" + key + keyCounter + "]");
            this.chatText.words.appendText("[" + key + keyCounter + "] ");
         }
         this.chatItemArray.push(item.toStringNoQty());
         this.hasItemInChat = true;
         GameEngine.getStageMC().focus = this.chatText.words;
         this.chatText.words.setSelection(this.chatText.words.text.length,this.chatText.words.text.length);
      }
      
      internal function clearItemInChat() : *
      {
         this.hasItemInChat = false;
         this.chatKeyArray.length = 0;
         this.chatItemArray.length = 0;
      }
      
      internal function handleChatLogLink(evt:TextEvent) : *
      {
         var str:String = evt.text;
         var evttype:String = str.slice(0,5);
         var evtdata:String = str.slice(5);
         if(evttype == "[ITM]")
         {
            this.showShowItemUI(Item.parseNoQty(evtdata));
         }
      }
      
      internal function processChat() : *
      {
         var nodeid:int = 0;
         var step:* = 0;
         var territory:Point = null;
         var tx:int = 0;
         var ty:int = 0;
         var k:int = 0;
         var j:int = 0;
         var roomidx:int = 0;
         var roomidy:int = 0;
         var roomobjstr:String = null;
         var introStr:String = null;
         var posx:int = 0;
         var territoryData:TerritoryData = null;
         var item:Item = null;
         var nodeXML:XMLWorldNode = null;
         var roomData:Array = null;
         var helptext:String = null;
         var censoredWords:String = null;
         var color:String = null;
         var sayWords:String = null;
         var dice:int = 0;
         var sitanim:String = null;
         var itemrs:Item = null;
         var tteleportx:int = 0;
         var tteleporty:int = 0;
         var tterritory:Point = null;
         var connInvite:ConnectionPIO = null;
         var max:int = 0;
         var i:int = 0;
         var str:String = null;
         var side:int = 0;
         if(this.chatText.words.text == LangManager.getString(184))
         {
            this.chatText.words.text = "";
            return;
         }
         var strArray:Array = this.chatText.words.text.split(" ");
         if(StatsManager.consoleEnabled)
         {
            if(strArray[0] == "/giveitem")
            {
               if(strArray.length == 1)
               {
                  this.lootDialog.addLootItem(strArray[1],strArray[2],1);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               else if(strArray.length == 2)
               {
                  this.lootDialog.addLootItem(strArray[1],StatsManager.getLevel(),1);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/giverareitem")
            {
               if(strArray.length == 3)
               {
                  this.lootDialog.addRareLootItem(strArray[1],strArray[2],1);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               else if(strArray.length == 2)
               {
                  this.lootDialog.addRareLootItem(strArray[1],StatsManager.getLevel(),1);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/givelegendaryitem")
            {
               if(strArray.length == 3)
               {
                  this.lootDialog.addRareLootItem(strArray[1],strArray[2],1,true);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               else if(strArray.length == 2)
               {
                  this.lootDialog.addRareLootItem(strArray[1],StatsManager.getLevel(),1,true);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/giverandomrareitem")
            {
               if(strArray.length == 2)
               {
                  this.lootDialog.addRandomLootItem(strArray[1],true,true);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               else if(strArray.length == 1)
               {
                  this.lootDialog.addRandomLootItem(StatsManager.getLevel(),true,true);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/giverandomlegendaryitem")
            {
               if(strArray.length == 2)
               {
                  this.lootDialog.addRandomLootItem(strArray[1],true,true,true);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               else if(strArray.length == 1)
               {
                  this.lootDialog.addRandomLootItem(StatsManager.getLevel(),true,true,true);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/setlevel")
            {
               if(strArray.length == 2)
               {
                  StatsManager.setStat(9,StatsManager.expArray[int(strArray[1]) - 1] - 1);
                  StatsManager.changeXP(1);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/changestat")
            {
               if(strArray.length == 3)
               {
                  StatsManager.changeStat(strArray[1],strArray[2]);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/setstat")
            {
               if(strArray.length == 3)
               {
                  StatsManager.setStat(strArray[1],strArray[2]);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/setquest")
            {
               if(strArray.length == 3)
               {
                  step = int(strArray[2]);
                  if(step > 0)
                  {
                     step--;
                  }
                  StatsManager.setActiveQuest(strArray[1],step);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/setdate")
            {
               if(strArray.length == 2)
               {
                  QueryManager.instance.serverDate = int(strArray[1]);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/teleport")
            {
               if(strArray.length == 6)
               {
                  nodeid = (int(strArray[1]) + 341 - WarSelectUI.DTERRSHIFTX) * 6 + int(strArray[3]) << 12 | (int(strArray[2]) + 341 - WarSelectUI.DTERRSHIFTY) * 6 + int(strArray[4]);
                  this.screenTransition.setTeleportTarget(nodeid,strArray[5]);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               if(strArray.length == 5)
               {
                  nodeid = (int(strArray[1]) + 341 - WarSelectUI.DTERRSHIFTX) * 6 + int(strArray[3]) << 12 | (int(strArray[2]) + 341 - WarSelectUI.DTERRSHIFTY) * 6 + int(strArray[4]);
                  this.screenTransition.setTeleportTarget(nodeid);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               else if(strArray.length == 4)
               {
                  nodeid = int(strArray[1]) + 2047 << 12 | int(strArray[2]) + 2047;
                  this.screenTransition.setTeleportTarget(nodeid,strArray[3]);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               else if(strArray.length == 3)
               {
                  nodeid = int(strArray[1]) + 2047 << 12 | int(strArray[2]) + 2047;
                  this.screenTransition.setTeleportTarget(nodeid);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               else if(strArray.length == 2)
               {
                  this.screenTransition.setTeleportTarget(strArray[1]);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/tteleport")
            {
               if(strArray.length == 3)
               {
                  nodeid = (int(strArray[1]) + 341 - WarSelectUI.DTERRSHIFTX) * 6 << 12 | (int(strArray[2]) + 341 - WarSelectUI.DTERRSHIFTY) * 6;
                  territory = NodeGenerator.instance.getTerritory(nodeid);
                  nodeid = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false).getTown();
                  if(nodeid == -1)
                  {
                     nodeid = (int(strArray[1]) + 341 - WarSelectUI.DTERRSHIFTX) * 6 << 12 | (int(strArray[2]) + 341 - WarSelectUI.DTERRSHIFTY) * 6;
                  }
                  this.screenTransition.setTeleportTarget(nodeid);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               else if(strArray.length == 2)
               {
                  nodeid = int(strArray[1]);
                  tx = nodeid >> 12 & 0x0FFF;
                  ty = nodeid & 0x0FFF;
                  nodeid = tx * 6 << 12 | ty * 6;
                  this.screenTransition.setTeleportTarget(nodeid);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
               }
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/whereis")
            {
               if(strArray.length == 2)
               {
                  territory = null;
                  for(k = 0; k < 5; k++)
                  {
                     for(j = 0; j < 70; j++)
                     {
                        if(strArray[1] == NameGenerator.instance.getPlaceName(j + 341 << 12 | k + 341))
                        {
                           territory = new Point(j,k);
                        }
                     }
                  }
                  if(territory != null)
                  {
                     this.chatText.words.text = "territory (" + (territory.x + WarSelectUI.DTERRSHIFTX) + "," + (territory.y + -WarSelectUI.DTERRSHIFTY) + ")";
                  }
               }
               return;
            }
            if(strArray[0] == "/givequestitem")
            {
               this.lootDialog.addSpecialItem(QuestGenerator.instance.getNPCLatestQuestItem(false));
               this.lootDialog.notifyDontRefreshAfter();
               this.lootDialog.show();
               this.chatText.words.text = "";
               QuestGenerator.instance.checkSetReturnMarkedNode();
               return;
            }
            if(strArray[0] == "/givetradequestitem")
            {
               this.lootDialog.addSpecialItem(QuestGenerator.instance.getNPCLatestQuestItem(true));
               this.lootDialog.notifyDontRefreshAfter();
               this.lootDialog.show();
               this.chatText.words.text = "";
               QuestGenerator.instance.checkSetReturnMarkedNode();
               return;
            }
            if(strArray[0] == "/replay")
            {
               if(strArray.length == 2)
               {
                  QueryManager.instance.getReplay(strArray[1]);
               }
               else
               {
                  NetworkManager.instance.runRecording();
               }
               return;
            }
            if(strArray[0] == "/noaggro")
            {
               StatsManager.noAggro = true;
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/aggro")
            {
               StatsManager.noAggro = false;
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/worldsim" && strArray.length == 2)
            {
               NetworkManager.instance.triggerWorldSim(strArray[1]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/warcron" && strArray.length == 2)
            {
               NetworkManager.instance.triggerWarCron(strArray[1]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/disableconsole")
            {
               StatsManager.consoleEnabled = false;
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/getterritoryid")
            {
               this.chatText.words.text = NodeGenerator.instance.getTerritoryId(StageManager.getCurrentNode()).toString();
               return;
            }
            if(strArray[0] == "/getnodeid")
            {
               this.chatText.words.text = StageManager.getCurrentNode().toString();
               return;
            }
            if(strArray[0] == "/getnodelevel")
            {
               this.chatText.words.text = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode());
               return;
            }
            if(strArray[0] == "/getroomid")
            {
               roomidx = StageManager.getCurrentRoom() >> 8 & 0xFF;
               roomidy = StageManager.getCurrentRoom() & 0xFF;
               this.chatText.words.text = StageManager.getCurrentRoom().toString() + ": " + roomidx + "," + roomidy;
               return;
            }
            if(strArray[0] == "/getroomwidth")
            {
               this.chatText.words.text = StageManager.getGameStage().getGameStageWidth().toString();
               return;
            }
            if(strArray[0] == "/getpos")
            {
               this.chatText.words.text = StatsManager.getPlayer().posX;
               return;
            }
            if(strArray[0] == "/getroomobjects")
            {
               this.chatText.words.text = "";
               roomobjstr = QuestEngine.getNodeData(StageManager.getCurrentNode()).getRoomData(true)[StageManager.getCurrentRoom()].getObjectList().toString();
               this.updateChatLog("Room Objects",roomobjstr);
               trace(roomobjstr);
               return;
            }
            if(strArray[0] == "/changesex")
            {
               this.chatText.words.text = "";
               StatsManager.changeSex();
               return;
            }
            if(strArray[0] == "/clearquests")
            {
               this.chatText.words.text = "";
               StatsManager.completedQuestList.fixed = false;
               StatsManager.completedQuestList.length = 0;
               StatsManager.completedQuestList.fixed = true;
               StatsManager.activeQuestList.fixed = false;
               StatsManager.activeQuestList.length = 0;
               StatsManager.activeQuestList.fixed = true;
               return;
            }
            if(strArray[0] == "/dropall")
            {
               this.chatText.words.text = "";
               StatsManager.inventory.fixed = false;
               StatsManager.inventory.length = 0;
               StatsManager.inventory.fixed = true;
               StatsManager.questItems.fixed = false;
               StatsManager.questItems.length = 0;
               StatsManager.questItems.fixed = true;
               return;
            }
            if(strArray[0] == "/testcutscene")
            {
               introStr = "<intro><dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Testing cutscene</text></dialogue></intro>";
               return;
            }
            if(strArray[0] == "/whereisplayer" && strArray.length == 2)
            {
               this.chatText.words.text = "";
               QueryManager.instance.getPlayerLocation(strArray[1]);
               return;
            }
            if(strArray[0] == "/teleportplayer" && strArray.length == 2)
            {
               NetworkManager.instance.teleportPlayer(strArray[1],StageManager.getCurrentNode(),StageManager.getCurrentRoom());
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/buffplayer" && strArray.length == 4)
            {
               NetworkManager.instance.buffPlayer(strArray[1],strArray[2],strArray[3]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/muteplayer" && strArray.length == 2)
            {
               NetworkManager.instance.buffPlayer(strArray[1],StatsManager.BUFF_MUTE,3600);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/fullmuteplayer" && strArray.length == 2)
            {
               NetworkManager.instance.buffPlayer(strArray[1],StatsManager.BUFF_FULLMUTE,3600);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/kickplayer" && strArray.length == 2)
            {
               NetworkManager.instance.kickPlayer(strArray[1]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/banplayer" && strArray.length == 3)
            {
               NetworkManager.instance.banPlayer(strArray[1],strArray[2]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/whois" && strArray.length == 2)
            {
               QueryManager.instance.whois(strArray[1]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/createroomobject" && strArray.length == 4)
            {
               posx = StatsManager.getPlayer().getMapPosition();
               if(strArray[1] == 9)
               {
                  if(StatsManager.getPlayer().getMCS().isFacingRight())
                  {
                     posx += 200;
                  }
                  else
                  {
                     posx -= 200;
                  }
               }
               NetworkManager.instance.createRoomObject(strArray[1],posx,StageManager.getPlayer().getMCS().y,strArray[2],strArray[3]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/removeroomobject" && strArray.length == 2)
            {
               NetworkManager.instance.removeRoomObject(strArray[1]);
               this.chatText.words.text = "";
               return;
            }
            if(strArray[0] == "/recall")
            {
               if(StatsManager.getLevel() < 3 || StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
               {
                  this.showDialog(LangManager.getString(714),LangManager.getString(5));
                  return;
               }
               territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
               territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
               if(!(Boolean(StageManager.getCurrentRoom() == 0) || Boolean(territoryData.isTown(StageManager.getCurrentNode()) && !territoryData.isAbandonedTown() && !territoryData.territoryAtWar()) || Boolean(territoryData.isDojo(StageManager.getCurrentNode()))))
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(714),LangManager.getString(5));
                  return;
               }
               territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
               nodeid = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false).getDojo();
               OverworldHUD.getInstance().screenTransition.setTeleportTarget(nodeid,0,400);
               OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
            }
            else
            {
               if(strArray[0] == "/createrecallstone")
               {
                  item = new Item(2129,1);
                  item.addModifier(102,StageManager.getCurrentNode());
                  this.lootDialog.addSpecialItem(item);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
                  this.chatText.words.text = "";
                  return;
               }
               if(strArray[0] == "/breakweapon")
               {
                  StatsManager.breakEquippedWeapon();
                  this.chatText.words.text = "";
                  return;
               }
               if(strArray[0] == "/sharedueltv")
               {
                  QueryManager.instance.shareDuelTV();
                  this.chatText.words.text = "";
                  return;
               }
               if(strArray[0] == "/enablechikako")
               {
                  StatsManager.addActiveQuests(20);
                  StatsManager.completeQuest(20);
                  this.chatText.words.text = "";
                  return;
               }
               if(strArray[0] == "/showbank")
               {
                  this.onShowBank();
                  this.chatText.words.text = "";
                  return;
               }
               if(strArray[0] == "/forgesword" && strArray.length == 2)
               {
                  OverworldHUD.instance.lootDialog.addRandomSword(strArray[1]);
                  OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
                  OverworldHUD.instance.lootDialog.show();
               }
               else if(strArray[0] == "/refund" && strArray.length == 2)
               {
                  OverworldHUD.instance.showChikakoRefund();
               }
               else
               {
                  if(strArray[0] == "/createredeemcode" && strArray.length == 4)
                  {
                     NetworkManager.instance.createRedeemCode(int(strArray[1]),int(strArray[2]),strArray[3]);
                     this.chatText.words.text = "";
                     return;
                  }
                  if(strArray[0] == "/testbg" && strArray.length == 2)
                  {
                     nodeXML = QuestEngine.getNodeData(0);
                     roomData = nodeXML.getRoomData();
                     roomData[0].bg = int(strArray[1]);
                     this.screenTransition.setTeleportTarget(0,0);
                     this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                     return;
                  }
                  if(strArray[0] == "/help")
                  {
                     helptext = "\n/giveitem [itemid] [level]";
                     helptext += "\n/giverareitem [itemid] [level]";
                     helptext += "\n/giverandomrareitem [level]";
                     helptext += "\n/givelegendaryitem [itemid] [level]";
                     helptext += "\n/giverandomlegendaryitem [level]";
                     helptext += "\n/changestat [statid] [value]";
                     helptext += "\n/setstat [statid] [value]";
                     helptext += "\n/setquest [questid] [step]";
                     helptext += "\n/setdate [date]";
                     helptext += "\n/teleport [territoryx] [territoryy] [nodex] [nodey] [room]";
                     helptext += "\n/tteleport [territoryx] [territoryy]";
                     helptext += "\n/setlevel [level]";
                     helptext += "\n/givequestitem";
                     helptext += "\n/givetradequestitem";
                     helptext += "\n/clearquests";
                     helptext += "\n/getterritoryid";
                     helptext += "\n/getpos";
                     helptext += "\n/getnodeid";
                     helptext += "\n/getroomid";
                     helptext += "\n/getroomwidth";
                     helptext += "\n/getroomobjects";
                     helptext += "\n/getnodelevel";
                     helptext += "\n/whereis [territoryname]";
                     helptext += "\n/whois [playername]";
                     helptext += "\n/whereisplayer [playername]";
                     helptext += "\n/teleportplayer [playername]";
                     helptext += "\n/kickplayer [playername]";
                     helptext += "\n/banplayer [playername] [pass]";
                     helptext += "\n/createredeemcode [itemid] [redeemtimes] [pass]";
                     helptext += "\n/muteplayer [playername]";
                     helptext += "\n/fullmuteplayer [playername]";
                     helptext += "\n/buffplayer [playername] [buff] [duration]";
                     helptext += "\n/showallonline";
                     helptext += "\n/createroomobject [objid] [props] [objname]";
                     helptext += "\n/removeroomobject [objname]";
                     helptext += "\n/changesex";
                     helptext += "\n/createrecallstone";
                     helptext += "\n/breakweapon";
                     helptext += "\n/enablechikako";
                     helptext += "\n/showbank";
                     helptext += "\n/forgesword [level]";
                     helptext += "\n/noaggro";
                     helptext += "\n/aggro";
                     helptext += "\n/warcron [pass]";
                     helptext += "\n/worldsim [pass]";
                     helptext += "\n/disableconsole";
                     helptext += "\n/enableconsole";
                     this.updateChatLog("Help",helptext);
                     this.chatText.words.text = "";
                     return;
                  }
               }
            }
            return;
         }
         switch(strArray[0])
         {
            case LangManager.getString(184):
               break;
            case "/bow":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.BOW2);
                  NetworkManager.instance.playerEmote(MCSActor.BOW2);
               }
               break;
            case "/kneel":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.KNEEL);
                  NetworkManager.instance.playerEmote(MCSActor.KNEEL);
               }
               break;
            case "/sit":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     sitanim = MCSActor.SIT;
                  }
                  else if(dice == 1)
                  {
                     sitanim = MCSActor.SIT2;
                  }
                  else if(dice == 2)
                  {
                     sitanim = MCSActor.SIT3;
                  }
                  StatsManager.getPlayer().startAnim(sitanim);
                  NetworkManager.instance.playerEmote(sitanim);
               }
               break;
            case "/rest":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.LIEDOWN);
                  NetworkManager.instance.playerEmote(MCSActor.LIEDOWN);
               }
               break;
            case "/seppuku":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.SEPPUKU_START);
                  NetworkManager.instance.playerEmote(MCSActor.SEPPUKU_START);
               }
               break;
            case "/stand":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.IDLE_SHEATHED);
                  NetworkManager.instance.playerEmote(MCSActor.IDLE_SHEATHED);
               }
               break;
            case "/shoulderweapon":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.SHOULDERWEAPON);
                  NetworkManager.instance.playerEmote(MCSActor.SHOULDERWEAPON);
               }
               break;
            case "/gangnamstyle":
               if(StatsManager.getPlayer().canChangeStance())
               {
                  StatsManager.getPlayer().startAnim(MCSActor.GANGNAM);
                  NetworkManager.instance.playerEmote(MCSActor.GANGNAM);
                  NetworkManager.instance.chat("oppa gangnam style",1);
                  SoundManager.instance.playMusic(MusicManager.MUSIC_GANGNAM);
               }
               break;
            case "/fart":
               SoundManager.instance.playFart();
               NetworkManager.instance.playerEmote("fart");
               break;
            case "/recall":
               if(StatsManager.getLevel() < 3 || StageManager.getRoomPrivate() == 8)
               {
                  this.showDialog(LangManager.getString(714),LangManager.getString(5));
                  return;
               }
               territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
               territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
               if(Boolean(StageManager.getCurrentRoom() == 0) || Boolean(territoryData.isTown(StageManager.getCurrentNode()) && !territoryData.isAbandonedTown()) || Boolean(territoryData.isDojo(StageManager.getCurrentNode())))
               {
                  territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
                  nodeid = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false).getDojo();
                  OverworldHUD.getInstance().screenTransition.setTeleportTarget(nodeid,0,400);
                  OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                  break;
               }
               OverworldHUD.instance.showDialog(LangManager.getString(714),LangManager.getString(5));
               return;
               break;
            case "/enableconsole":
               if(strArray.length == 2)
               {
                  if(StatsManager.impersonateUser || StatsManager.charname == "admin")
                  {
                     if(strArray[1] == "dragon")
                     {
                        StatsManager.consoleEnabled = true;
                        this.chatText.words.text = "";
                     }
                  }
               }
               break;
            case "/hidehud":
               this.initForCutscene(false);
               this.chatText.visible = false;
               break;
            case "/ally":
               if(strArray.length == 2)
               {
                  NPCManager.addAlly(strArray[1]);
                  OverworldHUD.instance.updateChatLogWordsOnly(NPCManager.getAllyListString());
               }
               break;
            case "/stopally":
               if(strArray.length == 2)
               {
                  NPCManager.removeAlly(strArray[1]);
                  OverworldHUD.instance.updateChatLogWordsOnly(NPCManager.getAllyListString());
               }
               break;
            case "/showally":
               OverworldHUD.instance.updateChatLogWordsOnly(NPCManager.getAllyListString());
               break;
            case "/muteplayer":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR) && strArray.length == 2)
               {
                  NetworkManager.instance.buffPlayer(strArray[1],StatsManager.BUFF_MUTE,3600);
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/fullmuteplayer":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR) && strArray.length == 2)
               {
                  NetworkManager.instance.buffPlayer(strArray[1],StatsManager.BUFF_FULLMUTE,3600);
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/whois":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR) && strArray.length == 2)
               {
                  QueryManager.instance.whois(strArray[1]);
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/waterfall":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
               {
                  OverworldHUD.getInstance().screenTransition.setTeleportTarget(8427578,0,150);
                  OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/createrecallstone":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
               {
                  itemrs = new Item(2129,1);
                  itemrs.addModifier(102,StageManager.getCurrentNode());
                  this.lootDialog.addSpecialItem(itemrs);
                  this.lootDialog.notifyDontRefreshAfter();
                  this.lootDialog.show();
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/showallonline":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
               {
                  QueryManagerPIO.instance.showAllOnline();
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/tteleport":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR) && strArray.length == 3 && StatsManager.getStat(StatsManager.EQ_ARMOR + 50) == 4085)
               {
                  tteleportx = int(strArray[1]) + 341 - WarSelectUI.DTERRSHIFTX;
                  tteleporty = int(strArray[2]) + 341 - WarSelectUI.DTERRSHIFTY;
                  if(QuestEngine.hasTerritory(tteleportx,tteleporty))
                  {
                     nodeid = tteleportx * 6 << 12 | tteleporty * 6;
                     tterritory = NodeGenerator.instance.getTerritory(nodeid);
                     nodeid = NodeGenerator.instance.getTerritoryData(tterritory.x,tterritory.y,false).getTown();
                     if(nodeid == -1)
                     {
                        nodeid = tteleportx * 6 << 12 | tteleporty * 6;
                     }
                     this.screenTransition.setTeleportTarget(nodeid);
                     this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                     QueryManager.instance.logMessage(this.chatText.words.text);
                     this.chatText.words.text = "";
                  }
                  else
                  {
                     this.chatText.words.text = "Destination is in the sea";
                  }
               }
               break;
            case "/sendtohell":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR) && strArray.length == 2 && StatsManager.getStat(StatsManager.EQ_WEAPON + 50) == 13030)
               {
                  NetworkManager.instance.buffPlayer(strArray[1],StatsManager.BUFF_HELL,86400);
                  NetworkManager.instance.teleportPlayer(strArray[1],666,0);
                  QueryManager.instance.logMessage(this.chatText.words.text);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/gotohell":
               if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR) && StatsManager.getStat(StatsManager.EQ_WEAPON + 50) == 13030)
               {
                  this.screenTransition.setTeleportTarget(666);
                  this.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                  this.chatText.words.text = "";
                  return;
               }
               break;
            case "/list":
               NetworkManager.instance.listChannels();
               break;
            case "/join":
               if(strArray.length == 2)
               {
                  NetworkManager.instance.connectChatPIO(strArray[1]);
               }
               break;
            case "/createprivate":
               if(strArray.length == 2)
               {
                  NetworkManager.instance.connectChatPIO(strArray[1],false);
               }
               break;
            case "/invite":
               if(strArray.length == 2)
               {
                  if(NetworkManager.instance.currentChat == "$service-room$")
                  {
                     connInvite = NetworkManager.getInstance().connectPIO(strArray[1],ConnectionPIO.PURPOSE_INVITE,"Global");
                  }
                  else
                  {
                     connInvite = NetworkManager.getInstance().connectPIO(strArray[1],ConnectionPIO.PURPOSE_INVITE,NetworkManager.instance.currentChat);
                  }
                  connInvite.terminateConnection();
               }
               break;
            case "/leave":
               if(NetworkManager.instance.currentChat == "$service-room$")
               {
                  OverworldHUD.instance.updateChatLogWordsOnly("Leaving channel: Global","#FFCC00");
               }
               else
               {
                  OverworldHUD.instance.updateChatLogWordsOnly("Leaving channel: " + NetworkManager.instance.currentChat,"#FFCC00");
               }
               NetworkManager.instance.disconnectChatPIO();
               break;
            case "/whoisonline":
               NetworkManager.instance.sendWhoIsOnline();
               break;
            case "/kick":
               NetworkManager.instance.sendChatKick(strArray[1]);
               OverworldHUD.instance.updateChatLogWordsOnly(strArray[1] + " kicked from channel.","#FFCC00");
               break;
            case "/ban":
               NetworkManager.instance.sendChatBan(strArray[1]);
               OverworldHUD.instance.updateChatLogWordsOnly(strArray[1] + " banned from channel.","#FFCC00");
               break;
            case "/unban":
               NetworkManager.instance.sendChatUnBan(strArray[1]);
               OverworldHUD.instance.updateChatLogWordsOnly(strArray[1] + " unbanned from channel.","#FFCC00");
               break;
            case "/help":
               this.updateChatLogWordsOnly("\nAvailable commands:","#FFCC00");
               this.updateChatLogWordsOnly("/recall <font color=\'#CCCCCC\'>- brings you to the nearest dojo</font>");
               this.updateChatLogWordsOnly("/emotes <font color=\'#CCCCCC\'>- lists the available emotes</font>");
               this.updateChatLogWordsOnly("/whoisonline <font color=\'#CCCCCC\'>- lists the players in the current chat channel</font>");
               this.updateChatLogWordsOnly("/join [channel name] <font color=\'#CCCCCC\'>- joins or creates a chat channel</font>");
               this.updateChatLogWordsOnly("/createprivate [channel name] <font color=\'#CCCCCC\'>- creates a private chat channel</font>");
               this.updateChatLogWordsOnly("/invite [player name] <font color=\'#CCCCCC\'>- invites a player to join the current chat channel</font>");
               this.updateChatLogWordsOnly("/leave <font color=\'#CCCCCC\'>- leaves the current chat channel</font>");
               this.updateChatLogWordsOnly("/list <font color=\'#CCCCCC\'>- lists the available chat channels</font>");
               this.updateChatLogWordsOnly("/kick [player name] <font color=\'#CCCCCC\'>- kicks a player from the chat channel (operators only)</font>");
               this.updateChatLogWordsOnly("/ban [player name] <font color=\'#CCCCCC\'>- bans a player from the chat channel (operators only)</font>");
               this.updateChatLogWordsOnly("/unban [player name] <font color=\'#CCCCCC\'>- unbans a player from the chat channel (operators only)</font>");
               break;
            case "/emotes":
               this.updateChatLogWordsOnly("\nAvailable emotes:","#FFCC00");
               this.updateChatLogWordsOnly("/bow, /kneel, /sit, /stand, /fart, /gangnamstyle, /rest, /seppuku, /shoulderweapon","#CCCCCC");
               break;
            default:
               censoredWords = this.censorWords(this.chatText.words.text);
               color = "#FFFFFF";
               sayWords = censoredWords;
               if(this.hasItemInChat)
               {
                  max = int(this.chatKeyArray.length);
                  for(i = 0; i < max; i++)
                  {
                     item = Item.parseNoQty(this.chatItemArray[i]);
                     str = "<b><u><a href=\'event:[ITM]" + this.chatItemArray[i] + "\'>" + item.getNameBlackBGBrackets() + "</a></u></b>";
                     censoredWords = censoredWords.split(this.chatKeyArray[i]).join(str);
                  }
               }
               if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL || StatsManager.hasBuff(StatsManager.BUFF_MUTE))
               {
                  this.chatMode = 1;
               }
               if(censoredWords != "")
               {
                  if(this.chatMode == 2)
                  {
                     side = StatsManager.getSide();
                     if(side == 1)
                     {
                        color = "#FF0000";
                     }
                     else if(side == 2)
                     {
                        color = "#00FF00";
                     }
                     else if(side == 3)
                     {
                        color = "#00FFFF";
                     }
                     else if(side == 4)
                     {
                        color = "#FFCC00";
                     }
                     else if(StatsManager.isCustomClan(side))
                     {
                        color = "#FF9900";
                     }
                  }
                  else if(this.chatMode == 1)
                  {
                     color = "#CCCCCC";
                  }
                  if(!StatsManager.hasBuff(StatsManager.BUFF_FULLMUTE))
                  {
                     this.updateChatLog(StatsManager.charname,censoredWords,color);
                     NetworkManager.getInstance().globalChat(censoredWords,this.chatMode,sayWords);
                     QueryManager.instance.logMessage(censoredWords);
                  }
                  if(censoredWords == this.previousChat)
                  {
                     ++this.spamCount;
                  }
                  else
                  {
                     this.spamCount = 0;
                  }
                  this.previousChat = censoredWords;
                  if(this.spamCount >= 10)
                  {
                     StatsManager.setBuff(StatsManager.BUFF_FULLMUTE,5 * 60);
                  }
                  else if(this.spamCount >= 5)
                  {
                     StatsManager.setBuff(StatsManager.BUFF_MUTE,60);
                  }
                  if(!this.hasItemInChat && NPCManager.hasChatBot())
                  {
                     NetworkManager.getInstance().sendChatBot(censoredWords);
                  }
               }
         }
         this.clearItemInChat();
         this.chatText.words.text = "";
      }
      
      public function censorWords(str:String) : String
      {
         var regEx:RegExp = null;
         var censoredWords:String = str.split("<").join("");
         var badwords:Array = ["fuck","shit","bitch","asshole","nigger","faggot","whore","penis","vagina"];
         censoredWords = censoredWords.split(">").join("");
         for(var i:int = 0; i < badwords.length; i++)
         {
            regEx = new RegExp(badwords[i],"gi");
            censoredWords = censoredWords.replace(regEx,"potato");
         }
         return censoredWords;
      }
      
      public function initForAdventureMode() : *
      {
         this.reset();
         this.showNodeUI(true);
         this.showInfoBustButtons(true);
         this.showAdventureModeItem();
         this.playerPanelDisplay.closePanel();
         this.showChatButton(true);
         this.showBigMap(StageManager.getCurrentRoom() == 0);
         if(StatsManager.getChatShowing())
         {
            this.onShowChat(null);
         }
         this.key.visible = StatsManager.hasKey();
         if(this.lvlup != 0)
         {
            NetworkManager.instance.playerUpdateLvl(StatsManager.getLevel());
            if(this.lvlup == 10 && StatsManager.getStat(StatsManager.STAT_SIDE) == 0)
            {
               OverworldHUD.instance.warUI.onShow();
            }
            this.lvlup = 0;
         }
      }
      
      public function initForBattleMode() : *
      {
         this.reset();
         this.showNodeUI(false);
         this.showInfoBustButtons(false);
         this.hideAdventureModeItem();
         this.playerPanelDisplay.closePanel();
         this.showChatButton(false);
         this.minimap.visible = false;
         this.territorymap.visible = false;
         this.key.visible = false;
         this.hasStatPointMark.visible = false;
         this.hasSkillPointMark.visible = false;
         this.hasWarMoveMark.visible = false;
         this.showItemUI.onClick(null);
      }
      
      public function initForOverworld() : *
      {
         this.reset();
         this.showNodeUI(true);
         this.showInfoBustButtons(true);
         this.hideAdventureModeItem();
         this.playerPanelDisplay.closePanel();
         this.showChatButton(false);
         Overworld.setMapEnabled(true);
      }
      
      public function initForCutscene(disableInput:Boolean = true) : *
      {
         this.showNodeUI(false);
         this.showInfoBustButtons(false);
         this.hideAdventureModeItem();
         this.playerPanelDisplay.closePanel();
         this.showChatButton(false);
         Overworld.setMapEnabled(false);
         if(disableInput)
         {
            InputManager.disableInput();
         }
         this.minimap.visible = false;
         this.key.visible = false;
         this.showItemUI.onClick(null);
      }
      
      internal function hideAll() : *
      {
         this.initForCutscene();
         StageManager.getGameStage().visible = false;
      }
      
      public function unHideAll() : *
      {
         this.initForAdventureMode();
         StageManager.getGameStage().visible = true;
      }
      
      public function nextStance(event:Event) : *
      {
         if(StatsManager.stance == MCSPlayer.LIGHT_STANCE)
         {
            StatsManager.stance = MCSPlayer.BALANCED_STANCE;
            this.updateBustText(LangManager.getString(644));
         }
         else if(StatsManager.stance == MCSPlayer.BALANCED_STANCE)
         {
            StatsManager.stance = MCSPlayer.HEAVY_STANCE;
            this.updateBustText(LangManager.getString(645));
         }
         else if(StatsManager.stance == MCSPlayer.HEAVY_STANCE)
         {
            StatsManager.stance = MCSPlayer.LIGHT_STANCE;
            this.updateBustText(LangManager.getString(643));
         }
         this.bustUI.battlemodebust.stancecolor1.gotoAndStop(StatsManager.stance + 1);
      }
      
      internal function showPlayerLabel(event:Event) : *
      {
         this.playerlabel.visible = true;
      }
      
      internal function hidePlayerLabel(event:Event) : *
      {
         this.playerlabel.visible = false;
      }
      
      internal function showSkillLabel(event:Event) : *
      {
         this.skillslabel.visible = true;
      }
      
      internal function hideSkillLabel(event:Event) : *
      {
         this.skillslabel.visible = false;
      }
      
      internal function showQuestLogLabel(event:Event) : *
      {
         this.questloglabel.visible = true;
      }
      
      internal function hideQuestLogLabel(event:Event) : *
      {
         this.questloglabel.visible = false;
      }
      
      internal function showDuelLabel(event:Event) : *
      {
         this.duellabel.visible = true;
      }
      
      internal function hideDuelLabel(event:Event) : *
      {
         this.duellabel.visible = false;
      }
      
      internal function showOptionsLabel(event:Event) : *
      {
         this.optionslabel.visible = true;
      }
      
      internal function hideOptionsLabel(event:Event) : *
      {
         this.optionslabel.visible = false;
      }
      
      internal function showShopLabel(event:Event) : *
      {
         this.shoplabel.visible = true;
      }
      
      internal function hideShopLabel(event:Event) : *
      {
         this.shoplabel.visible = false;
      }
      
      internal function showWarLabel(event:Event) : *
      {
         this.warlabel.visible = true;
      }
      
      internal function hideWarLabel(event:Event) : *
      {
         this.warlabel.visible = false;
      }
      
      internal function showChatLabel(event:Event) : *
      {
         this.chatlabel.visible = true;
      }
      
      internal function hideChatLabel(event:Event) : *
      {
         this.chatlabel.visible = false;
      }
      
      internal function showChangeStanceLabel(event:Event) : *
      {
         this.changestancelabel.visible = true;
         this.bustUI.battlemodebust.highlight.visible = true;
      }
      
      internal function hideChangeStanceLabel(event:Event) : *
      {
         this.changestancelabel.visible = false;
         this.bustUI.battlemodebust.highlight.visible = false;
      }
      
      internal function showInteractLabel(xpos:int, ypos:int, str:String) : *
      {
         if(str != "")
         {
            this.interactLabel.visible = true;
            xpos = (xpos - StatsManager.stageOffsetX) / StatsManager.stageScale;
            ypos = (ypos - StatsManager.stageOffsetY) / StatsManager.stageScale;
            if(this.interactLabel.text != str)
            {
               this.interactLabel.text = str;
            }
            this.interactLabel.x = xpos - 90;
            if(this.interactLabel.x < 0)
            {
               this.interactLabel.x = 0;
            }
            else if(this.interactLabel.x > StatsManager.stageWidth - 180)
            {
               this.interactLabel.x = StatsManager.stageWidth - 180;
            }
            if(this.interactLabel.numLines == 2)
            {
               this.interactLabel.y = ypos - 40;
               this.interactLabel.height = 36;
            }
            else
            {
               this.interactLabel.y = ypos - 24;
               this.interactLabel.height = 20;
            }
         }
         else
         {
            this.interactLabel.visible = false;
         }
      }
      
      internal function minimapClick(event:MouseEvent) : *
      {
         if(event.localY < 150)
         {
            trace("mini map click");
            if(!GameEngine.isPvPRoomMode())
            {
               this.hideAll();
               this.worldMapUI.show();
            }
         }
      }
      
      internal function bigmapClick(event:MouseEvent) : *
      {
         if(event.localY < 150)
         {
            trace("big map click");
            if(!GameEngine.isPvPRoomMode())
            {
               this.hideAll();
               this.worldMapUI.show();
            }
            if(StatsManager.consoleEnabled)
            {
               this.territorymap.visible = !this.territorymap.visible;
            }
         }
      }
      
      public function showBigMap(flag:Boolean) : *
      {
         if(StageManager.getCurrentNode() == 666)
         {
            this.minimap.visible = false;
            this.territorymap.visible = false;
            return;
         }
         this.minimap.visible = !flag;
         this.territorymap.visible = flag;
         StatsManager.setBigMapShowing(flag);
      }
      
      public function doResize() : *
      {
         scaleX = StatsManager.stageScale;
         scaleY = StatsManager.stageScale;
         x = StatsManager.stageOffsetX;
         y = StatsManager.stageOffsetY;
         GameEngine.placeBlockers();
      }
      
      public function showCorrupted() : *
      {
         var msgbox:CorruptedMessage = new CorruptedMessage();
         msgbox.prompt.text = "Error: Data corrupted";
         addChild(msgbox);
         GameEngine.stopEngine();
         if(StatsManager.usePlayerIO)
         {
            NetworkManager.instance.disconnectChatPIO();
         }
      }
      
      public function showMultipleClients() : *
      {
         if(!GameEngine.isAdventureMode())
         {
            GameEngine.stopBattleMode();
         }
         var msgbox:CorruptedMessage = new CorruptedMessage();
         msgbox.prompt.text = "Error: Multiple clients";
         addChild(msgbox);
         InputManager.disableInput();
         GameEngine.stopEngine();
         if(StatsManager.usePlayerIO)
         {
            NetworkManager.instance.disconnectGlobalPIO();
            NetworkManager.instance.disconnectChatPIO();
         }
      }
      
      public function showDuplicate() : *
      {
         if(!GameEngine.isAdventureMode())
         {
            GameEngine.stopBattleMode();
         }
         var msgbox:CorruptedMessage = new CorruptedMessage();
         msgbox.prompt.text = "Error: Duplicate player";
         addChild(msgbox);
         InputManager.disableInput();
         GameEngine.stopEngine();
         if(StatsManager.usePlayerIO)
         {
            NetworkManager.instance.disconnectGlobalPIO();
            NetworkManager.instance.disconnectChatPIO();
         }
      }
      
      public function showHumanCheck() : *
      {
         var humanCheckDialog:HumanCheckDialog = new HumanCheckDialog();
         addChild(humanCheckDialog);
         humanCheckDialog.show();
      }
      
      internal function reportLevelUp(newlevel:int) : *
      {
         this.lvlup = newlevel;
      }
      
      public function setActiveQuestText(str:String, questType:int = 0) : *
      {
         if(GameEngine.isPvPRoomMode() || str == "")
         {
            this.nodeUI.activequesttext.text = "";
         }
         else if(questType == QuestType.StoryQuest)
         {
            this.nodeUI.activequesttext.text = LangManager.getString(711) + str;
         }
         else if(questType == QuestType.ClanQuest)
         {
            this.nodeUI.activequesttext.text = LangManager.getString(717) + str;
         }
         else
         {
            this.nodeUI.activequesttext.text = LangManager.getString(712) + str;
         }
      }
      
      public function showAchievementUnlocked(index:int) : *
      {
         this.achievementUnlockedUI.show(index);
      }
      
      public function showChikakoRefund() : *
      {
         this.chikakoRefundUI.show();
      }
   }
}

