package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1490")]
   public class DuelModeUI extends MovieClip
   {
      
      public static var instance:DuelModeUI;
      
      public var xpbar:MovieClip;
      
      public var tokenlabel:TextField;
      
      public var rankingUI:DuelLeaderboardUI;
      
      public var slotsUI:MovieClip;
      
      public var bg:MovieClip;
      
      public var tokenText:TextField;
      
      public var DTTimer:TextField;
      
      public var titletext:TextField;
      
      public var loading:MovieClip;
      
      public var getDTButton:SimpleButton;
      
      public var closewindowbutton:SimpleButton;
      
      internal var slots:Vector.<DuelSlot>;
      
      internal var startX:int = 168;
      
      internal var startX2:int = 400;
      
      internal var startY:int = 75;
      
      internal var spacingY:int = 100;
      
      internal var opponentCount:int = 0;
      
      internal var readyForDuel:Boolean = false;
      
      internal var duelCounter:int = -1;
      
      internal var selectedOpponentName:String;
      
      internal var selectedOpponentLvl:int;
      
      internal var selectedOpponentEq:String;
      
      internal var selectedOpponentStats:String;
      
      internal var selectedOpponentSkills:String;
      
      internal var selectedOpponentTaunt:String;
      
      internal var selectedOpponentNid:String;
      
      internal var selectedBG:int;
      
      internal var controlledBy:int;
      
      internal var noAggro:Boolean = false;
      
      public function DuelModeUI()
      {
         var slot:DuelSlot = null;
         var i:int = 0;
         this.slots = new Vector.<DuelSlot>();
         super();
         instance = this;
         LangManager.initTextField(this.loading.prompt);
         this.loading.prompt.text = LangManager.getString(58);
         LangManager.initTextField(this.tokenlabel);
         this.tokenlabel.text = LangManager.getString(59);
         LangManager.initTextField(this.titletext,true);
         this.slotsUI.rankingsButton.setText(LangManager.getString(28));
         LangManager.initTextField(this.slotsUI.tauntlabel);
         this.slotsUI.tauntlabel.text = LangManager.getString(197);
         LangManager.initTextField(this.slotsUI.taunt,false);
         LangManager.initTextField(this.xpbar.labeltext,true);
         this.xpbar.labeltext.text = LangManager.getString(66);
         this.titletext.text = LangManager.getString(60);
         var left:Boolean = true;
         for(i = 0; i < 6; i++)
         {
            slot = new DuelSlot();
            this.slots.push(slot);
            this.slotsUI.addChild(slot);
            if(left)
            {
               slot.x = this.startX;
               slot.y = this.startY + this.spacingY * i / 2;
            }
            else
            {
               slot.x = this.startX2;
               slot.y = this.startY + this.spacingY * (i - 1) / 2;
            }
            left = !left;
         }
         setChildIndex(this.loading,numChildren - 1);
      }
      
      public function show() : *
      {
         this.getDTButton.visible = !QueryManager.instance.offlineMode;
         this.readyForDuel = false;
         this.visible = true;
         this.loading.prompt.text = LangManager.getString(58);
         this.loading.visible = true;
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].visible = false;
         }
         QueryManager.instance.getOpponents();
         this.addEventListeners();
         this.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS).toString();
         this.rankingUI.visible = false;
         this.slotsUI.visible = true;
         this.slotsUI.rankingsButton.visible = true;
         this.slotsUI.refreshbutton.visible = true;
         Tracker.instance.trackShowDuelUI();
         var tauntText:String = StatsManager.getTaunt();
         if(tauntText == null || tauntText == "" || tauntText == "null")
         {
            tauntText = LangManager.getString(198);
         }
         this.slotsUI.taunt.text = tauntText;
         GameEngine.getStageMC().focus = this.slotsUI.taunt;
         this.slotsUI.taunt.setSelection(tauntText.length,tauntText.length);
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
      }
      
      public function showButDontRefresh() : *
      {
         this.visible = true;
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].visible = false;
         }
         this.addEventListeners();
         this.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS).toString();
         this.rankingUI.visible = false;
         this.slotsUI.visible = true;
         this.slotsUI.rankingsButton.visible = true;
         this.slotsUI.refreshbutton.visible = true;
         var tauntText:String = StatsManager.getTaunt();
         if(tauntText == null || tauntText == "" || tauntText == "null")
         {
            tauntText = LangManager.getString(198);
         }
         this.slotsUI.taunt.text = tauntText;
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
      }
      
      public function setDuelList(duelList:String) : *
      {
         var i:int = 0;
         var duelArray:Array = null;
         var npcLastPing:int = 0;
         var networkplayerlist:Vector.<NPC> = null;
         var max:int = 0;
         var playerlevel:int = 0;
         var enemyplayer:EnemyPlayer = null;
         var selectRoom:Array = null;
         var skipThis:Boolean = false;
         var j:int = 0;
         this.clearSlots();
         var charArray:Array = duelList.split("^");
         this.opponentCount = charArray.length;
         if(charArray[this.opponentCount - 1] == "")
         {
            --this.opponentCount;
         }
         var roomArray:Array = new Array();
         var tempDuelSlot:DuelSlot = new DuelSlot();
         var slot1name:String = "";
         var npcData:XMLNpc = QuestEngine.getNPCData(-1);
         if(npcData != null && npcData.nid != "")
         {
            npcLastPing = 0;
            tempDuelSlot.setDuelInfo(npcData.name,npcData.lvl,npcData.getEquipmentStr(),npcLastPing);
            roomArray.push(tempDuelSlot);
            slot1name = npcData.name;
         }
         var slotid:int = 0;
         if(GameEngine.isAdventureMode())
         {
            networkplayerlist = NPCManager.getNetworkPlayerList();
            max = int(networkplayerlist.length);
            playerlevel = StatsManager.getLevel();
            for(i = 0; i < max; i++)
            {
               enemyplayer = networkplayerlist[i] as EnemyPlayer;
               if(Math.abs(enemyplayer.level - playerlevel) < 2 && enemyplayer.charname != slot1name)
               {
                  tempDuelSlot.setDuelInfo(enemyplayer.charname,enemyplayer.level,enemyplayer.equipmentStr,0);
                  roomArray.push(tempDuelSlot);
               }
            }
            selectRoom = this.selectRandom(roomArray.length,6);
            i = 0;
            while(i < selectRoom.length && slotid < 6)
            {
               this.slots[slotid].setDuelInfo(roomArray[selectRoom[i]].charname,roomArray[selectRoom[i]].level,roomArray[selectRoom[i]].equipment,roomArray[selectRoom[i]].timesince);
               slotid++;
               i++;
            }
         }
         i = slotid;
         while(i < this.opponentCount && slotid < 6)
         {
            duelArray = charArray[i].split("$");
            skipThis = false;
            for(j = 0; j < 6; j++)
            {
               if(duelArray[0] == this.slots[j].charname)
               {
                  skipThis = true;
                  break;
               }
            }
            if(!skipThis)
            {
               this.slots[slotid].setDuelInfo(duelArray[0],duelArray[1],duelArray[2],duelArray[3]);
               slotid++;
            }
            i++;
         }
         this.loading.visible = false;
         for(i = 0; i < slotid; i++)
         {
            this.slots[i].visible = true;
         }
      }
      
      internal function clearSlots() : *
      {
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].clearSlot();
         }
      }
      
      internal function selectRandom(total:int, max:int) : Array
      {
         var temp:int = 0;
         var allowAdd:Boolean = false;
         var j:* = undefined;
         var output:Array = new Array();
         var i:int = 0;
         while(i < max && i < total)
         {
            allowAdd = true;
            temp = Math.random() * total;
            for(j = 0; j < output.length; j++)
            {
               if(temp == output[j])
               {
                  allowAdd = false;
               }
            }
            if(allowAdd)
            {
               output.push(temp);
               i++;
            }
         }
         return output;
      }
      
      internal function refreshList(event:MouseEvent) : *
      {
         this.loading.prompt.text = LangManager.getString(58);
         this.loading.visible = true;
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].visible = false;
         }
         QueryManager.instance.getOpponents();
      }
      
      public function updateDT() : *
      {
         this.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS).toString();
      }
      
      public function startDuel(charname:String, level:int, equipment:String) : *
      {
         if(StatsManager.unlimitedAP || StatsManager.getPlayerStats(StatsManager.STAT_DUELTOKENS) > 0)
         {
            this.saveTaunt();
            this.loading.prompt.text = LangManager.getString(25);
            this.loading.visible = true;
            this.noAggro = true;
            StatsManager.changeDT(-1);
            this.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS).toString();
            this.selectedOpponentName = charname;
            this.selectedOpponentLvl = level;
            this.selectedOpponentEq = equipment;
            QueryManager.instance.getOpponentData(charname);
         }
         else
         {
            OverworldHUD.instance.showDialogDT();
         }
      }
      
      public function gotOpponentData(oppPlayerStats:String, oppSkillStats:String, stratusID:String, lastPing:int, taunt:String) : *
      {
         this.selectedOpponentStats = oppPlayerStats;
         this.selectedOpponentSkills = oppSkillStats;
         if(taunt == null || taunt == "" || taunt == "null")
         {
            taunt = LangManager.getString(198);
         }
         this.selectedOpponentTaunt = taunt;
         if(StatsManager.useCirrus && lastPing < 300 && StatsManager.getLevel() > 1 && stratusID != "")
         {
            this.loading.prompt.text = LangManager.getString(180);
            NetworkManager.getInstance().setNetworkMode(NetworkManager.MODE_DUELSETUP_INITIATE);
            if(!StatsManager.usePlayerIOForDuels)
            {
               NetworkManager.getInstance().connect(stratusID);
            }
            else
            {
               NetworkManager.getInstance().connectPIO(this.selectedOpponentName,ConnectionPIO.PURPOSE_DUEL);
            }
            this.readyForDuel = true;
            this.duelCounter = 24 * 20;
         }
         else
         {
            this.proceedWithAI();
         }
      }
      
      public function updateOpponentData(oppPlayerStats:String, equipment:String) : *
      {
         this.selectedOpponentStats = oppPlayerStats;
         this.selectedOpponentEq = equipment;
      }
      
      public function update() : *
      {
         if(this.readyForDuel && this.duelCounter != -1)
         {
            --this.duelCounter;
            if(this.duelCounter == 0)
            {
               NetworkManager.instance.sendCancelDuelChallenge(this.selectedOpponentNid);
               this.proceedWithAI();
            }
         }
      }
      
      public function stopDuelCounter() : *
      {
         this.duelCounter = -1;
      }
      
      public function proceedWithAI() : *
      {
         this.duelCounter = -1;
         this.readyForDuel = false;
         this.controlledBy = 1;
         NetworkManager.instance.setNetworkMode(NetworkManager.MODE_DUELLING);
         this.proceedWithDuel("",true);
         Tracker.instance.trackAIDuelStart();
      }
      
      public function proceedWithHumanOpponent(nid:String, initiator:Boolean) : *
      {
         this.duelCounter = -1;
         this.readyForDuel = false;
         this.controlledBy = 2;
         this.proceedWithDuel(nid,initiator);
         Tracker.instance.trackPvPDuelStart();
      }
      
      public function setOpponentFields(name:String, lvl:String, stats:String, equipment:String, skills:String, taunt:String) : *
      {
         this.selectedOpponentName = name;
         this.selectedOpponentLvl = int(lvl);
         this.selectedOpponentStats = stats;
         this.selectedOpponentEq = equipment;
         this.selectedOpponentSkills = skills;
         this.selectedOpponentTaunt = taunt;
      }
      
      public function proceedWithDuel(nid:String, initiator:Boolean) : *
      {
         NetworkManager.getInstance().leaveRoom();
         var npcXML:XMLNpc = new XMLNpc(null);
         npcXML.initDuelist(this.selectedOpponentName,this.selectedOpponentLvl,this.selectedOpponentStats,this.selectedOpponentEq,this.selectedOpponentSkills,this.controlledBy,nid,initiator);
         QuestEngine.insertNPCData(npcXML);
         this.loading.visible = false;
         var wave:XMLQuestWave = new XMLQuestWave(null);
         wave.initDuel();
         var wavelist:Vector.<XMLQuestWave> = new Vector.<XMLQuestWave>(1);
         wavelist[0] = wave;
         var startingPosX:int = 150;
         if(!initiator)
         {
            startingPosX = 650;
         }
         Overworld.setCurrentQuest(-1);
         GameEngine.initBattleMode(-1,6,this.selectedBG,1000,0,wavelist,startingPosX);
         this.visible = false;
         if(!initiator)
         {
            NetworkManager.instance.duelPing(true);
         }
         this.noAggro = false;
      }
      
      public function proceedWithRecordedDuel(player1:Object, player2:Object) : *
      {
         var npcXML:XMLNpc = new XMLNpc(null);
         npcXML.initDuelist(" " + player1.charname,player1.charlvl,player1.stats,player1.equip,player1.skills,2,"0",false);
         npcXML.id = 700;
         QuestEngine.insertNPCData(npcXML);
         npcXML = new XMLNpc(null);
         npcXML.initDuelist(" " + player2.charname,player2.charlvl,player2.stats,player2.equip,player2.skills,2,"1",true);
         npcXML.id = 701;
         QuestEngine.insertNPCData(npcXML);
         var wave:XMLQuestWave = new XMLQuestWave(null);
         wave.initRecordedDuel();
         var wavelist:Vector.<XMLQuestWave> = new Vector.<XMLQuestWave>(1);
         wavelist[0] = wave;
         Overworld.setCurrentQuest(-1);
         GameEngine.initBattleMode(-1,11,player1.bg,1000,0,wavelist,150);
         this.visible = false;
      }
      
      public function proceedWithCutscene(playerArray:Array) : *
      {
         var player:Object = null;
         var bg:int = 0;
         var npcXML:XMLNpc = null;
         var max:int = int(playerArray.length);
         for(var i:int = 0; i < max; i++)
         {
            player = playerArray[i];
            npcXML = new XMLNpc(null);
            npcXML.initDuelist(" " + player.charname,player.charlvl,player.stats,player.equip,player.skills,2,"0",false);
            npcXML.id = 700 + i;
            if(i == 0)
            {
               bg = int(player.bg);
            }
            QuestEngine.insertNPCData(npcXML);
         }
         var wave:XMLQuestWave = new XMLQuestWave(null);
         wave.initCutscene(max);
         var wavelist:Vector.<XMLQuestWave> = new Vector.<XMLQuestWave>(1);
         wavelist[0] = wave;
         Overworld.setCurrentQuest(-1);
         GameEngine.initBattleMode(-1,13,bg,1000,0,wavelist,150);
         this.visible = false;
      }
      
      internal function addEventListeners() : *
      {
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.slotsUI.rankingsButton.addEventListener(MouseEvent.CLICK,this.showRankings);
         this.slotsUI.rankingsButton.addEventListeners();
         this.slotsUI.refreshbutton.addEventListener(MouseEvent.CLICK,this.refreshList);
         this.getDTButton.addEventListener(MouseEvent.CLICK,this.showGetDT);
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].addEventListeners();
         }
      }
      
      internal function removeEventListeners() : *
      {
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.slotsUI.rankingsButton.removeEventListener(MouseEvent.CLICK,this.showRankings);
         this.slotsUI.rankingsButton.removeEventListeners();
         this.slotsUI.refreshbutton.removeEventListener(MouseEvent.CLICK,this.refreshList);
         this.getDTButton.removeEventListener(MouseEvent.CLICK,this.showGetDT);
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].removeEventListeners();
         }
      }
      
      public function onLeave(event:MouseEvent) : void
      {
         if(this.loading.visible)
         {
            return;
         }
         this.removeEventListeners();
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(true);
         }
         else
         {
            InputManager.setAdventureMode();
            NetworkManager.instance.playerUpdateBusy(false);
         }
         this.visible = false;
         OverworldHUD.instance.unHideAll();
         this.saveTaunt();
         if(event != null)
         {
            QuestEngine.removeNPCData(-1);
            trace("removed npc -1");
         }
         StatsManager.parseGiftNotificationsString();
         this.noAggro = false;
      }
      
      public function setLeaderboard(charlist:String) : *
      {
         this.rankingUI.setLeaderboard(charlist);
      }
      
      internal function showRankings(event:MouseEvent) : *
      {
         this.rankingUI.show(this.loading);
         this.slotsUI.visible = false;
         this.slotsUI.refreshbutton.visible = false;
         this.slotsUI.rankingsButton.visible = false;
         for(var i:int = 0; i < 6; i++)
         {
            this.slots[i].visible = false;
         }
         Tracker.instance.trackShowRankings();
      }
      
      public function returnFromRankings() : *
      {
         this.slotsUI.rankingsButton.visible = true;
         this.slotsUI.refreshbutton.visible = true;
         this.slotsUI.visible = true;
         for(var i:int = 0; i < this.opponentCount; i++)
         {
            this.slots[i].visible = true;
         }
      }
      
      public function ioError() : *
      {
         this.rankingUI.onLeave(null);
         this.loading.visible = false;
      }
      
      public function getTaunt() : String
      {
         return this.selectedOpponentTaunt;
      }
      
      public function setOpponentTaunt(str:String) : *
      {
         this.selectedOpponentTaunt = str;
      }
      
      public function saveTaunt() : *
      {
         if(this.slotsUI.taunt.text != "" && this.slotsUI.taunt.text != StatsManager.getTaunt())
         {
            this.slotsUI.taunt.text = this.slotsUI.taunt.text.split("(").join("");
            this.slotsUI.taunt.text = this.slotsUI.taunt.text.split(")").join("");
            this.slotsUI.taunt.text = this.slotsUI.taunt.text.split("^").join("");
            StatsManager.setTaunt(OverworldHUD.instance.censorWords(this.slotsUI.taunt.text));
            QueryManager.instance.reportDataModified(StatsManager.TAUNT);
            QueryManager.instance.saveModifiedCharData();
         }
      }
      
      public function cancelDuelChallenge() : *
      {
         this.loading.visible = false;
         this.readyForDuel = false;
         NetworkManager.instance.sendCancelDuelChallenge(this.selectedOpponentNid);
      }
      
      public function setSelectedOpponentNid(str:String) : *
      {
         this.selectedOpponentNid = str;
      }
      
      public function initBG() : int
      {
         this.selectedBG = Math.random() * 15;
         if(this.selectedBG == 12)
         {
            this.selectedBG = GameStage.BG_DESTROYEDVILLAGE;
         }
         else if(this.selectedBG == 13)
         {
            this.selectedBG = GameStage.BG_MOUNTAINPATH;
         }
         else if(this.selectedBG == 14)
         {
            this.selectedBG = GameStage.BG_TEMPLEEXTERIOR;
         }
         return this.selectedBG;
      }
      
      public function setBG(num:int) : *
      {
         this.selectedBG = num;
      }
      
      public function getBG() : int
      {
         return this.selectedBG;
      }
      
      public function isReadyForDuel() : Boolean
      {
         return this.readyForDuel;
      }
      
      public function showGetDT(mouseEvent:MouseEvent) : *
      {
         this.onLeave(null);
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_GETAP);
      }
   }
}

