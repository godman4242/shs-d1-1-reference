package
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol173")]
   public class Overworld extends MovieClip
   {
      
      public static var currentNode:int;
      
      public static var firstUpdate:Boolean;
      
      public static var map:OverworldMap;
      
      public static var overworldHUD:OverworldHUD;
      
      private static var currentQuest:int;
      
      private static var currentStep:int;
      
      public static var doWhiteIn:Boolean = false;
      
      public function Overworld(stageMC:Stage)
      {
         super();
         overworldHUD = OverworldHUD.getInstance();
         overworldHUD.initForOverworld();
         stageMC.addChild(overworldHUD);
         overworldHUD.visible = true;
         currentNode = StatsManager.getLocation();
         StatsManager.refreshStats();
         overworldHUD.updateHUD();
         overworldHUD.screenTransition.startOpen(ScreenTransition.ACTION_NOTHING);
         firstUpdate = true;
      }
      
      public static function showLootDialog() : *
      {
         var oldLevel:int = StatsManager.getLevel();
         overworldHUD.lootDialog.show();
         var newLevel:* = StatsManager.getLevel();
         if(oldLevel < newLevel)
         {
            showLevelUpDialog(newLevel - oldLevel);
         }
         overworldHUD.updateHUD();
      }
      
      public static function setCurrentNode(num:int) : *
      {
         currentNode = num;
      }
      
      public static function getCurrentNode() : int
      {
         return currentNode;
      }
      
      public static function showLevelUpDialog(levelIncrease:int) : *
      {
         var newLevel:* = undefined;
         newLevel = StatsManager.getLevel();
         var requiredXP:int = StatsManager.getXPLevelThreshhold(newLevel) - StatsManager.getXP();
         overworldHUD.levelUpDialog.show(newLevel,requiredXP,levelIncrease);
         overworldHUD.levelUpDialog.setNextDialog(overworldHUD.lootDialog);
         overworldHUD.lootDialog.visible = false;
         overworldHUD.reportLevelUp(newLevel);
      }
      
      public static function update() : *
      {
         map.update();
      }
      
      public static function updateNodeData(id:int) : *
      {
         var autoQuest:QuestAction = null;
         var max:int = 0;
         var currentQuest:QuestAction = null;
         currentNode = id;
         overworldHUD.getNodeUI().visible = false;
         overworldHUD.getNodeUI().clearActionButtonList();
         var node:XMLWorldNode = QuestEngine.getNodeData(currentNode);
         var questAction:Vector.<QuestAction> = QuestEngine.getCachedQuestActions();
         var length:int = int(questAction.length);
         var autoActive:Boolean = false;
         for(var i:int = 0; i < length; i++)
         {
            if(GameEngine.gameMode == GameEngine.MODE_OVERWORLD && questAction[i].auto > 0)
            {
               autoActive = true;
               autoQuest = questAction[i];
               startQuestStepIntro(autoQuest.id,autoQuest.stepNo);
               return;
            }
         }
         if(autoActive == false)
         {
            if(node.hasRooms())
            {
               overworldHUD.getNodeUI().addActionButton(NodeUI.ACTION_ENTER,true);
            }
            overworldHUD.getNodeUI().setNode(node.type,node.name,true);
            max = int(questAction.length);
            for(i = 0; i < max; i++)
            {
               currentQuest = questAction[i];
               if(currentQuest.stepTitle != "" && currentQuest.type != QuestType.Dialogue)
               {
                  if(currentQuest.getRoomObj() != null)
                  {
                     overworldHUD.getNodeUI().addDummyQuestButton(currentQuest.title,currentQuest.stepTitle,currentQuest.type,currentQuest.id,currentQuest.stepNo,currentQuest.ap);
                  }
                  else
                  {
                     overworldHUD.getNodeUI().addQuestButton(currentQuest.title,currentQuest.stepTitle,currentQuest.type,currentQuest.id,currentQuest.stepNo,currentQuest.ap);
                  }
               }
               if(overworldHUD.getNodeUI().getButtonCount() == 7)
               {
                  break;
               }
            }
            overworldHUD.getNodeUI().visible = true;
         }
      }
      
      public static function displayNodeContents(id:int, connected:Boolean) : void
      {
         var currentQuest:QuestAction = null;
         currentNode = id;
         overworldHUD.getNodeUI().visible = false;
         var node:XMLWorldNode = QuestEngine.getNodeData(currentNode);
         var nodeQuestActions:Vector.<QuestAction> = QuestEngine.getQuestActions(currentNode,node.map);
         overworldHUD.getNodeUI().clearActionButtonList();
         if(connected)
         {
            overworldHUD.getNodeUI().addActionButton(NodeUI.ACTION_TRAVEL,true);
         }
         overworldHUD.getNodeUI().setNode(node.type,node.name,false);
         var max:int = int(nodeQuestActions.length);
         var nodeQuests:Vector.<QuestAction> = new Vector.<QuestAction>();
         var count:int = 0;
         for(var i:int = 0; i < max; i++)
         {
            currentQuest = nodeQuestActions[i];
            if(currentQuest.stepTitle != "" && currentQuest.stepNo == 0)
            {
               count++;
            }
            else if(currentQuest.stepTitle != "")
            {
               overworldHUD.getNodeUI().addDummyQuestButton(currentQuest.title,currentQuest.stepTitle,currentQuest.type,currentQuest.id,currentQuest.stepNo,currentQuest.ap);
            }
            if(overworldHUD.getNodeUI().getButtonCount() == 7)
            {
               break;
            }
         }
         if(count > 0)
         {
            overworldHUD.getNodeUI().addDummyQuestButton("",LangManager.getString(194),0,0,0,0);
         }
         overworldHUD.getNodeUI().visible = true;
      }
      
      public static function pickNumbers(count:int, max:int) : Vector.<int>
      {
         var randnum:int = 0;
         var j:int = 0;
         var exists:Boolean = false;
         var outputtotal:int = 0;
         var output:Vector.<int> = new Vector.<int>();
         if(count > max)
         {
            count = max;
         }
         while(output.length < count)
         {
            randnum = Math.random() * max;
            outputtotal = int(output.length);
            exists = false;
            j = 0;
            while(j < outputtotal && !exists)
            {
               if(output[j] == randnum)
               {
                  exists = true;
               }
               j++;
            }
            if(!exists)
            {
               output.push(randnum);
            }
         }
         return output;
      }
      
      public static function showNodeUI() : *
      {
         overworldHUD.getNodeUI().visible = true;
      }
      
      public static function showOverworldHUD() : *
      {
         overworldHUD.visible = true;
      }
      
      public static function showDuelModeUI() : *
      {
         overworldHUD.onShowDuelMode(null);
      }
      
      public static function showOverworldMap(flag:Boolean) : *
      {
      }
      
      public static function setMapEnabled(flag:Boolean) : *
      {
         if(map != null)
         {
            map.setMapEnabled(flag);
         }
      }
      
      public static function setCurrentQuest(num:int) : *
      {
         currentQuest = num;
      }
      
      public static function refreshMap() : *
      {
         map.refreshMap();
      }
      
      public static function startQuestStepIntro(questID:int, stepID:int) : *
      {
         OverworldHUD.instance.showInteractLabel(0,0,"");
         TutorialUI.instance.setState(0);
         currentQuest = questID;
         currentStep = stepID;
         overworldHUD.getNodeUI().visible = false;
         CutsceneManager.getInstance().loadQuestIntro(QuestEngine.getQuestStepDetails(currentQuest,currentStep).intro);
      }
      
      public static function startQuestStep() : *
      {
         var questStepInfo:XMLQuestStep = null;
         if(currentQuest != QuestGenerator.PROCGENQUEST && QuestEngine.getQuestData(currentQuest).type != QuestType.Dialogue && StatsManager.addActiveQuests(currentQuest) == false)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(195),LangManager.getString(5));
         }
         else
         {
            questStepInfo = QuestEngine.getQuestStepDetails(currentQuest,currentStep);
            if(questStepInfo.action > 0 && questStepInfo.wave.length > 0)
            {
               QuestEngine.startBattleMode(questStepInfo,currentQuest);
            }
            else
            {
               endQuestStepIntro();
            }
         }
      }
      
      public static function endQuestStepIntro() : *
      {
         if(currentQuest == QuestGenerator.DUEL)
         {
            endQuestStep();
         }
         else
         {
            CutsceneManager.getInstance().loadQuestEnding(QuestEngine.getQuestStepDetails(currentQuest,currentStep).ending);
         }
      }
      
      public static function endQuestStep() : *
      {
         var reward:XMLReward = null;
         var lootLevel:int = 0;
         var loot:XMLLoot = null;
         var chance:int = 0;
         var lootType:int = 0;
         var qty:int = 0;
         var item:Item = null;
         var i:int = 0;
         var questCompleted:Boolean = false;
         if(currentQuest == QuestGenerator.PROCGENQUEST)
         {
            questCompleted = StatsManager.completeProcGenQuestStep(QuestGenerator.instance.currentNPCNodeId,QuestGenerator.instance.currentNPCRoomId,QuestGenerator.instance.currentNPCIndex,QuestGenerator.instance.currentNPCDate,QuestGenerator.instance.currentNPCQuestType);
         }
         else if(currentQuest != QuestGenerator.DUEL && QuestEngine.getQuestData(currentQuest).type != QuestType.Dialogue)
         {
            questCompleted = StatsManager.completeQuestStep(currentQuest);
            QuestEngine.removeQuestStepFromCache(currentQuest,currentStep);
            QuestEngine.refreshNodeQuests(StageManager.getCurrentNode());
         }
         if(GameEngine.isOverworld())
         {
            updateNodeData(StatsManager.getLocation());
            map.showConnected();
         }
         else if(GameEngine.isAdventureMode())
         {
            StageManager.showInteractAction(StatsManager.getPlayer().getMCS());
            Minimap.instance.setRoomId(StageManager.getCurrentNode(),StageManager.getCurrentRoom(),StageManager.roomData);
         }
         var max:int = 0;
         if(currentQuest != QuestGenerator.DUEL)
         {
            reward = new XMLReward(QuestEngine.getQuestStepDetails(currentQuest,currentStep).reward);
            if(reward != null && !reward.forShow)
            {
               overworldHUD.lootDialog.addLootXP(reward.exp);
               max = int(reward.loot.length);
               lootLevel = StageManager.getCurrentNodeLevel();
               for(i = 0; i < max; i++)
               {
                  loot = reward.loot[i];
                  chance = loot.chance * 100;
                  qty = loot.qty;
                  if(loot.id.indexOf(",") == -1)
                  {
                     item = null;
                     lootType = int(loot.id);
                  }
                  else
                  {
                     item = Item.parseNoQty(loot.id);
                     item.setQuantity(qty);
                  }
                  if(chance == 100 || Math.random() * 100 < chance)
                  {
                     if(item != null)
                     {
                        if(qty > 0)
                        {
                           overworldHUD.lootDialog.addSpecialItem(item);
                        }
                        else if(qty < 0)
                        {
                           StatsManager.removeItemFromInventory(item);
                        }
                     }
                     else if(lootType == 0 || lootType == 11)
                     {
                        overworldHUD.lootDialog.addLootCoins(qty);
                     }
                     else if(lootType == 1)
                     {
                        overworldHUD.lootDialog.addLootCoins(5 * qty);
                     }
                     else if(lootType == 50007)
                     {
                        StatsManager.changeStat(50007,qty);
                     }
                     else if(qty > 0)
                     {
                        overworldHUD.lootDialog.addLootItem(lootType,lootLevel,qty);
                     }
                     else if(qty < 0)
                     {
                        StatsManager.changeStat(lootType,qty);
                     }
                  }
               }
            }
         }
         if(doWhiteIn)
         {
            doWhiteIn = false;
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
            OverworldHUD.instance.screenTransition.startOpenWhite(ScreenTransition.ACTION_REFRESHROOMONOPEN);
            OverworldHUD.instance.territorymap.setNodeId(currentNode);
         }
         else if(questCompleted)
         {
            if(QuestEngine.getQuestData(currentQuest).showCompletedDialog)
            {
               overworldHUD.showQuestCompletedDialog(currentQuest);
            }
            else if(!overworldHUD.lootDialog.hasLoot() && !overworldHUD.globalVarDialog.hasGlobalVar())
            {
               OverworldHUD.instance.initForAdventureMode();
               OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REFRESHROOM);
            }
         }
         QueryManager.instance.saveModifiedCharData();
         if(!doWhiteIn)
         {
            showLootDialog();
            overworldHUD.globalVarDialog.show();
         }
         currentQuest = QuestGenerator.DUEL;
      }
      
      public static function exploreNode() : *
      {
         QuestEngine.startAdventureMode(currentNode,false);
      }
      
      public function destroy() : *
      {
         OverworldHUD.instance = null;
      }
   }
}

