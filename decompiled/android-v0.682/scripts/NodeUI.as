package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2645")]
   public class NodeUI extends MovieClip
   {
      
      public static var instance:NodeUI;
      
      public static var ACTION_QUEST:int = 0;
      
      public static var ACTION_SHOP:int = 1;
      
      public static var ACTION_REST:int = 2;
      
      public static var ACTION_CAMP:int = 3;
      
      public static var ACTION_SEARCH:int = 4;
      
      public static var ACTION_FISH:int = 5;
      
      public static var ACTION_HUNT:int = 6;
      
      public static var ACTION_TRAVEL:int = 7;
      
      public static var ACTION_TRAIN:int = 8;
      
      public static var ACTION_ENTER:int = 9;
      
      public static var ACTION_INTERACT:int = 10;
      
      public static var ACTION_LOOK:int = 11;
      
      public static var ACTION_USE:int = 12;
      
      public static var ACTION_TALK:int = 13;
      
      public static var ACTION_LEAVE:int = 14;
      
      public static var ACTION_BUY:int = 15;
      
      public static var ACTION_SELL:int = 16;
      
      public static var ACTION_LOOKATNETWORKPLAYER:int = 17;
      
      public static var ACTION_ITEM:int = 18;
      
      public static var ACTION_ADD:int = 19;
      
      public static var ACTION_MINUS:int = 20;
      
      public static var ACTION_ATTACK:int = 21;
      
      public static var ACTION_STEAL:int = 22;
      
      public static var ACTION_BACK:int = 23;
      
      public static var ACTION_FIREELEMENT:int = 24;
      
      public static var ACTION_WINDELEMENT:int = 25;
      
      public static var ACTION_WATERELEMENT:int = 26;
      
      public static var ACTION_EARTHELEMENT:int = 27;
      
      public static var ACTION_MINE:int = 28;
      
      public static var ACTION_GIFT:int = 29;
      
      public static var ACTION_STORAGE:int = 30;
      
      public static var ACTION_MEDAL:int = 31;
      
      public var activequesttext:TextField;
      
      public var nodeName:MovieClip;
      
      public var actionButtonList:Vector.<GenericActionButton>;
      
      public var type:int;
      
      public var actionButtonHeight:int = 40;
      
      internal var activeButtonCount:int = 0;
      
      internal var activeButtonMax:int = 7;
      
      internal var currentInteractiveObjectList:Array;
      
      internal var previousInteractiveObjectList:Array;
      
      internal var currentEnemyPlayerList:Array;
      
      internal var previousEnemyPlayerList:Array;
      
      internal var oreType:int;
      
      internal var interactiveStageObjectHolder:InteractiveStageObject;
      
      public function NodeUI()
      {
         var button:GenericActionButton = null;
         this.currentInteractiveObjectList = new Array();
         this.previousInteractiveObjectList = new Array();
         this.currentEnemyPlayerList = new Array();
         this.previousEnemyPlayerList = new Array();
         super();
         instance = this;
         this.actionButtonList = new Vector.<GenericActionButton>();
         for(var i:int = 0; i < this.activeButtonMax; i++)
         {
            button = new GenericActionButton();
            this.actionButtonList.push(button);
            button.visible = false;
            button.x = 10;
            button.y = 40 + this.actionButtonHeight * i;
            addChild(button);
         }
         LangManager.initTextField(this.nodeName.label,true);
         this.activequesttext.cacheAsBitmap = true;
      }
      
      public function registerInteractiveObject(obj:InteractiveStageObject) : *
      {
         this.currentInteractiveObjectList.push(obj);
      }
      
      public function registerEnemyPlayer(enemyPlayer:EnemyPlayer) : *
      {
         this.currentEnemyPlayerList.push(enemyPlayer);
      }
      
      public function showButtons() : *
      {
         var i:int = 0;
         var obj:InteractiveStageObject = null;
         var enemyPlayer:EnemyPlayer = null;
         var changed:Boolean = false;
         var max:int = int(this.currentEnemyPlayerList.length);
         if(max != this.previousEnemyPlayerList.length)
         {
            changed = true;
         }
         else
         {
            for(i = 0; i < max; i++)
            {
               if(this.currentEnemyPlayerList[i] != this.previousEnemyPlayerList[i])
               {
                  changed = true;
                  break;
               }
            }
         }
         if(!changed)
         {
            max = int(this.currentInteractiveObjectList.length);
            if(max != this.previousInteractiveObjectList.length)
            {
               changed = true;
            }
            else
            {
               for(i = 0; i < max; i++)
               {
                  if(this.currentInteractiveObjectList[i] != this.previousInteractiveObjectList[i])
                  {
                     changed = true;
                     break;
                  }
               }
            }
         }
         if(changed)
         {
            this.clearActionButtonList();
            this.previousInteractiveObjectList.length = 0;
            this.previousEnemyPlayerList.length = 0;
            max = int(this.currentInteractiveObjectList.length);
            for(i = 0; i < max; i++)
            {
               obj = this.currentInteractiveObjectList[i];
               obj.showInteractButton(true);
               this.previousInteractiveObjectList.push(obj);
            }
            max = int(this.currentEnemyPlayerList.length);
            for(i = 0; i < max; i++)
            {
               enemyPlayer = this.currentEnemyPlayerList[i];
               this.addLookAtNetworkPlayerButton(enemyPlayer);
               this.previousEnemyPlayerList.push(enemyPlayer);
            }
         }
         this.currentInteractiveObjectList.length = 0;
         this.currentEnemyPlayerList.length = 0;
      }
      
      public function clearActionButtonList() : void
      {
         var button:GenericActionButton = null;
         var max:int = int(this.actionButtonList.length);
         for(var i:int = 0; i < max; i++)
         {
            button = this.actionButtonList[i];
            button.visible = false;
            button.uninit();
            button.removeEventListener(MouseEvent.CLICK,this.onClick);
         }
         this.activeButtonCount = 0;
      }
      
      public function getButtonCount() : int
      {
         return this.activeButtonCount;
      }
      
      public function addActionButton(actionID:int, buttonEnabled:Boolean) : *
      {
         if(this.activeButtonCount >= this.activeButtonMax)
         {
            return;
         }
         var button:GenericActionButton = this.actionButtonList[this.activeButtonCount];
         button.initAction(this.activeButtonCount,actionID);
         if(buttonEnabled)
         {
            button.addEventListener(MouseEvent.CLICK,this.onClick);
            button.setGreyOut(false);
         }
         else
         {
            button.setGreyOut(true);
         }
         ++this.activeButtonCount;
         button.visible = true;
      }
      
      public function addInteractiveObjectButton(obj:InteractiveStageObject, iconID:int) : *
      {
         if(this.activeButtonCount >= this.activeButtonMax)
         {
            return;
         }
         var button:GenericActionButton = this.actionButtonList[this.activeButtonCount];
         button.initInteract(obj,iconID);
         button.addEventListener(MouseEvent.CLICK,this.onClick);
         button.setGreyOut(false);
         ++this.activeButtonCount;
         button.visible = true;
         return button;
      }
      
      public function addQuestButton(mainTxt:String, subTxt:String = "", questType:int = 0, questID:int = 0, stepID:int = 0, ap:int = 0) : *
      {
         if(this.activeButtonCount >= this.activeButtonMax)
         {
            return;
         }
         var button:GenericActionButton = this.actionButtonList[this.activeButtonCount];
         button.initQuest(this.activeButtonCount,mainTxt,subTxt,questType,questID,stepID,ap);
         button.addEventListener(MouseEvent.CLICK,this.onClick);
         button.setGreyOut(false);
         ++this.activeButtonCount;
         button.visible = true;
      }
      
      public function addInteractiveObjectQuestButton(obj:InteractiveStageObject, mainTxt:String, subTxt:String = "", questType:int = 0, questID:int = 0, stepID:int = 0, ap:int = 0, objectTriggersQuest:Boolean = false) : *
      {
         if(this.activeButtonCount >= this.activeButtonMax)
         {
            return;
         }
         var button:GenericActionButton = this.actionButtonList[this.activeButtonCount];
         button.initQuest(this.activeButtonCount,mainTxt,subTxt,questType,questID,stepID,ap,objectTriggersQuest);
         button.addEventListener(MouseEvent.CLICK,this.onClick);
         button.setGreyOut(false);
         ++this.activeButtonCount;
         button.visible = true;
         button.setInteractiveObject(obj);
      }
      
      public function addDummyQuestButton(mainTxt:String, subTxt:String = "", questType:int = 0, questID:int = 0, stepID:int = 0, ap:int = 0) : *
      {
         if(this.activeButtonCount >= this.activeButtonMax)
         {
            return;
         }
         var button:GenericActionButton = this.actionButtonList[this.activeButtonCount];
         button.initQuest(this.activeButtonCount,mainTxt,subTxt,questType,questID,stepID,ap);
         ++this.activeButtonCount;
         button.setGreyOut(true);
         button.visible = true;
      }
      
      public function addLookAtNetworkPlayerButton(enemyPlayer:EnemyPlayer) : *
      {
         if(this.activeButtonCount >= this.activeButtonMax)
         {
            return;
         }
         var button:GenericActionButton = this.actionButtonList[this.activeButtonCount];
         button.initNetworkPlayer(enemyPlayer.charname,enemyPlayer.getNetworkPlayer());
         ++this.activeButtonCount;
         button.visible = true;
         button.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function setNodeName(nameStr:String) : *
      {
         this.nodeName.label.text = nameStr;
      }
      
      public function setNode(nodeType:int, nameStr:String, buttonEnabled:Boolean) : void
      {
         this.nodeName.label.text = nameStr;
         this.type = nodeType;
         switch(nodeType)
         {
            case 0:
               this.addActionButton(ACTION_REST,buttonEnabled);
               break;
            case 1:
               this.addActionButton(ACTION_CAMP,buttonEnabled);
               break;
            case 2:
               this.addActionButton(ACTION_CAMP,buttonEnabled);
               this.addActionButton(ACTION_HUNT,buttonEnabled);
               break;
            case 3:
               this.addActionButton(ACTION_CAMP,buttonEnabled);
               this.addActionButton(ACTION_FISH,buttonEnabled);
               break;
            case 4:
               this.addActionButton(ACTION_CAMP,buttonEnabled);
               break;
            case 5:
               this.addActionButton(ACTION_CAMP,buttonEnabled);
               break;
            case 6:
               this.addActionButton(ACTION_REST,buttonEnabled);
         }
      }
      
      public function onClick(event:MouseEvent) : *
      {
         var button:GenericActionButton = null;
         var dice:int = 0;
         var nodeData:XMLWorldNode = null;
         var enemyPlayer:EnemyPlayer = null;
         if(InputManager.isDisabled())
         {
            return;
         }
         button = event.target.parent as GenericActionButton;
         switch(button.getButtonType())
         {
            case ACTION_ENTER:
               if(StatsManager.checkAP(1))
               {
                  OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_EXPLORENODE);
               }
               else
               {
                  OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case ACTION_TRAVEL:
               nodeData = QuestEngine.getNodeData(Overworld.currentNode);
               if(!StatsManager.checkConditions(nodeData.condition))
               {
                  trace(nodeData.failtext);
                  OverworldHUD.instance.showDialog(nodeData.failtext,LangManager.getString(5));
                  return;
               }
               this.visible = false;
               if(StatsManager.findWeight() > StatsManager.getCarryingWeight())
               {
                  OverworldHUD.instance.showDialogBig(LangManager.getString(138),LangManager.getString(5));
                  return;
               }
               if(StatsManager.checkAP(5))
               {
                  QuestEngine.refreshNodeQuests(Overworld.currentNode);
                  Overworld.map.setAnimation(Overworld.currentNode);
               }
               else
               {
                  OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case ACTION_REST:
               if(StatsManager.checkAP(1))
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(149),LangManager.getString(5));
                  StatsManager.increaseHP(100);
                  StatsManager.increaseChi(100);
                  QueryManager.instance.saveModifiedCharData();
               }
               else
               {
                  OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case ACTION_SEARCH:
               this.runSearch(button.getInteractiveObject());
               break;
            case ACTION_SHOP:
            case ACTION_TRAIN:
               break;
            case ACTION_CAMP:
               if(StatsManager.checkAP(5))
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(128),LangManager.getString(5));
                  StatsManager.increaseHP(50);
                  StatsManager.increaseChi(50);
                  QueryManager.instance.saveModifiedCharData();
               }
               else
               {
                  OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case ACTION_HUNT:
               if(StatsManager.checkAP(3))
               {
                  dice = Math.random() * 10;
                  if(dice == 3 || dice == 4 || dice == 5)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(171),LangManager.getString(5));
                     OverworldHUD.instance.lootDialog.addLootItem(2112,1,1);
                     OverworldHUD.instance.lootDialog.show();
                  }
                  else if(dice == 1 || dice == 2)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(129),LangManager.getString(5));
                     OverworldHUD.instance.lootDialog.addLootItem(2113,1,1);
                     OverworldHUD.instance.lootDialog.show();
                  }
                  else if(dice == 0)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(172),LangManager.getString(5));
                     OverworldHUD.instance.lootDialog.addLootItem(2114,1,1);
                     OverworldHUD.instance.lootDialog.show();
                  }
                  else
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(130),LangManager.getString(5));
                  }
                  QueryManager.instance.saveModifiedCharData();
               }
               else
               {
                  OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case ACTION_FISH:
               if(StatsManager.checkAP(3))
               {
                  dice = Math.random() * 10;
                  if(dice == 3 || dice == 4 || dice == 5)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(169),LangManager.getString(5));
                     OverworldHUD.instance.lootDialog.addLootItem(2109,1,1);
                     OverworldHUD.instance.lootDialog.show();
                  }
                  else if(dice == 1 || dice == 2)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(131),LangManager.getString(5));
                     OverworldHUD.instance.lootDialog.addLootItem(2110,1,1);
                     OverworldHUD.instance.lootDialog.show();
                  }
                  else if(dice == 0)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(170),LangManager.getString(5));
                     OverworldHUD.instance.lootDialog.addLootItem(2111,1,1);
                     OverworldHUD.instance.lootDialog.show();
                  }
                  else
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(130),LangManager.getString(5));
                  }
                  QueryManager.instance.saveModifiedCharData();
               }
               else
               {
                  OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case ACTION_LOOKATNETWORKPLAYER:
               enemyPlayer = NPCManager.getNetworkEnemyPlayer(button.getNetworkPlayerNid());
               if(enemyPlayer != null)
               {
                  OverworldHUD.getInstance().showPlayerPanel(enemyPlayer);
               }
               StatsManager.getPlayer().stopMoving();
               break;
            case ACTION_QUEST:
               if(!button.objectTriggersQuest)
               {
                  StatsManager.getPlayer().stopMoving();
                  this.clickQuest(button);
               }
               else
               {
                  this.doInteract(button);
               }
               break;
            case ACTION_INTERACT:
               this.doInteract(button);
         }
      }
      
      internal function doInteract(button:GenericActionButton) : *
      {
         if(!GameEngine.isOverworld())
         {
            StatsManager.getPlayer().stopMoving();
         }
         if(button.getInteractiveObject().needTransition())
         {
            OverworldHUD.getInstance().screenTransition.setParam(button.getInteractiveObject());
            OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
         }
         else
         {
            button.getInteractiveObject().interact();
         }
      }
      
      public function runSearch(bush:InteractiveStageObject) : *
      {
         if(!StatsManager.checkAP(2))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            return;
         }
         this.interactiveStageObjectHolder = bush;
         StatsManager.getPlayer().getProgressBar().startProgress(24,ACTION_SEARCH);
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
         }
      }
      
      internal function doSearch() : *
      {
         this.interactiveStageObjectHolder.interact2();
      }
      
      public function runMine(oreType:int, oredeposit:InteractiveStageObject) : *
      {
         this.oreType = oreType;
         this.interactiveStageObjectHolder = oredeposit;
         StatsManager.getPlayer().getProgressBar().startProgress(24,ACTION_MINE);
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
         }
      }
      
      internal function doMine() : *
      {
         if(this.oreType == 1)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20059,1);
         }
         else if(this.oreType == 2)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20060,1);
         }
         else if(this.oreType == 3)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20061,1);
         }
         else if(this.oreType == 4)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20062,1);
         }
         else if(this.oreType == 5)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20063,1);
         }
         else if(this.oreType == 6)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20064,1);
         }
         else if(this.oreType == 7)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20065,1);
         }
         else if(this.oreType == 8)
         {
            OverworldHUD.instance.lootDialog.addLootItemBasic(20066,1);
         }
         if(this.oreType != 1)
         {
            (this.interactiveStageObjectHolder as Obj_OreDeposit).clearOre();
         }
         OverworldHUD.instance.lootDialog.show();
         QueryManager.instance.saveModifiedCharData();
         StatsManager.getPlayer().startAnim(MCSActor.PICKUP);
         this.interactiveStageObjectHolder = null;
         StatsManager.updateWeaponUse(1);
         StatsManager.reportAchievementStat(60003,1);
      }
      
      public function clickQuest(button:GenericActionButton) : *
      {
         var currentQuest:int = button.questID;
         var currentStep:int = button.stepID;
         var data:XMLQuestStep = QuestEngine.getQuestStepDetails(currentQuest,currentStep);
         if(StatsManager.checkConditions(data.condition))
         {
            if(StatsManager.checkAP(data.ap))
            {
               this.visible = false;
               Overworld.startQuestStepIntro(currentQuest,currentStep);
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(100),LangManager.getString(5));
            }
         }
         else
         {
            OverworldHUD.instance.showDialog(data.failtext,LangManager.getString(5));
         }
      }
      
      public function doHitTest(x:int, y:int) : Boolean
      {
         var button:GenericActionButton = null;
         for(var i:int = 0; i < this.activeButtonMax; i++)
         {
            button = this.actionButtonList[i];
            if(button.visible && button.hitTestPoint(x,y))
            {
               return true;
            }
         }
         return false;
      }
   }
}

