package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol850")]
   public class QuestLogUI extends MovieClip
   {
      
      public var completebutton:GreyButton;
      
      public var rewardlabel:TextField;
      
      public var rewardtext:TextField;
      
      public var teleportbutton:GoldButton;
      
      public var locationtext:TextField;
      
      public var hGoldText:TextField;
      
      public var locationlabel:TextField;
      
      public var abandonbutton:GreyButton;
      
      public var questScrollDownButton:ScrollButton;
      
      public var questScrollUpButton:ScrollButton;
      
      public var noquesttext:TextField;
      
      public var goldicon:MovieClip;
      
      public var questLeaveButton:SimpleButton;
      
      public var bg:MovieClip;
      
      public var titletext:TextField;
      
      public var abandonQuestDialog:AbandonQuestDialogBox;
      
      public var goldlabel:TextField;
      
      public var objectivetext:TextField;
      
      public var objectivelabel:TextField;
      
      public var questLogButtonList:Vector.<QuestLogButton>;
      
      private var activeQuests:Vector.<ActiveQuest>;
      
      private var maxRow:int;
      
      private var maxLength:int;
      
      private var currentRow:int;
      
      internal var questAbandoned:Boolean = false;
      
      private var selectedButtonIndex:int = -1;
      
      public function QuestLogUI()
      {
         var tempQuestLogButton:QuestLogButton = null;
         var i:int = 0;
         super();
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(77);
         LangManager.initTextField(this.noquesttext);
         this.noquesttext.text = "";
         LangManager.initTextField(this.objectivelabel);
         LangManager.initTextField(this.objectivetext);
         this.objectivelabel.text = LangManager.getString(530);
         this.objectivetext.text = "";
         LangManager.initTextField(this.locationlabel);
         LangManager.initTextField(this.locationtext);
         this.locationlabel.text = LangManager.getString(531);
         this.locationtext.text = "";
         LangManager.initTextField(this.rewardlabel);
         LangManager.initTextField(this.rewardtext);
         this.rewardlabel.text = LangManager.getString(535);
         this.rewardtext.text = "";
         LangManager.initTextField(this.goldlabel,true);
         this.goldlabel.text = LangManager.getString(64);
         this.questLogButtonList = new Vector.<QuestLogButton>();
         for(i = 0; i < 7; i++)
         {
            tempQuestLogButton = new QuestLogButton(i);
            tempQuestLogButton.x = 60;
            tempQuestLogButton.y = 73 + i * 55;
            addChild(tempQuestLogButton);
            this.questLogButtonList.push(tempQuestLogButton);
         }
         this.questLogButtonList.fixed = true;
         addChild(this.abandonQuestDialog);
         this.abandonQuestDialog.visible = false;
         this.abandonbutton.setText(LangManager.getString(40));
         this.teleportbutton.setText(LangManager.getString(534));
         this.completebutton.setText(LangManager.getString(710));
         this.goldicon.visible = false;
         this.teleportbutton.visible = false;
      }
      
      public function addEventListeners() : void
      {
         this.questLeaveButton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.questScrollUpButton.addEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.questScrollDownButton.addEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.teleportbutton.addEventListener(MouseEvent.CLICK,this.onTeleport);
         this.teleportbutton.addEventListeners();
         this.abandonbutton.addEventListener(MouseEvent.CLICK,this.onAbandon);
         this.abandonbutton.addEventListeners();
         this.completebutton.addEventListener(MouseEvent.CLICK,this.onComplete);
         this.completebutton.addEventListeners();
         for(var i:int = 0; i < this.questLogButtonList.length; i++)
         {
            this.questLogButtonList[i].addEventListeners();
            this.questLogButtonList[i].addEventListener(MouseEvent.CLICK,this.onQuestButtonClick);
         }
         this.bg.cacheAsBitmap = true;
      }
      
      public function removeEventListeners() : void
      {
         this.questLeaveButton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.questScrollUpButton.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.questScrollDownButton.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.teleportbutton.removeEventListener(MouseEvent.CLICK,this.onTeleport);
         this.teleportbutton.removeEventListeners();
         this.abandonbutton.removeEventListener(MouseEvent.CLICK,this.onAbandon);
         this.abandonbutton.removeEventListeners();
         this.completebutton.removeEventListener(MouseEvent.CLICK,this.onComplete);
         this.completebutton.removeEventListeners();
         for(var i:int = 0; i < this.questLogButtonList.length; i++)
         {
            this.questLogButtonList[i].removeEventListeners();
            this.questLogButtonList[i].removeEventListener(MouseEvent.CLICK,this.onQuestButtonClick);
         }
         this.bg.cacheAsBitmap = false;
      }
      
      public function onLeave(mouseEvent:MouseEvent) : void
      {
         this.removeEventListeners();
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(true);
         }
         else
         {
            InputManager.setAdventureMode();
            NetworkManager.instance.playerUpdateBusy(false);
            if(this.questAbandoned)
            {
               QuestEngine.refreshNodeQuests(StatsManager.getLocation(),true);
               StageManager.refreshRoomQuestObjects();
            }
         }
         if(this.questAbandoned)
         {
            QueryManager.instance.saveModifiedCharData();
         }
         OverworldHUD.instance.territorymap.refresh();
         this.visible = false;
         OverworldHUD.instance.unHideAll();
      }
      
      public function onScrollUp(mouseEvent:MouseEvent) : void
      {
         if(this.currentRow > 0)
         {
            --this.currentRow;
            this.refreshQuestList();
         }
      }
      
      public function onScrollDown(mouseEvent:MouseEvent) : void
      {
         if(this.currentRow < this.maxRow)
         {
            ++this.currentRow;
            this.refreshQuestList();
         }
      }
      
      public function onTeleport(mouseEvent:MouseEvent) : *
      {
         var activeQuest:ActiveQuest;
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
         {
            this.onLeave(null);
            OverworldHUD.instance.showDialog(LangManager.getString(860),LangManager.getString(5));
            return;
         }
         activeQuest = this.activeQuests[this.selectedButtonIndex + this.currentRow];
         if(activeQuest.forClanQuest())
         {
            this.doClanQuestTeleport();
            return;
         }
         if(this.canFreeTeleport(activeQuest))
         {
            this.doTeleport();
            return;
         }
         StatsManager.spendHeavenlyGold(1,function():*
         {
            QueryManager.instance.reportPremiumBuy(2,"gotoquest",1);
            doTeleport();
         },function():*
         {
            OverworldHUD.instance.onShowGetGoldPromptDialog(1);
         });
      }
      
      internal function doTeleport() : *
      {
         SoundManager.instance.playGoodKoto();
         this.onLeave(null);
         var activeQuest:ActiveQuest = this.activeQuests[this.selectedButtonIndex + this.currentRow];
         var roomid:int = activeQuest.getMarkedRoom();
         if(NodeGenerator.instance.getLocationType(activeQuest.getMarkedNode()) != NodeGenerator.ICON_TOWN)
         {
            roomid = 0;
         }
         var teleportNode_PosX:IntStat = activeQuest.getTeleportNode();
         OverworldHUD.getInstance().screenTransition.setTeleportTarget(teleportNode_PosX.getId(),roomid,teleportNode_PosX.getValue());
         OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
      }
      
      internal function doClanQuestTeleport() : *
      {
         SoundManager.instance.playGoodKoto();
         this.onLeave(null);
         var activeQuest:ActiveQuest = this.activeQuests[this.selectedButtonIndex + this.currentRow];
         var roomid:int = 1;
         var teleportNode_PosX:IntStat = activeQuest.getTeleportNode();
         StatsManager.setStat(30021,StageManager.getCurrentNode());
         StatsManager.saveLocation(teleportNode_PosX.getId(),roomid);
         OverworldHUD.getInstance().screenTransition.setTeleportTarget(teleportNode_PosX.getId(),roomid,400);
         OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORTCLANQUEST);
      }
      
      public function onAbandon(mouseEvent:MouseEvent) : *
      {
         this.abandonQuestDialog.show(this.questLogButtonList[this.selectedButtonIndex].getTitle());
      }
      
      internal function onComplete(mouseEvent:MouseEvent) : *
      {
         var npcxml:XMLNpc = null;
         var activeQuest:ActiveQuest = this.activeQuests[this.selectedButtonIndex + this.currentRow];
         this.onLeave(null);
         if(activeQuest.questType != QuestItem.QUEST_BOUNTYBOARD)
         {
            npcxml = new XMLNpc(null);
            npcxml.initProcGenNPC(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date);
            QuestEngine.putProcGenInNPCHolder(npcxml.getMCSString(),npcxml.name);
         }
         var data:XMLQuest = QuestGenerator.instance.generateQuest(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.questType,activeQuest.questReason,activeQuest.questGiver,activeQuest.questTargetLocation);
         QuestEngine.insertQuestData(data);
         Overworld.startQuestStepIntro(QuestGenerator.PROCGENQUEST,2);
      }
      
      public function onQuestButtonClick(mouseEvent:MouseEvent) : *
      {
         var questlogbutton:QuestLogButton = mouseEvent.target.parent as QuestLogButton;
         for(var i:int = 0; i < this.questLogButtonList.length; i++)
         {
            this.questLogButtonList[i].setGotSelected(this.questLogButtonList[i] == questlogbutton);
         }
         this.selectedButtonIndex = questlogbutton.getIndex();
         this.showDesc();
      }
      
      public function showDesc() : *
      {
         var activeQuest:ActiveQuest = null;
         var rewardStr:String = null;
         var questStep:XMLQuestStep = null;
         var data:XMLQuest = null;
         var questlvl:int = 0;
         this.teleportbutton.visible = true;
         this.goldicon.visible = true;
         this.abandonbutton.visible = true;
         this.rewardlabel.visible = true;
         this.rewardtext.visible = true;
         this.completebutton.visible = false;
         StatsManager.setStat(StatsManager.STAT_MARKEDNODE,this.selectedButtonIndex + this.currentRow);
         if(this.selectedButtonIndex != -1 && this.selectedButtonIndex + this.currentRow >= this.activeQuests.length && this.activeQuests.length > 0)
         {
            this.selectedButtonIndex = 0;
            this.currentRow = 0;
         }
         if(this.selectedButtonIndex != -1)
         {
            activeQuest = this.activeQuests[this.selectedButtonIndex + this.currentRow];
         }
         else
         {
            activeQuest = null;
         }
         if(activeQuest == null)
         {
            this.objectivetext.text = "";
            this.locationtext.text = "";
            this.rewardtext.text = "";
            this.completebutton.visible = false;
            this.teleportbutton.visible = false;
            this.goldicon.visible = false;
            this.abandonbutton.visible = false;
            OverworldHUD.instance.setActiveQuestText("");
         }
         else if(activeQuest.isProcGenDailyQuest)
         {
            data = QuestGenerator.instance.generateQuest(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.questType,activeQuest.questReason,activeQuest.questGiver,activeQuest.questTargetLocation);
            questStep = data.getStep(activeQuest.step);
            this.objectivetext.text = questStep.title + "\n" + LangManager.getString(536);
            this.locationtext.text = NodeGenerator.instance.getQuestLogDescriptiveNodeName(activeQuest.targetnodeid,activeQuest.targetroomid) + "\n" + NodeGenerator.instance.getNodeNameCode(activeQuest.targetnodeid);
            rewardStr = this.parseReward(questStep.reward);
            this.rewardlabel.visible = rewardStr != "";
            this.rewardtext.visible = rewardStr != "";
            this.rewardtext.text = rewardStr;
            this.completebutton.visible = !activeQuest.isForTrade() && activeQuest.canAutoTurnIn();
            OverworldHUD.instance.setActiveQuestText(questStep.title,data.type);
         }
         else
         {
            activeQuest.getDataFromQuestEngine();
            if(activeQuest.questType != -1)
            {
               if(activeQuest.questType == QuestType.StoryQuest)
               {
                  this.abandonbutton.visible = false;
                  if(this.canFreeTeleport(activeQuest))
                  {
                     this.goldicon.visible = false;
                  }
               }
               else if(activeQuest.questType == QuestType.ClanQuest)
               {
                  this.abandonbutton.visible = false;
                  this.goldicon.visible = false;
                  if(activeQuest.targetnodeid == StageManager.getCurrentNode() && StageManager.getCurrentRoom() != 0)
                  {
                     this.teleportbutton.visible = false;
                  }
               }
               questStep = QuestEngine.getQuestStepDetails(activeQuest.questID,activeQuest.step);
               if(questStep == null)
               {
                  return;
               }
               this.objectivetext.text = questStep.title;
               questlvl = NodeGenerator.instance.getNodeLevel(activeQuest.targetnodeid);
               if(questlvl > StatsManager.getLevel())
               {
                  this.objectivetext.appendText("\n(Recommended level: " + questlvl + ")");
               }
               if(activeQuest.questType == QuestType.ClanQuest)
               {
                  this.locationtext.text = LangManager.getString(718);
               }
               else
               {
                  this.locationtext.text = NodeGenerator.instance.getQuestLogDescriptiveNodeName(activeQuest.targetnodeid,activeQuest.targetroomid) + "\n" + NodeGenerator.instance.getNodeNameCode(activeQuest.targetnodeid);
               }
               rewardStr = this.parseReward(questStep.reward);
               this.rewardlabel.visible = rewardStr != "";
               this.rewardtext.visible = rewardStr != "";
               this.rewardtext.text = rewardStr;
               OverworldHUD.instance.setActiveQuestText(questStep.title,activeQuest.questType);
            }
         }
      }
      
      internal function canFreeTeleport(activeQuest:ActiveQuest) : Boolean
      {
         var targetPt:Point = null;
         var currentPt:Point = null;
         var dist:int = 0;
         if(activeQuest.step == 0 && !activeQuest.isProcGenDailyQuest && activeQuest.questType == QuestType.StoryQuest)
         {
            targetPt = NodeGenerator.instance.getTerritory(activeQuest.targetnodeid);
            currentPt = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
            dist = Math.abs(targetPt.x - currentPt.x) + Math.abs(targetPt.y - currentPt.y);
            if(dist >= 5)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function parseReward(reward:XMLList) : String
      {
         var rewardXML:XMLReward = null;
         var xpReward:int = 0;
         var coinReward:int = 0;
         var townProsperityReward:int = 0;
         var itemStr:String = null;
         var max:int = 0;
         var loot:XMLLoot = null;
         var lootType:int = 0;
         var qty:int = 0;
         var item:Item = null;
         var i:int = 0;
         var rewardStr:String = null;
         if(reward != null)
         {
            rewardXML = new XMLReward(reward);
            xpReward = int(reward.exp);
            coinReward = 0;
            townProsperityReward = 0;
            itemStr = "";
            max = int(rewardXML.loot.length);
            for(i = 0; i < max; i++)
            {
               loot = rewardXML.loot[i];
               qty = loot.qty;
               if(loot.id.indexOf(",") == -1)
               {
                  item = null;
                  lootType = int(loot.id);
               }
               else
               {
                  item = Item.parseNoQty(loot.id);
               }
               if(item != null)
               {
                  if(itemStr == "")
                  {
                     if(qty > 1)
                     {
                        itemStr = qty + "x " + item.getPlainName();
                     }
                     else if(qty == 1)
                     {
                        itemStr = item.getPlainName();
                     }
                  }
                  else if(qty > 1)
                  {
                     itemStr += "\n" + qty + "x " + item.getPlainName();
                  }
                  else if(qty == 1)
                  {
                     itemStr += "\n" + item.getPlainName();
                  }
               }
               else if(lootType == 0 || lootType == 11)
               {
                  coinReward += qty;
               }
               else if(lootType == 1)
               {
                  coinReward += 5 * qty;
               }
               else if(lootType == 50007)
               {
                  townProsperityReward += qty;
               }
               else if(itemStr == "")
               {
                  if(qty > 1)
                  {
                     itemStr = qty + "x " + new Item(lootType).getPlainName();
                  }
                  else if(qty == 1)
                  {
                     itemStr = new Item(lootType).getPlainName();
                  }
               }
               else if(qty > 1)
               {
                  itemStr += "\n" + qty + "x " + new Item(lootType).getPlainName();
               }
               else if(qty == 1)
               {
                  itemStr += "\n" + new Item(lootType).getPlainName();
               }
            }
            rewardStr = "";
            if(xpReward > 0)
            {
               rewardStr += xpReward + " XP\n";
            }
            if(coinReward > 0)
            {
               rewardStr += coinReward + " coins\n";
            }
            if(townProsperityReward > 0)
            {
               rewardStr += "Town Prosperity: +" + townProsperityReward + "\n";
            }
            return rewardStr + itemStr;
         }
         return "";
      }
      
      public function show() : void
      {
         this.addEventListeners();
         this.currentRow = 0;
         this.initQuestList();
         this.refreshQuestList();
         this.visible = true;
         Tracker.instance.trackShowQuestLogUI();
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
         this.questAbandoned = false;
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
      }
      
      public function initQuestList() : void
      {
         this.activeQuests = StatsManager.activeQuestList;
         this.maxLength = this.activeQuests.length;
         this.maxRow = this.maxLength - this.questLogButtonList.length;
         if(this.maxRow < 0)
         {
            this.maxRow = 0;
         }
         if(this.currentRow > this.maxRow)
         {
            this.currentRow = this.maxRow;
         }
      }
      
      public function refreshQuestList() : void
      {
         var length:int = 0;
         var maxCount:int = 0;
         var questIndex:int = 0;
         var questData:XMLQuest = null;
         var activeQuest:ActiveQuest = null;
         var count:int = 0;
         var npcname:String = null;
         var titlestr:String = null;
         var data:XMLQuest = null;
         length = int(this.questLogButtonList.length);
         for(var i:int = 0; i < length; i++)
         {
            this.questLogButtonList[i].visible = false;
         }
         this.questScrollUpButton.visible = this.currentRow > 0;
         this.questScrollDownButton.visible = this.activeQuests.length - this.currentRow > length;
         var markedNode:int = StatsManager.getPlayerStats(StatsManager.STAT_MARKEDNODE);
         this.selectedButtonIndex = -1;
         if(this.maxLength > 0)
         {
            this.noquesttext.text = "";
            maxCount = int(this.questLogButtonList.length);
            if(maxCount > this.maxLength - this.currentRow)
            {
               maxCount = this.maxLength - this.currentRow;
            }
            for(count = 0; count < maxCount; count++)
            {
               questIndex = count + this.currentRow;
               if(questIndex == markedNode)
               {
                  this.questLogButtonList[count].setGotSelected(true);
                  this.selectedButtonIndex = count;
                  this.showDesc();
               }
               else
               {
                  this.questLogButtonList[count].setGotSelected(false);
               }
               activeQuest = this.activeQuests[questIndex];
               if(activeQuest.questType == QuestItem.QUEST_ITEM || activeQuest.questType == QuestItem.QUEST_TRADE)
               {
                  npcname = QuestGenerator.instance.getNPCName(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date);
                  if(activeQuest.isForTrade())
                  {
                     titlestr = npcname + "\'s Trade";
                  }
                  else
                  {
                     titlestr = npcname + "\'s Quest";
                  }
                  this.questLogButtonList[count].setTitle(titlestr);
                  this.questLogButtonList[count].visible = true;
               }
               else if(activeQuest.isProcGenDailyQuest)
               {
                  data = QuestGenerator.instance.generateQuest(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.questType,activeQuest.questReason,activeQuest.questGiver,activeQuest.questTargetLocation);
                  this.questLogButtonList[count].setTitle(data.name);
                  this.questLogButtonList[count].visible = true;
               }
               else
               {
                  questData = QuestEngine.getQuestData(activeQuest.questID);
                  if(questData != null)
                  {
                     this.questLogButtonList[count].setTitle(questData.name);
                     this.questLogButtonList[count].visible = true;
                  }
               }
            }
         }
         else
         {
            this.noquesttext.text = LangManager.getString(79);
            this.teleportbutton.visible = false;
            this.goldicon.visible = false;
            this.abandonbutton.visible = false;
            this.objectivetext.text = "";
            this.locationtext.text = "";
            this.rewardtext.text = "";
            this.goldicon.visible = false;
            this.teleportbutton.visible = false;
            this.completebutton.visible = false;
            this.objectivelabel.visible = false;
            this.locationlabel.visible = false;
            this.rewardlabel.visible = false;
         }
         if(this.selectedButtonIndex == -1 && this.maxLength > 0)
         {
            this.objectivetext.text = "";
            this.locationtext.text = "";
            this.rewardtext.text = "";
            this.completebutton.visible = false;
            this.teleportbutton.visible = false;
            this.goldicon.visible = false;
            this.abandonbutton.visible = false;
            this.objectivelabel.visible = false;
            this.locationlabel.visible = false;
            this.rewardlabel.visible = false;
         }
      }
      
      public function abandonQuest() : *
      {
         if(StatsManager.abandonQuest(this.activeQuests[this.currentRow + this.selectedButtonIndex]))
         {
            this.initQuestList();
            this.refreshQuestList();
            this.questAbandoned = true;
            this.teleportbutton.visible = false;
            this.goldicon.visible = false;
            this.abandonbutton.visible = false;
            Tracker.instance.trackAbandonQuest(this.currentRow + this.selectedButtonIndex);
         }
         else
         {
            trace("QuestLogUI.abandonQuest error");
         }
      }
   }
}

