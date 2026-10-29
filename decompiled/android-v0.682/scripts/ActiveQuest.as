package
{
   import flash.utils.getDefinitionByName;
   
   public class ActiveQuest
   {
      
      public var questID:int;
      
      public var step:int;
      
      internal var isProcGenDailyQuest:Boolean = false;
      
      internal var nodeid:int;
      
      internal var roomid:int;
      
      internal var npcindex:int;
      
      internal var date:int;
      
      internal var targetnodeid:int;
      
      internal var targetroomid:int;
      
      internal var targetnpcindex:int;
      
      internal var questType:int = -1;
      
      public var questReason:int = -1;
      
      public var questTargetLocation:int = -1;
      
      public var questGiver:int = -1;
      
      internal var targetnpcname:String;
      
      public function ActiveQuest(ID:int = 0, currentStep:int = 0)
      {
         super();
         this.questID = ID;
         this.step = currentStep;
         this.getDataFromQuestEngine();
      }
      
      public static function parse(str:String) : ActiveQuest
      {
         var activeQuest:* = undefined;
         var strArray:Array = str.split(",");
         if(strArray.length == 0)
         {
            return null;
         }
         if(strArray.length == 10 && strArray[0] == "p")
         {
            if(int(strArray[5]) != QueryManager.instance.getServerDate())
            {
               return null;
            }
            activeQuest = new ActiveQuest(-1,strArray[1]);
            activeQuest.setProcGenDailyQuest(strArray[2],strArray[3],strArray[4],strArray[5],strArray[6],strArray[7],strArray[8],strArray[8]);
            return activeQuest;
         }
         if(strArray.length == 2)
         {
            return new ActiveQuest(strArray[0],strArray[1]);
         }
         return null;
      }
      
      internal function getDataFromQuestEngine() : *
      {
         var questxml:XMLQuest = null;
         var queststepxml:XMLQuestStep = null;
         var roomObj:XMLList = null;
         this.targetnodeid = -1;
         if(this.questID != -1)
         {
            questxml = QuestEngine.getQuestData(this.questID);
            if(questxml != null)
            {
               this.questType = questxml.type;
               queststepxml = questxml.getStep(this.step);
               if(queststepxml != null)
               {
                  this.targetnodeid = queststepxml.nodeID;
                  roomObj = queststepxml.getRoomObj();
                  if(roomObj != null)
                  {
                     this.targetroomid = roomObj.room;
                     this.targetnpcname = roomObj.name.toString();
                  }
               }
            }
         }
      }
      
      public function nextStep() : *
      {
         ++this.step;
         this.getDataFromQuestEngine();
         this.displayQuestTitleInNodeUI();
      }
      
      public function forClanQuest() : Boolean
      {
         return !this.isProcGenDailyQuest && this.questType == QuestType.ClanQuest;
      }
      
      public function setProcGenDailyQuest(nodeid:int, roomid:int, npcindex:int, date:int, questType:int, questReason:int, questGiver:int, questTargetLocation:int) : *
      {
         this.isProcGenDailyQuest = true;
         this.nodeid = nodeid;
         this.roomid = roomid;
         this.npcindex = npcindex;
         this.date = date;
         this.questType = questType;
         this.questReason = questReason;
         this.questTargetLocation = questTargetLocation;
         this.questGiver = questGiver;
         if(questType == QuestItem.QUEST_TRADE)
         {
            this.step = 3;
         }
         else
         {
            this.step = 1;
         }
         var quest:XMLQuest = QuestGenerator.instance.generateQuest(nodeid,roomid,npcindex,date,questType,questReason,questGiver,questTargetLocation);
         var questStep:XMLQuestStep = quest.getStep(this.step);
         if(questStep != null)
         {
            this.targetnodeid = questStep.nodeID;
            this.targetroomid = questStep.getRoomId();
            if(questType == QuestItem.QUEST_ITEM)
            {
               this.targetnpcindex = QuestGenerator.instance.getNPCQuestItem(nodeid,roomid,npcindex,date).getNpcIndex();
            }
            else if(questType == QuestItem.QUEST_TRADE)
            {
               this.targetnpcindex = QuestGenerator.instance.getNPCTradeWantItem(nodeid,roomid,npcindex,date).getNpcIndex();
            }
            else
            {
               this.targetnpcindex = -1;
            }
         }
      }
      
      public function hasProcGenQuestAtLocation(nodeid:int, roomid:int, date:int, questType:int = -1) : Boolean
      {
         if(!this.isProcGenDailyQuest)
         {
            return false;
         }
         if(this.isKillQuest() && this.step > 1)
         {
            return false;
         }
         if(questType == -1)
         {
            return this.isProcGenDailyQuest && this.targetnodeid == nodeid && this.targetroomid == roomid && this.date == date;
         }
         return this.isProcGenDailyQuest && this.targetnodeid == nodeid && this.targetroomid == roomid && this.date == date && this.questType == questType;
      }
      
      public function hasProcGenDailyQuest(nodeid:int, roomid:int, npcindex:int, date:int, forTrade:Boolean) : *
      {
         return this.isProcGenDailyQuest && this.nodeid == nodeid && this.roomid == roomid && this.npcindex == npcindex && this.date == date && this.isForTrade() == forTrade;
      }
      
      public function isForTrade() : Boolean
      {
         return this.questType == QuestItem.QUEST_TRADE;
      }
      
      public function getMarkedNode() : int
      {
         return this.targetnodeid;
      }
      
      public function getMarkedRoom() : int
      {
         return this.targetroomid;
      }
      
      public function isMarkedNPC(_nodeid:int, _roomid:int, _index:int, _date:int) : Boolean
      {
         if(this.isProcGenDailyQuest)
         {
            if(this.date != _date)
            {
               return false;
            }
            if(this.questType == QuestItem.QUEST_ITEM || this.questType == QuestItem.QUEST_TRADE)
            {
               if(this.step == 1)
               {
                  return this.targetnodeid == _nodeid && this.targetroomid == _roomid && this.targetnpcindex == _index;
               }
               if(this.step == 2)
               {
                  return this.nodeid == _nodeid && this.roomid == _roomid && this.npcindex == _index;
               }
            }
         }
         return false;
      }
      
      internal function isKillQuest() : Boolean
      {
         return this.questType == QuestItem.QUEST_BOUNTYBOARD || this.questType == QuestItem.QUEST_KILLWILDLIFE || this.questType == QuestItem.QUEST_KILLBANDIT || this.questType == QuestItem.QUEST_KILLONI || this.questType == QuestItem.QUEST_KILLUNDEAD;
      }
      
      public function hasStageObject() : Boolean
      {
         return (this.isKillQuest() || this.questType == QuestItem.QUEST_SUMMONNINJA || this.questType == QuestItem.QUEST_SUMMONMERC || this.questType == QuestItem.QUEST_UNWANTEDMERC || this.questType == QuestItem.QUEST_GRAVEYARD || this.questType == QuestItem.QUEST_GUIDE) && this.step == 1;
      }
      
      public function procGenNextStep() : *
      {
         var quest:XMLQuest = null;
         var questStep:XMLQuestStep = null;
         if(this.isKillQuest() || this.questType == QuestItem.QUEST_ITEM || this.questType == QuestItem.QUEST_SUMMONONI || this.questType == QuestItem.QUEST_SUMMONMERC || this.questType == QuestItem.QUEST_UNWANTEDMERC || this.questType == QuestItem.QUEST_GRAVEYARD)
         {
            if(this.step == 1)
            {
               this.step = 2;
               this.targetnodeid = this.nodeid;
               this.targetroomid = this.roomid;
               this.targetnpcindex = this.npcindex;
            }
         }
         else if(this.questType == QuestItem.QUEST_TRADE)
         {
            if(this.step == 3)
            {
               ++this.step;
               this.targetnodeid = this.nodeid;
               this.targetroomid = this.roomid;
               this.targetnpcindex = this.npcindex;
            }
         }
         else
         {
            ++this.step;
            quest = QuestGenerator.instance.generateQuest(this.nodeid,this.roomid,this.npcindex,this.date,this.questType,this.questReason,this.questGiver,this.questTargetLocation);
            questStep = quest.getStep(this.step);
            if(questStep != null)
            {
               this.targetnodeid = questStep.nodeID;
               this.targetroomid = questStep.getRoomId();
               this.targetnpcindex = -1;
            }
         }
         this.displayQuestTitleInNodeUI();
      }
      
      public function hasTarget(nodeid:int, roomid:int, npcindex:int) : *
      {
         return this.targetnodeid == nodeid && this.targetroomid == roomid && this.targetnpcindex == npcindex;
      }
      
      public function canAutoTurnIn() : Boolean
      {
         if(this.questType == QuestItem.QUEST_ITEM || this.isKillQuest() || this.questType == QuestItem.QUEST_SUMMONONI || this.questType == QuestItem.QUEST_SUMMONNINJA || this.questType == QuestItem.QUEST_SUMMONMERC || this.questType == QuestItem.QUEST_UNWANTEDMERC || this.questType == QuestItem.QUEST_GRAVEYARD)
         {
            if(this.step == 2)
            {
               return true;
            }
         }
         else if(this.questType == QuestItem.QUEST_GIVEORE || this.questType == QuestItem.QUEST_GIVECROPS)
         {
            return true;
         }
         return false;
      }
      
      public function isReadyToTurnInQuest(forTrade:Boolean) : Boolean
      {
         var item:Item = null;
         if(this.questType == QuestItem.QUEST_ITEM || this.questType == QuestItem.QUEST_TRADE || this.questType == QuestItem.QUEST_BOUNTYBOARD)
         {
            item = QuestGenerator.instance.getNPCQuestItem(this.nodeid,this.roomid,this.npcindex,this.date,forTrade).getItem();
            if(StatsManager.findSpecialQuestItem(item) == null)
            {
               if(StatsManager.findSpecialInventoryItem(item) != null)
               {
                  return true;
               }
               return false;
            }
            return true;
         }
         if(this.questType == QuestItem.QUEST_SUMMONONI)
         {
            item = QuestGenerator.instance.getOniQuestItem(this.nodeid,this.questTargetLocation,this.date).getItem();
            if(StatsManager.findSpecialQuestItem(item) == null)
            {
               if(StatsManager.findSpecialInventoryItem(item) != null)
               {
                  return true;
               }
               return false;
            }
            return true;
         }
         if(this.isKillQuest() || this.questType == QuestItem.QUEST_SUMMONNINJA || this.questType == QuestItem.QUEST_SUMMONMERC || this.questType == QuestItem.QUEST_UNWANTEDMERC || this.questType == QuestItem.QUEST_GRAVEYARD)
         {
            if(this.step == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function displayQuestTitleInNodeUI() : *
      {
         var data:XMLQuest = null;
         var questStep:XMLQuestStep = null;
         if(this.isProcGenDailyQuest)
         {
            data = QuestGenerator.instance.generateQuest(this.nodeid,this.roomid,this.npcindex,this.date,this.questType,this.questReason,this.questGiver,this.questTargetLocation);
            questStep = data.getStep(this.step);
            if(questStep != null)
            {
               OverworldHUD.instance.setActiveQuestText(questStep.title,data.type);
            }
            else
            {
               OverworldHUD.instance.setActiveQuestText("");
            }
         }
         else
         {
            data = QuestEngine.getQuestData(this.questID);
            if(data != null)
            {
               questStep = QuestEngine.getQuestStepDetails(this.questID,this.step);
               if(questStep != null)
               {
                  OverworldHUD.instance.setActiveQuestText(questStep.title,data.type);
               }
               else
               {
                  OverworldHUD.instance.setActiveQuestText("");
               }
            }
            else
            {
               OverworldHUD.instance.setActiveQuestText("");
            }
         }
      }
      
      public function getTeleportNode() : IntStat
      {
         var data:XMLQuest = null;
         var questStep:XMLQuestStep = null;
         if(this.isProcGenDailyQuest)
         {
            return new IntStat(this.getMarkedNode(),150);
         }
         data = QuestEngine.getQuestData(this.questID);
         if(data != null)
         {
            questStep = QuestEngine.getQuestStepDetails(this.questID,this.step);
            return new IntStat(questStep.teleportNodeID,questStep.teleportPosX);
         }
         return new IntStat(this.getMarkedNode(),150);
      }
      
      public function toString() : String
      {
         var str:String = null;
         if(this.isProcGenDailyQuest)
         {
            if(this.date != QueryManager.instance.getServerDate())
            {
               return "";
            }
            return "p," + this.step + "," + this.nodeid + "," + this.roomid + "," + this.npcindex + "," + this.date + "," + this.questType + "," + this.questReason + "," + this.questTargetLocation + "," + this.questGiver;
         }
         return this.questID + "," + this.step;
      }
   }
}

