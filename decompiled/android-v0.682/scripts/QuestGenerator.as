package
{
   import flash.geom.Point;
   
   public class QuestGenerator
   {
      
      public static var instance:QuestGenerator;
      
      public static var BOUNTYQUEST:int = 10;
      
      public static var DUEL:int = -1;
      
      public static var PROCGENQUEST:int = -2;
      
      internal var currentNPCNodeId:int;
      
      internal var currentNPCRoomId:int;
      
      internal var currentNPCIndex:int;
      
      internal var currentNPCDate:int;
      
      internal var currentNPCQuestType:int;
      
      internal var currentNPCQuestReason:int;
      
      internal var currentNPCQuestGiver:int;
      
      internal var currentNPCQuestTargetLocation:int;
      
      internal var randomItemList1:Array = [3000,3001,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13010,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13208];
      
      internal var randomItemList2:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216];
      
      internal var randomItemList3:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227];
      
      internal var colorhexlist:Array = [16711680,16737792,16763904,39168,13311,6684927,16751103,6697728,16777215,10066329,0];
      
      public function QuestGenerator()
      {
         super();
         if(instance != null)
         {
            return;
         }
         instance = this;
      }
      
      public static function getInstance() : QuestGenerator
      {
         if(instance == null)
         {
            new QuestGenerator();
         }
         return instance;
      }
      
      public static function destroy() : *
      {
         QuestGenerator.instance = null;
      }
      
      public function getDungeonItem(nodeid:int, date:int, roomid:int = 0, forBounty:Boolean = false) : Item
      {
         var rng:RNG = null;
         var reward:int = 0;
         if(!forBounty)
         {
            rng = new RNG(nodeid / date + StatsManager.getCharnameHash() + roomid);
         }
         else
         {
            rng = new RNG(nodeid / date + StatsManager.getCharnameHash() * 2 + roomid);
         }
         var level:int = NodeGenerator.instance.getNodeLevel(nodeid);
         if(level < 30)
         {
            reward = int(this.randomItemList1[rng.rand(this.randomItemList1.length)]);
         }
         else if(level < 60)
         {
            reward = int(this.randomItemList2[rng.rand(this.randomItemList2.length)]);
         }
         else
         {
            reward = int(this.randomItemList3[rng.rand(this.randomItemList3.length)]);
         }
         ItemGenerator.instance.setRNGSeed(rng.getSeed());
         var item:Item = ItemGenerator.instance.generateItem(reward,level,true);
         ItemGenerator.instance.randomizeRNGSeed();
         item.setProcGenName();
         return item;
      }
      
      public function getPickableItem(nodeid:int) : Item
      {
         var itemtype:int = 0;
         var rng:RNG = new RNG(nodeid);
         var dice:int = rng.rand(3);
         if(dice == 0)
         {
            itemtype = 2122;
         }
         else if(dice == 1)
         {
            itemtype = 2123;
         }
         else if(dice == 2)
         {
            itemtype = 2124;
         }
         var colorindex:int = rng.rand(11);
         var color:uint = uint(this.colorhexlist[colorindex]);
         var descindex:int = rng.rand(ItemGenerator.instance.pickableQuestItemDescListLength);
         var item:Item = new Item(itemtype);
         item.setPrimaryColor(color);
         item.addModifier(85,descindex);
         return item;
      }
      
      public function getOniDenItem(nodeid:int, date:int) : Item
      {
         var rng:RNG = new RNG(nodeid * date);
         var itemtype:int = 2148;
         var colorindex:int = rng.rand(11);
         var color:uint = uint(this.colorhexlist[colorindex]);
         var descindex:int = rng.rand(ItemGenerator.instance.pickableQuestItemDescListLength);
         var item:Item = new Item(itemtype);
         item.setPrimaryColor(color);
         item.addModifier(85,descindex);
         return item;
      }
      
      public function getNPCTradeGiveItem(nodeid:int, roomid:int, index:int, date:int) : Item
      {
         var item:Item = null;
         var sector:Point = null;
         var itemlist:Array = null;
         var rng:RNG = new RNG(nodeid * date + roomid * (index + 4));
         if(rng.rand(3) == 2)
         {
            sector = NodeGenerator.instance.getSector(nodeid);
            sector.x += rng.rand(6) - 12;
            sector.y += rng.rand(6) - 12;
            item = this.getDungeonItem(sector.x << 12 | sector.y,date);
         }
         else
         {
            itemlist = [20103,20104,20105,20106,20107];
            item = new Item(itemlist[rng.rand(5)]);
            item.addModifier(85,nodeid);
            item.addModifier(86,roomid);
            item.addModifier(87,index);
            item.addModifier(88,date);
         }
         return item;
      }
      
      public function getNPCTradeGiveItemName(item:Item) : String
      {
         var basename:String = null;
         var npcxml:XMLNpc = this.getNPC(item.getModifierById(85),item.getModifierById(86),item.getModifierById(87),item.getModifierById(88));
         var itemXML:XMLItem = QuestEngine.getItemData(item.itemID);
         if(itemXML == null)
         {
            basename = "?";
         }
         if(item.getModifierById(88) != QueryManager.instance.getServerDate())
         {
            basename = "expired " + itemXML.displayname;
         }
         else
         {
            basename = itemXML.displayname;
         }
         return basename + " " + LangManager.getString(447) + " " + npcxml.name;
      }
      
      public function getNPCTradeGiveItemBaseName(item:Item) : String
      {
         var basename:String = null;
         var itemXML:XMLItem = QuestEngine.getItemData(item.itemID);
         if(itemXML == null)
         {
            return "?";
         }
         return itemXML.displayname;
      }
      
      public function getNPC(nodeid:int, roomid:int, index:int, date:int) : XMLNpc
      {
         var xml:XMLNpc = new XMLNpc(null);
         xml.initProcGenNPC(nodeid,roomid,index,date);
         return xml;
      }
      
      public function getNPCName(nodeid:int, roomid:int, index:int, date:int, isBountyTarget:Boolean = false) : String
      {
         var xml:XMLNpc = new XMLNpc(null);
         xml.initProcGenNPC(nodeid,roomid,index,date,isBountyTarget);
         return xml.name;
      }
      
      public function getBountyTarget(nodeid:int, roomid:int, date:int) : XMLNpc
      {
         var xml:XMLNpc = new XMLNpc(null);
         xml.initProcGenNPC(nodeid,roomid,BOUNTYQUEST,date,true);
         return xml;
      }
      
      public function getOniQuestItem(nodeid:int, targetLocation:int, date:int) : ItemAndLocation
      {
         var territory:Point = this.getTerritory(nodeid);
         switch(targetLocation)
         {
            case -1:
               break;
            case 0:
               --territory.y;
               break;
            case 1:
               ++territory.y;
               break;
            case 3:
               ++territory.x;
               break;
            case 4:
               --territory.x;
         }
         if(!QuestEngine.hasTerritory(territory.x,territory.y))
         {
            territory = this.getTerritory(nodeid);
         }
         var territoryData:TerritoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         var targetnodeid:int = territoryData.getOniDen();
         return new ItemAndLocation(this.getOniDenItem(targetnodeid,date),targetnodeid);
      }
      
      public function getBountyQuestItem(nodeid:int, roomid:int, date:int) : ItemAndLocation
      {
         var targetnodeid:int = 0;
         var targetroomid:int = 0;
         var startX:int = 0;
         var startY:int = 0;
         var territoryData:TerritoryData = null;
         var locationList:Array = null;
         var max:int = 0;
         var nonNullRoomList:* = undefined;
         var i:* = undefined;
         var chosenroomindex:int = 0;
         var rng:RNG = new RNG(nodeid * date + (roomid + 6) * 5);
         var territory:Point = this.getTerritory(nodeid);
         switch(rng.rand(6))
         {
            case 0:
               --territory.y;
               break;
            case 1:
               --territory.x;
               break;
            case 2:
            case 5:
               break;
            case 3:
               ++territory.x;
               break;
            case 4:
               ++territory.y;
         }
         if(!QuestEngine.hasTerritory(territory.x,territory.y))
         {
            territory = this.getTerritory(nodeid);
         }
         if(rng.rand(2) == 0)
         {
            startX = territory.x * 6 + rng.rand(6);
            startY = territory.y * 6 + rng.rand(6);
            targetnodeid = startX << 12 | startY;
            targetroomid = 0;
         }
         else
         {
            territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
            if(!territoryData.isInBoundary() || territoryData.territoryAtWar())
            {
               territory = this.getTerritory(nodeid);
               territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
            }
            locationList = territoryData.getDungeonList();
            locationList = locationList.concat(territoryData.getHutList());
            if(territoryData.getTown() != -1 && territoryData.getTown() != nodeid)
            {
               locationList.push(territoryData.getTown());
            }
            if(territoryData.getTemple() != -1)
            {
               locationList.push(territoryData.getTemple());
            }
            targetnodeid = int(locationList[rng.rand(locationList.length)]);
         }
         var roomList:Array = NodeGenerator.instance.generateRooms(targetnodeid);
         if(roomList.length > 1 && NodeGenerator.instance.getLocationType(targetnodeid) != NodeGenerator.ICON_DOJO)
         {
            max = int(roomList.length);
            nonNullRoomList = new Array();
            for(i = 0; i < max; i++)
            {
               if(roomList[i] != null)
               {
                  nonNullRoomList.push(roomList[i]);
               }
            }
            chosenroomindex = rng.rand(nonNullRoomList.length);
            targetroomid = int(nonNullRoomList[chosenroomindex].roomid);
         }
         return new ItemAndLocation(this.getDungeonItem(targetnodeid,date,targetroomid,true),targetnodeid,targetroomid);
      }
      
      public function getNPCQuestItem(nodeid:int, roomid:int, index:int, date:int, forTrade:Boolean = false) : ItemAndLocation
      {
         var rng:RNG = null;
         var targetnode:int = 0;
         var dice:int = 0;
         var nodeType:int = 0;
         if(forTrade)
         {
            rng = new RNG((nodeid * date + roomid * (index + 5)) * 3);
         }
         else
         {
            rng = new RNG(nodeid * date + roomid * (index + 2));
         }
         if(index == BOUNTYQUEST)
         {
            return this.getBountyQuestItem(nodeid,roomid,date);
         }
         var territory:Point = this.getTerritory(nodeid);
         switch(rng.rand(7))
         {
            case 0:
               --territory.y;
               break;
            case 1:
               --territory.x;
               break;
            case 2:
            case 5:
            case 6:
               break;
            case 3:
               ++territory.x;
               break;
            case 4:
               ++territory.y;
         }
         if(!QuestEngine.hasTerritory(territory.x,territory.y))
         {
            territory = this.getTerritory(nodeid);
         }
         var territoryData:TerritoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         if(!territoryData.isInBoundary() || territoryData.territoryAtWar())
         {
            territory = this.getTerritory(nodeid);
            territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         }
         var townNode:int = territoryData.getTown();
         var dungeonList:Array = territoryData.getDungeonList();
         var pickableList:Array = territoryData.getPickableList();
         if(!forTrade)
         {
            dice = rng.rand(6);
            if(dice == 0)
            {
               nodeType = 0;
            }
            else if(dice == 1 || dice == 2)
            {
               nodeType = 1;
            }
            else if(territoryData.hasOniDen() && dice == 3)
            {
               nodeType = 3;
            }
            else
            {
               nodeType = 2;
            }
         }
         else
         {
            dice = rng.rand(5);
            if(dice == 0)
            {
               nodeType = 0;
            }
            else if(dice == 1)
            {
               nodeType = 1;
            }
            else if(territoryData.hasOniDen() && dice == 2)
            {
               nodeType = 3;
            }
            else
            {
               nodeType = 2;
            }
         }
         if(nodeType == 0)
         {
            targetnode = int(pickableList[rng.rand(pickableList.length)]);
         }
         else if(nodeType == 1)
         {
            targetnode = int(dungeonList[rng.rand(dungeonList.length)]);
         }
         else if(nodeType == 2)
         {
            if(townNode == -1 || territoryData.isAbandonedTown())
            {
               nodeType = 1;
               targetnode = int(dungeonList[rng.rand(dungeonList.length)]);
            }
            else
            {
               targetnode = townNode;
            }
         }
         else if(nodeType == 3)
         {
            targetnode = territoryData.getOniDen();
         }
         var questitem:ItemAndLocation = this.getQuestItem(nodeType,targetnode,date,rng,nodeid,roomid,index);
         if(questitem == null)
         {
            nodeType = 1;
            targetnode = int(dungeonList[rng.rand(dungeonList.length)]);
            return this.getQuestItem(nodeType,targetnode,date,rng,nodeid,roomid,index);
         }
         return questitem;
      }
      
      public function getNPCTradeWantItem(nodeid:int, roomid:int, index:int, date:int) : ItemAndLocation
      {
         return this.getNPCQuestItem(nodeid,roomid,index,date,true);
      }
      
      internal function getQuestItem(nodeType:int, nodeid:int, date:int, rng:RNG, questgiverNode:int, questgiverRoom:int, questgiverIndex:int) : ItemAndLocation
      {
         if(nodeType == 0)
         {
            return new ItemAndLocation(this.getPickableItem(nodeid),nodeid);
         }
         if(nodeType == 1)
         {
            return new ItemAndLocation(this.getDungeonItem(nodeid,date),nodeid);
         }
         if(nodeType == 2)
         {
            return this.getTownItem(nodeid,date,rng,questgiverNode,questgiverRoom,questgiverIndex);
         }
         if(nodeType == 3)
         {
            return new ItemAndLocation(this.getOniDenItem(nodeid,date),nodeid);
         }
         return null;
      }
      
      internal function getTownItem(nodeid:int, date:int, rng:RNG, questgiverNode:int, questgiverRoom:int, questgiverIndex:int) : ItemAndLocation
      {
         var roomList:Array = NodeGenerator.instance.generateRooms(nodeid);
         var max:int = int(roomList.length);
         var nonNullRoomList:* = new Array();
         for(var i:* = 1; i < max; i++)
         {
            if(roomList[i] != null && roomList[i].roomid % 3 == 0 && this.getQuestNPCCount(nodeid,roomList[i].roomid,date) > 0)
            {
               nonNullRoomList.push(roomList[i]);
            }
         }
         if(nonNullRoomList.length == 0)
         {
            return null;
         }
         var chosenroomindex:int = rng.rand(nonNullRoomList.length);
         var roomid:int = int(nonNullRoomList[chosenroomindex].roomid);
         var index:int = 0;
         if(questgiverNode == nodeid && questgiverRoom == roomid && questgiverIndex == index)
         {
            if(nonNullRoomList.length == 1)
            {
               return null;
            }
            if(++chosenroomindex >= nonNullRoomList.length)
            {
               chosenroomindex = 0;
            }
            roomid = int(nonNullRoomList[chosenroomindex].roomid);
            index = rng.rand(this.getQuestNPCCount(nodeid,roomid,date));
         }
         return new ItemAndLocation(this.getNPCTradeGiveItem(nodeid,roomid,index,date),nodeid,roomid,index);
      }
      
      public function getQuestNPCCount(nodeid:int, roomid:int, date:int) : int
      {
         var rng:RNG = new RNG(nodeid + roomid * date);
         if(roomid < 14)
         {
            return rng.rand(2);
         }
         if(roomid < 100)
         {
            return 0;
         }
         return rng.rand(2);
      }
      
      internal function getTerritory(nodeid:int) : Point
      {
         var sectorx:int = nodeid >> 12 & 0x0FFF;
         var sectory:int = nodeid & 0x0FFF;
         var territoryx:int = Math.floor(sectorx / 6);
         var territoryy:int = Math.floor(sectory / 6);
         return new Point(territoryx,territoryy);
      }
      
      public function isReadyToTurnInQuest(forTrade:Boolean) : int
      {
         var activeQuest:ActiveQuest = StatsManager.getProcGenQuest(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,forTrade);
         if(activeQuest != null && activeQuest.isReadyToTurnInQuest(forTrade))
         {
            return 1;
         }
         return 0;
      }
      
      public function playerHasNPCQuestItem(activeQuest:ActiveQuest) : Boolean
      {
         var item:Item = null;
         if(activeQuest.questType == QuestItem.QUEST_SUMMONONI)
         {
            item = this.getOniQuestItem(activeQuest.nodeid,activeQuest.questTargetLocation,activeQuest.date).getItem();
         }
         else
         {
            item = this.getNPCQuestItem(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.isForTrade()).getItem();
         }
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
      
      public function playerHasCurrentNPCQuestItem(forTrade:Boolean) : Boolean
      {
         var item:Item = this.getNPCQuestItem(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,forTrade).getItem();
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
      
      public function removeCurrentNPCQuestItem(forTrade:Boolean) : *
      {
         var item:Item = this.getNPCQuestItem(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,forTrade).getItem();
         StatsManager.removeItemFromInventory(item);
         if(forTrade)
         {
            OverworldHUD.instance.lootDialog.addSpecialItem(this.getNPCTradeGiveItem(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate));
            StatsManager.checkProcGenDailyQuestItem();
         }
      }
      
      public function addQuest(forTrade:Boolean) : *
      {
         if(forTrade)
         {
            this.currentNPCQuestType = QuestItem.QUEST_TRADE;
         }
         var questIndex:int = StatsManager.addProcGenDailyQuest(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,this.currentNPCQuestType,this.currentNPCQuestReason,this.currentNPCQuestGiver,this.currentNPCQuestTargetLocation);
         if(questIndex != -1)
         {
            QueryManager.instance.reportDataModified(StatsManager.ACTIVEQUEST);
            StatsManager.setStat(StatsManager.STAT_MARKEDNODE,questIndex);
            QueryManager.instance.saveModifiedCharData();
            OverworldHUD.instance.territorymap.refresh();
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(195),LangManager.getString(5));
         }
      }
      
      public function removeMarkedNode() : *
      {
         trace("QuestGenerator.removeMarkedNode called");
         StatsManager.setStat(StatsManager.STAT_MARKEDNODE,-1);
         OverworldHUD.instance.territorymap.refresh();
      }
      
      public function checkSetReturnMarkedNode() : Boolean
      {
         var questIndex:int = StatsManager.checkProcGenDailyQuestItem();
         trace("QuestGenerator.CheckSetReturnMarkedNode:",questIndex);
         if(questIndex != -1)
         {
            StatsManager.setStat(StatsManager.STAT_MARKEDNODE,questIndex);
            QueryManager.instance.reportDataModified(StatsManager.ACTIVEQUEST);
            QueryManager.instance.saveModifiedCharData();
            OverworldHUD.instance.territorymap.refresh();
            return true;
         }
         return false;
      }
      
      public function getMarkedNode() : int
      {
         var activeQuest:ActiveQuest = null;
         var questIndex:int = StatsManager.getPlayerStats(StatsManager.STAT_MARKEDNODE);
         if(questIndex == -1)
         {
            return -1;
         }
         if(questIndex >= StatsManager.activeQuestList.length)
         {
            StatsManager.setStat(StatsManager.STAT_MARKEDNODE,-1);
            return -1;
         }
         activeQuest = StatsManager.activeQuestList[questIndex];
         if(activeQuest.forClanQuest())
         {
            return -1;
         }
         return activeQuest.getMarkedNode();
      }
      
      public function isMarkedNPC(nodeid:int, roomid:int, index:int, date:int) : Boolean
      {
         var questIndex:int = StatsManager.getPlayerStats(StatsManager.STAT_MARKEDNODE);
         if(questIndex == -1)
         {
            return false;
         }
         if(questIndex >= StatsManager.activeQuestList.length)
         {
            StatsManager.setStat(StatsManager.STAT_MARKEDNODE,-1);
            return false;
         }
         return StatsManager.activeQuestList[questIndex].isMarkedNPC(nodeid,roomid,index,date);
      }
      
      private function storeCurrentNPC(nodeid:int, roomid:int, index:int, date:int, questType:int, questReason:int = -1, questGiver:int = -1, questTargetLocation:int = -1) : *
      {
         this.currentNPCNodeId = nodeid;
         this.currentNPCRoomId = roomid;
         this.currentNPCIndex = index;
         this.currentNPCDate = date;
         this.currentNPCQuestType = questType;
         this.currentNPCQuestReason = questReason;
         this.currentNPCQuestGiver = questGiver;
         this.currentNPCQuestTargetLocation = questTargetLocation;
      }
      
      public function completeQuest(forTrade:Boolean) : *
      {
         StatsManager.setStat(StatsManager.STAT_MARKEDNODE,-1);
         StatsManager.completeQuest(-1,true,forTrade);
         OverworldHUD.instance.territorymap.refresh();
         if(forTrade)
         {
            this.checkSetReturnMarkedNode();
         }
      }
      
      public function getCompletedQuest(forTrade:Boolean) : CompletedQuest
      {
         var completedQuest:CompletedQuest = new CompletedQuest(-1);
         completedQuest.setProcGen(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,forTrade);
         return completedQuest;
      }
      
      public function getNotCompletedQuestConditionStr(forTrade:Boolean) : String
      {
         if(StatsManager.checkCompletedProcGenQuest(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,forTrade))
         {
            return "0";
         }
         return "1";
      }
      
      public function getNPCLatestQuestItem(forTrade:Boolean) : Item
      {
         if(this.currentNPCQuestType == QuestItem.QUEST_SUMMONONI)
         {
            return this.getOniQuestItem(this.currentNPCNodeId,this.currentNPCQuestTargetLocation,this.currentNPCDate).getItem();
         }
         return this.getNPCQuestItem(this.currentNPCNodeId,this.currentNPCRoomId,this.currentNPCIndex,this.currentNPCDate,forTrade).getItem();
      }
      
      public function generateRandomQuest(nodeid:int, roomid:int, index:int, date:int) : XMLQuest
      {
         var questType:int = 0;
         var territoryData:TerritoryData = null;
         var questList:Array = null;
         var rng:RNG = null;
         var questItem:QuestItem = null;
         if(index == 0 && roomid % 3 == 0)
         {
            return this.generateQuest(nodeid,roomid,index,date,QuestItem.QUEST_ITEM);
         }
         if(index == 10)
         {
            return this.generateQuest(nodeid,roomid,index,date,QuestItem.QUEST_BOUNTYBOARD);
         }
         territoryData = NodeGenerator.instance.findTerritoryData(NodeGenerator.instance.getTerritoryId(nodeid));
         if(territoryData == null)
         {
            trace("Error: QuestGenerator.generateQuest territoryData null");
            return null;
         }
         questList = territoryData.getQuestList();
         rng = new RNG(nodeid * date + roomid * (index + 311));
         if(questList.length > 0)
         {
            questItem = questList[rng.rand(questList.length)];
            return this.generateQuest(nodeid,roomid,index,date,questItem.questType,questItem.reason,questItem.questGiver,questItem.targetLocation);
         }
         return this.generateQuest(nodeid,roomid,index,date,QuestItem.QUEST_ITEM);
      }
      
      public function generateRandomRoninQuest(nodeid:int, roomid:int, index:int, date:int) : XMLQuest
      {
         var rng:RNG = new RNG(nodeid * date + roomid * (index + 311));
         var dice:int = rng.rand(3);
         if(dice == 0)
         {
            return this.generateQuest(nodeid,roomid,index,date,QuestItem.QUEST_DUEL,QuestItem.REASON_RONIN);
         }
         if(dice == 1)
         {
            return this.generateQuest(nodeid,roomid,index,date,QuestItem.QUEST_GUIDE,QuestItem.REASON_RONIN);
         }
         return this.generateQuest(nodeid,roomid,index,date,QuestItem.QUEST_ITEM,QuestItem.REASON_RONIN);
      }
      
      public function generateQuest(nodeid:int, roomid:int, index:int, date:int, questType:int, questReason:int = -1, questGiver:int = -1, questTargetLocation:int = -1) : XMLQuest
      {
         if(questType == QuestItem.QUEST_ITEM || questType == QuestItem.QUEST_TRADE)
         {
            return this.generateItemQuest(nodeid,roomid,index,date,questReason);
         }
         if(questType == QuestItem.QUEST_BOUNTYBOARD)
         {
            return this.generateBountyBoardQuest(nodeid,roomid,date);
         }
         if(questType == QuestItem.QUEST_KILLWILDLIFE)
         {
            return this.generateKillWildlifeQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_KILLBANDIT)
         {
            return this.generateKillBanditQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_KILLONI)
         {
            return this.generateKillOniQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_KILLUNDEAD)
         {
            return this.generateKillUndeadQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_GIVEORE || questType == QuestItem.QUEST_GIVEWEAPONS)
         {
            return this.generateGiveOreQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_GIVECROPS)
         {
            return this.generateGiveCropsQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_SUMMONONI)
         {
            return this.generateSummonOniQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_SUMMONNINJA)
         {
            return this.generateSummonNinjaQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_SUMMONMERC)
         {
            return this.generateSummonMercQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_UNWANTEDMERC)
         {
            return this.generateUnwantedMercQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_GRAVEYARD)
         {
            return this.generateGraveyardQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_DUEL)
         {
            return this.generateDuelQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         if(questType == QuestItem.QUEST_GUIDE)
         {
            return this.generateGuideQuest(nodeid,roomid,index,date,questReason,questGiver,questTargetLocation);
         }
         trace("unknown quest type generated: " + questType);
         return this.generateItemQuest(nodeid,roomid,index,date);
      }
      
      public function generateItemQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int = -1) : XMLQuest
      {
         var questStep0Data:XMLQuestStep = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         questStep0Data.title = "Town Quest";
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_ITEM,questReason);
         var questGiverName:String = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         var questItemLocation:ItemAndLocation = this.getNPCQuestItem(nodeid,roomid,index,date);
         var questItem:Item = questItemLocation.getItem();
         var questLocation:String = questItemLocation.getLocationString(false);
         var tradeWantItemLocation:ItemAndLocation = this.getNPCTradeWantItem(nodeid,roomid,index,date);
         var tradeWantItem:Item = tradeWantItemLocation.getItem();
         var tradeWantLocation:String = tradeWantItemLocation.getLocationString(true);
         var tradeGiveItem:Item = this.getNPCTradeGiveItem(nodeid,roomid,index,date);
         var nodelvl:int = NodeGenerator.instance.getNodeLevel(nodeid);
         var questReward:int = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         var questCoinReward:int = nodelvl * 5;
         var tradeReward:int = questReward / 4;
         var prosperityReward:int = 10;
         if(questItem.isPickableQuestItem())
         {
            questReward /= 2;
            prosperityReward = 5;
         }
         if(tradeWantItem.isPickableQuestItem())
         {
            tradeReward /= 2;
         }
         var questStr:String = "I am looking for " + questItem.getNameBlackBG() + ".";
         var tradeQuestStr:String = "I will trade you " + tradeGiveItem.getNameMyBlackBG() + " if you have " + tradeWantItem.getNameBlackBG() + ".";
         var greetings:Array = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         var introStr:String = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Trade</text><gotolabel>trade</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(true) + "</condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questStr + "</text></dialogue>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questLocation + "</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>Quest: Find " + questItem.getNameBlackBG() + "</text>";
         introStr += "<choice><text>Give " + questItem.getPlainName() + "</text><gotolabel>completequest</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>I\'ll see what I can do</text><gotolabel>acceptquest</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>completequest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Ah yes! I have been looking for this.</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         if(questReason != QuestItem.REASON_RONIN)
         {
            introStr += "<outcome><id>50007</id><modify>" + prosperityReward + "</modify><end>0</end></outcome>";
         }
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>1</end></outcome>";
         introStr += "<label>acceptquest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks!</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>trade</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Would you like to trade?</text></dialogue>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + tradeQuestStr + "</text></dialogue>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + tradeWantLocation + "</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>Trade Quest: Find " + tradeWantItem.getNameBlackBG() + "</text>";
         introStr += "<choice><text>Give " + tradeWantItem.getPlainName() + "</text><gotolabel>completetrade</gotolabel><condition><has><id>92</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>I\'ll keep an eye out for it</text><gotolabel>accepttrade</gotolabel><condition><has><id>92</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>No thanks</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>completetrade</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Here you go!</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + tradeReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>92</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>92</id><modify>-1</modify><end>1</end></outcome>";
         introStr += "<label>accepttrade</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks!</text></dialogue>";
         introStr += "<outcome><id>92</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         var questStep1Str:String = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItemLocation.nodeid + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>" + questItemLocation.roomid + "</room><id>-1</id></roomobj>";
         questStep1Str += "</step>";
         var questStep1Data:XMLQuestStep = new XMLQuestStep(XML(questStep1Str));
         var rewardStr:String = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>" + questItem.toStringNoQty() + "</id><qty>-1</qty></loot>";
         if(questReason != QuestItem.REASON_RONIN)
         {
            rewardStr += "<loot><id>50007</id><qty>" + prosperityReward + "</qty></loot>";
         }
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = "Get " + questItem.getPlainName() + " for " + questGiverName;
         var questStep2Str:String = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         var questStep2Data:XMLQuestStep = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = "Give " + questItem.getPlainName() + " to " + questGiverName;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>Quest: Find " + questItem.getNameBlackBG() + "</text>";
         introStr += "<choice><text>Give " + questItem.getPlainName() + "</text><goto>3</goto><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><goto>5</goto></choice></option>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Ah yes! I have been looking for this.</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         questStep2Data.reward = XMLList(rewardStr);
         var questStep3Str:String = "";
         questStep3Str += "<step>";
         questStep3Str += "<node>" + tradeWantItemLocation.nodeid + "</node>";
         questStep3Str += "<action>0</action>";
         questStep3Str += "<roomobj><room>" + tradeWantItemLocation.roomid + "</room><id>-1</id></roomobj>";
         questStep3Str += "</step>";
         var questStep3Data:XMLQuestStep = new XMLQuestStep(XML(questStep3Str));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + tradeReward + "</exp>";
         rewardStr += "<loot><id>" + tradeGiveItem.toStringNoQty() + "</id></loot>";
         rewardStr += "<loot><id>" + tradeWantItem.toStringNoQty() + "</id><qty>-1</qty></loot>";
         rewardStr += "</reward>";
         questStep3Data.reward = XMLList(rewardStr);
         questStep3Data.title = "Get " + tradeWantItem.getPlainName() + " for " + questGiverName;
         var questStep4Str:String = "";
         questStep4Str += "<step>";
         questStep4Str += "<node>" + nodeid + "</node>";
         questStep4Str += "<action>0</action>";
         questStep4Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep4Str += "</step>";
         var questStep4Data:XMLQuestStep = new XMLQuestStep(XML(questStep4Str));
         questStep4Data.title = "Give " + tradeWantItem.getPlainName() + " to " + questGiverName;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>Trade Quest: Find " + tradeWantItem.getNameBlackBG() + "</text>";
         introStr += "<choice><text>Give " + tradeWantItem.getPlainName() + "</text><goto>28</goto><condition><has><id>92</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>No thanks</text><goto>5</goto></choice></option>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Here you go!</text></dialogue>";
         introStr += "<outcome><id>92</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep4Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         questStep4Data.reward = XMLList(rewardStr);
         var questData:XMLQuest = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = "";
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         questData.stepList[3] = questStep3Data;
         questData.stepList[4] = questStep4Data;
         return questData;
      }
      
      public function generateBountyBoardQuest(nodeid:int, roomid:int, date:int) : XMLQuest
      {
         var reason:String = null;
         var questStep0Data:XMLQuestStep = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         var index:int = QuestGenerator.BOUNTYQUEST;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_BOUNTYBOARD);
         var nodelvl:int = NodeGenerator.instance.getNodeLevel(nodeid);
         var questReward:int = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         var questCoinReward:int = nodelvl * 10;
         var bountyTargetName:String = this.getBountyTarget(nodeid,roomid,date).name;
         var questItemLocation:ItemAndLocation = this.getBountyQuestItem(nodeid,roomid,date);
         var questItem:Item = questItemLocation.getItem();
         var questStr:String = "Quest: Defeat " + bountyTargetName + " and return " + questItem.getNameBlackBG() + " as proof.";
         var questTurnInStr:String = "Return " + questItem.getPlainName() + " for bounty";
         var questAcceptStr:String = "Accept Bounty Quest";
         var questLocationStr:String = questItemLocation.getBountyLocationString(bountyTargetName);
         var step1TitleStr:String = "Defeat " + bountyTargetName;
         var step1ActionStr:String = "Attack " + bountyTargetName;
         var questName:String = "Bounty on " + bountyTargetName;
         var rng:RNG = new RNG((nodeid * date + roomid * (index + 5)) * 3);
         var dice:int = rng.rand(3);
         if(dice == 0)
         {
            reason = "Murder";
         }
         else if(dice == 1)
         {
            reason = "Robbery";
         }
         else if(dice == 2)
         {
            reason = "Kidnapping";
         }
         var flavorStr:String = "<text>" + bountyTargetName + "<br></br><br></br>Wanted dead or alive for " + reason + "<br></br>Reward: " + questCoinReward + " coins" + "</text>";
         var introStr:String = "<intro>";
         introStr += "<option><text>auto</text>";
         introStr += "<choice><text></text><gotolabel>start</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text></text><gotolabel>empty</gotolabel></choice></option>";
         introStr += "<label>start</label>";
         introStr += flavorStr;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questLocationStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>empty</label>";
         introStr += "<text>The board is empty.</text>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         var questStep1Str:String = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItemLocation.nodeid + "</node>";
         questStep1Str += "<action>6</action>";
         questStep1Str += "<bg>-1</bg>";
         var targetlvl:int = NodeGenerator.instance.getNodeLevel(questItemLocation.nodeid) + 2;
         questStep1Str += "<roomobj><room>" + questItemLocation.roomid + "</room><id>9</id><name>aggrobounty</name><x>-1</x><property>" + XMLNpc.INDEX_BOUNTYTARGET + "," + targetlvl.toString() + "</property></roomobj>";
         questStep1Str += "<wave><enemy><id>" + XMLNpc.INDEX_BOUNTYTARGET + "</id><lvl>" + targetlvl.toString() + "</lvl><qty>1</qty><x>650</x></enemy></wave>";
         questStep1Str += "</step>";
         var questStep1Data:XMLQuestStep = new XMLQuestStep(XML(questStep1Str));
         var rewardStr:String = "<reward><loot><id>" + questItem.toStringNoQty() + "</id></loot></reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         var questStep2Str:String = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         var questStep2Data:XMLQuestStep = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = questTurnInStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>" + questItem.toStringNoQty() + "</id><qty>-1</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         var questData:XMLQuest = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateKillWildlifeQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var animalName:String = null;
         var wildlifeType:String = null;
         var wildlifeWaveType:String = null;
         var dir:String = null;
         var territory:Point = this.getTerritory(nodeid);
         if(questTargetLocation == 0)
         {
            --territory.y;
         }
         else if(questTargetLocation == 1)
         {
            ++territory.y;
         }
         else if(questTargetLocation == 2)
         {
            ++territory.x;
         }
         else if(questTargetLocation == 3)
         {
            --territory.x;
         }
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         var questStep0Data:XMLQuestStep = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_KILLWILDLIFE,questReason,questGiver,questTargetLocation);
         var questGiverName:String = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         var rng:RNG = new RNG(nodeid * date + roomid * 3);
         var questItemLocation:ItemAndLocation = new ItemAndLocation(null,territoryData.animalSpawnList[rng.rand(territoryData.animalSpawnList.length)]);
         var animalType:int = NodeGenerator.instance.getWildlifeType(questItemLocation.getLocation());
         if(animalType == NodeGenerator.THEME_WOLF)
         {
            animalName = "wolves";
            wildlifeType = "65";
            wildlifeWaveType = "65|66";
         }
         else if(animalType == NodeGenerator.THEME_BEAR)
         {
            animalName = "bears";
            wildlifeType = "72";
            wildlifeWaveType = "72";
         }
         else if(animalType == NodeGenerator.THEME_BOAR)
         {
            animalName = "boar";
            wildlifeType = "73";
            wildlifeWaveType = "73";
         }
         else if(animalType == NodeGenerator.THEME_DEER)
         {
            animalName = "deer";
            wildlifeType = "74";
            wildlifeWaveType = "74|74|74|75";
         }
         else if(animalType == NodeGenerator.THEME_FOX)
         {
            animalName = "foxes";
            wildlifeType = "78";
            wildlifeWaveType = "78";
         }
         var questStr:String = "Quest: Hunt " + animalName;
         var questAcceptStr:String = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         var questTurnInStr:String = "I have done as you asked.";
         var questAutoTurnInStr:String = "Complete quest";
         var questTurnInNPCResponseStr:String = "Thanks! You have been a great help!";
         var step1TitleStr:String = "Hunt " + animalName;
         var step1ActionStr:String = "Hunt " + animalName;
         var step2TitleStr:String = "Return to " + questGiverName;
         var questName:String = "Hunt " + animalName;
         var questDialogueStr1:String = "";
         var questDialogueStr2:String = "";
         if(questReason == QuestItem.REASON_EATINGCROPS)
         {
            questDialogueStr1 = "The wildlife in this territory are overpopulated and have started eating our crops.";
            questDialogueStr2 = "Please help lower their numbers by hunting some " + animalName + " at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         else if(questReason == QuestItem.REASON_EATINGCROPS_PREEMPTIVE)
         {
            questDialogueStr1 = "The wildlife population in this territory is getting out of control. Please help hunt some " + animalName + " before there is too many of them.";
            questDialogueStr2 = "Some " + animalName + " were recently spotted at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
            questName = "Hunt " + animalName + " for meat";
         }
         else if(questReason == QuestItem.REASON_REDUCESOURCE)
         {
            dir = "";
            if(questTargetLocation == 0)
            {
               dir = "north";
            }
            else if(questTargetLocation == 1)
            {
               dir = "south";
            }
            else if(questTargetLocation == 2)
            {
               dir = "east";
            }
            else if(questTargetLocation == 3)
            {
               dir = "west";
            }
            questName = "Hunt " + animalName + " in " + territoryData.townName;
            questDialogueStr1 = "The wildlife in this territory is getting out of control. To make things worse, " + animalName + " have been entering the territory from the " + dir + ".";
            questDialogueStr2 = "Can you please head to " + territoryData.townName + " to hunt some " + animalName + " to lower their numbers there?";
         }
         else
         {
            questDialogueStr1 = "Can you please hunt some " + animalName + " and bring me their meat?";
            questDialogueStr2 = "Some " + animalName + " were recently spotted at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         var flavorText:String = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         var nodelvl:int = NodeGenerator.instance.getNodeLevel(nodeid);
         var questReward:int = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         var questCoinReward:int = nodelvl * 5;
         var greetings:Array = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         var introStr:String = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         var rewardStr:String = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         var questStep1Str:String = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItemLocation.getLocation() + "</node>";
         questStep1Str += "<action>1</action>";
         questStep1Str += "<bg>-1</bg>";
         var targetlvl:int = NodeGenerator.instance.getNodeLevel(questItemLocation.getLocation());
         var waveCount:int = rng.rand(3) + 1;
         var roomWidth:int = NodeGenerator.instance.getRoomWidth(questItemLocation.getLocation());
         questStep1Str += "<roomobj><room>0</room><id>9</id><name>aggrowildlife</name><x>-1</x><property>" + wildlifeType + "," + targetlvl.toString() + "</property></roomobj>";
         for(var i:int = 0; i < waveCount; i++)
         {
            if(i == 0)
            {
               questStep1Str += "<wave><enemy><id>" + wildlifeWaveType + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(4) + 1).toString() + "</qty><x>650</x></enemy></wave>";
            }
            else
            {
               questStep1Str += "<wave><enemy><x>" + -100 + "</x><y>" + StageManager.getGroundY() + " </y><id>" + wildlifeWaveType + "</id><lvl>" + targetlvl + "</lvl><qty>" + rng.rand(4).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><y>" + StageManager.getGroundY() + " </y><id>" + wildlifeWaveType + "</id><lvl>" + targetlvl + "</lvl><qty>" + rng.rand(4).toString() + "</qty></enemy></wave>";
            }
         }
         questStep1Str += "</step>";
         var questStep1Data:XMLQuestStep = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         var questStep2Str:String = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         var questStep2Data:XMLQuestStep = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr = "Return to " + questGiverName;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         var questData:XMLQuest = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateKillBanditQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var waveid:String = null;
         var dir:String = null;
         var territory:Point = this.getTerritory(nodeid);
         if(questTargetLocation == 0)
         {
            --territory.y;
         }
         else if(questTargetLocation == 1)
         {
            ++territory.y;
         }
         else if(questTargetLocation == 2)
         {
            ++territory.x;
         }
         else if(questTargetLocation == 3)
         {
            --territory.x;
         }
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         var questStep0Data:XMLQuestStep = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_KILLBANDIT,questReason,questGiver,questTargetLocation);
         var questGiverName:String = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         var bountyTargetName:String = this.getBountyTarget(nodeid,roomid,date).name;
         var rng:RNG = new RNG(nodeid * date + roomid * 3);
         var aggroSpawnLocations:Array = territoryData.getAggoSpawnLocations();
         var questItemLocation:ItemAndLocation = new ItemAndLocation(null,aggroSpawnLocations[rng.rand(aggroSpawnLocations.length)]);
         var aggroid:String = "11";
         var lvl:int = NodeGenerator.instance.getTerritoryLevel(territoryData.territoryID);
         if(lvl < 3)
         {
            waveid = "11";
         }
         else if(lvl < 5)
         {
            waveid = "11|12";
         }
         else if(lvl < 7)
         {
            waveid = "11|12|13";
         }
         else if(lvl < 9)
         {
            waveid = "11|12|13|14";
         }
         else if(int(Math.random() * 3) > 0)
         {
            waveid = "11|12|13|14|15";
         }
         else
         {
            waveid = "11|12|13|14|15|16";
         }
         var questStr:String = "Quest: Defeat bandits at " + NodeGenerator.instance.getNodeName(questItemLocation.getLocation());
         var questAcceptStr:String = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         var questTurnInStr:String = "I have done as you asked.";
         var questAutoTurnInStr:String = "I have done as you asked.";
         var questTurnInNPCResponseStr:String = "Thanks! You have been a great help!";
         var step1TitleStr:String = "Defeat bandits";
         var step1ActionStr:String = "Fight bandits";
         var step2TitleStr:String = "Return to " + questGiverName;
         var questName:String = "Defeat bandits at " + NodeGenerator.instance.getNodeName(questItemLocation.getLocation());
         var questDialogueStr1:String = "";
         var questDialogueStr2:String = "";
         if(questReason == QuestItem.REASON_POACHERS)
         {
            questDialogueStr1 = "Poachers are killing too much wildlife! Please stop them.";
            questDialogueStr2 = "A group of then were last seen at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
            questName = "Defeat poachers at " + NodeGenerator.instance.getNodeName(questItemLocation.getLocation());
         }
         else if(questReason == QuestItem.REASON_TOOMUCHROBBERY)
         {
            questDialogueStr1 = "Our caravans are being robbed by bandits far too often. Please put the bandits in their place.";
            questDialogueStr2 = "You can find a group of them at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         else if(questReason == QuestItem.REASON_BANDITSATTACKINGTOWN)
         {
            questDialogueStr1 = "Bandits are attacking us!";
            questDialogueStr2 = "Please defeat the bandits outside our gates before they get in!";
            questItemLocation.nodeid = nodeid;
         }
         else if(questReason == QuestItem.REASON_BANDITSATTACKINGTOWN_PREEMPTIVE)
         {
            questDialogueStr1 = "Word has it that bandits are planning to raid " + territoryData.getTownName() + " soon. Please do a preemptive strike on them before they attack us. Perhaps that would discourage them.";
            questDialogueStr2 = "You can find them at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         else if(questReason == QuestItem.REASON_REDUCESOURCE)
         {
            dir = "";
            if(questTargetLocation == 0)
            {
               dir = "north";
            }
            else if(questTargetLocation == 1)
            {
               dir = "south";
            }
            else if(questTargetLocation == 2)
            {
               dir = "east";
            }
            else if(questTargetLocation == 3)
            {
               dir = "west";
            }
            questName = "Attack bandits in " + territoryData.townName;
            questDialogueStr1 = "Bandits are arriving from the " + dir + "!";
            questDialogueStr2 = "Please head to " + territoryData.townName + " to discourage them from coming here anymore.";
         }
         else if(questReason == QuestItem.REASON_BUILDINGTOWN)
         {
            questDialogueStr1 = "We are trying to build up this town but bandits keep harassing us! Please help us get rid of them!";
            questDialogueStr2 = "You can find them at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         else
         {
            questDialogueStr1 = "The number of bandits in this territory is getting too numerous. Please help us chase them away.";
            questDialogueStr2 = "Some of them were spotted at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         var flavorText:String = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         var nodelvl:int = NodeGenerator.instance.getNodeLevel(nodeid);
         var questReward:int = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         var questCoinReward:int = nodelvl * 5;
         var greetings:Array = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         var introStr:String = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         var rewardStr:String = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         var questStep1Str:String = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItemLocation.getLocation() + "</node>";
         questStep1Str += "<action>1</action>";
         questStep1Str += "<bg>-1</bg>";
         var targetlvl:int = NodeGenerator.instance.getNodeLevel(questItemLocation.getLocation());
         var waveCount:int = rng.rand(4) + 2;
         var roomWidth:int = NodeGenerator.instance.getRoomWidth(questItemLocation.getLocation());
         questStep1Str += "<roomobj><room>0</room><id>9</id><name>aggrooni</name><x>-1</x><property>" + aggroid + "," + targetlvl.toString() + "</property></roomobj>";
         for(var i:int = 0; i < waveCount; i++)
         {
            if(i == waveCount - 1)
            {
               questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><id>" + XMLNpc.INDEX_BOUNTYTARGET.toString() + "</id><lvl></lvl>" + (targetlvl + 2).toString() + "<qty>1</qty></enemy></wave>";
            }
            else if(i == 0)
            {
               questStep1Str += "<wave><enemy><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty><x>650</x></enemy></wave>";
            }
            else
            {
               questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy></wave>";
            }
         }
         questStep1Str += "</step>";
         var questStep1Data:XMLQuestStep = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         var questStep2Str:String = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         var questStep2Data:XMLQuestStep = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         var questData:XMLQuest = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateKillOniQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = this.getTerritory(nodeid);
         if(questTargetLocation == 0)
         {
            --territory.y;
         }
         else if(questTargetLocation == 1)
         {
            ++territory.y;
         }
         else if(questTargetLocation == 2)
         {
            ++territory.x;
         }
         else if(questTargetLocation == 3)
         {
            --territory.x;
         }
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         var questStep0Data:XMLQuestStep = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_KILLONI,questReason,questGiver,questTargetLocation);
         var questGiverName:String = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         var rng:RNG = new RNG(nodeid * date + roomid * 3);
         var aggroSpawnLocations:Array = territoryData.getAggoSpawnLocations();
         var questItemLocation:ItemAndLocation = new ItemAndLocation(null,aggroSpawnLocations[rng.rand(aggroSpawnLocations.length)]);
         var waveid:String = "76|79";
         var aggroid:String = "76";
         var questStr:String = "Quest: Defeat Oni at " + NodeGenerator.instance.getNodeName(questItemLocation.getLocation());
         var questAcceptStr:String = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         var questTurnInStr:String = "I have done as you asked.";
         var questAutoTurnInStr:String = "Complete quest";
         var questTurnInNPCResponseStr:String = "Thanks! You have been a great help!";
         var step1TitleStr:String = "Defeat Oni";
         var step1ActionStr:String = "Defeat Oni";
         var step2TitleStr:String = "Return to " + questGiverName;
         var questName:String = "Defeat Oni at " + NodeGenerator.instance.getNodeName(questItemLocation.getLocation());
         var questDialogueStr1:String = "";
         var questDialogueStr2:String = "";
         if(questReason == QuestItem.REASON_KILLINGTOOMANYWILDLIFE)
         {
            questDialogueStr1 = "The Oni are killing too many animals! Please stop them before they wipe out all the wildlife in this territory.";
            questDialogueStr2 = "A group of them were recently spotted at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         else if(questReason == QuestItem.REASON_BUILDINGTOWN)
         {
            questDialogueStr1 = "We are trying to build up this town but a group of oni keeps destroying whatever we build. Please help us chase them away!";
            questDialogueStr2 = "You can find them loitering around at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         else if(questReason == QuestItem.REASON_ONIATTACKINGTOWN)
         {
            questDialogueStr1 = "The Oni are attacking us!";
            questDialogueStr2 = "Please kill the Oni outside our gates before they get in!";
            questItemLocation.nodeid = nodeid;
         }
         else
         {
            questDialogueStr1 = "The Oni are stealing our crops! Please help us get rid of them!";
            questDialogueStr2 = "They were last seen at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         var flavorText:String = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         var nodelvl:int = NodeGenerator.instance.getNodeLevel(nodeid);
         var questReward:int = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         var questCoinReward:int = nodelvl * 5;
         var greetings:Array = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         var introStr:String = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         var rewardStr:String = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         var questStep1Str:String = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItemLocation.getLocation() + "</node>";
         questStep1Str += "<action>1</action>";
         questStep1Str += "<bg>-1</bg>";
         var targetlvl:int = NodeGenerator.instance.getNodeLevel(questItemLocation.getLocation());
         var waveCount:int = rng.rand(3) + 2;
         var roomWidth:int = NodeGenerator.instance.getRoomWidth(questItemLocation.getLocation());
         questStep1Str += "<roomobj><room>0</room><id>9</id><name>aggrooni</name><x>-1</x><property>" + aggroid + "," + targetlvl.toString() + "</property></roomobj>";
         for(var i:int = 0; i < waveCount; i++)
         {
            if(i == 0)
            {
               questStep1Str += "<wave><enemy><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty><x>650</x></enemy></wave>";
            }
            else
            {
               questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy></wave>";
            }
         }
         questStep1Str += "</step>";
         var questStep1Data:XMLQuestStep = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         var questStep2Str:String = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         var questStep2Data:XMLQuestStep = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         var questData:XMLQuest = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateKillUndeadQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var dir:String = null;
         var territory:Point = this.getTerritory(nodeid);
         if(questTargetLocation == 0)
         {
            --territory.y;
         }
         else if(questTargetLocation == 1)
         {
            ++territory.y;
         }
         else if(questTargetLocation == 2)
         {
            ++territory.x;
         }
         else if(questTargetLocation == 3)
         {
            --territory.x;
         }
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         var questStep0Data:XMLQuestStep = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_KILLUNDEAD,questReason,questGiver,questTargetLocation);
         var questGiverName:String = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         var rng:RNG = new RNG(nodeid * date + roomid * 3);
         var aggroSpawnLocations:Array = territoryData.getAggoSpawnLocations();
         var questItemLocation:ItemAndLocation = new ItemAndLocation(null,aggroSpawnLocations[rng.rand(aggroSpawnLocations.length)]);
         var waveid:String = "80";
         var aggroid:String = "80";
         var questStr:String = "Quest: Defeat undead";
         var questAcceptStr:String = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         var questTurnInStr:String = "I have done as you asked.";
         var questAutoTurnInStr:String = "Complete quest";
         var questTurnInNPCResponseStr:String = "Thanks! You have been a great help!";
         var step1TitleStr:String = "Defeat undead";
         var step1ActionStr:String = "Defeat undead";
         var step2TitleStr:String = "Return to " + questGiverName;
         var questName:String = "Defeat undead at " + NodeGenerator.instance.getNodeName(questItemLocation.getLocation());
         var questDialogueStr1:String = "";
         var questDialogueStr2:String = "";
         if(questReason == QuestItem.REASON_BUILDINGTOWN)
         {
            questDialogueStr1 = "We are trying to build up this town but the undead is making it too dangerous for us to continue working.";
            questDialogueStr2 = "Please get rid of the the undead that are wandering outside " + territoryData.getTownName() + ".";
            questItemLocation.nodeid = nodeid;
         }
         else if(questReason == QuestItem.REASON_UNDEADATTACKINGTOWN)
         {
            questDialogueStr1 = "The undead are attacking us!";
            questDialogueStr2 = "Please defeat the undead outside our gates before they get in!";
            questItemLocation.nodeid = nodeid;
         }
         else if(questReason == QuestItem.REASON_REDUCESOURCE)
         {
            dir = "";
            if(questTargetLocation == 0)
            {
               dir = "north";
            }
            else if(questTargetLocation == 1)
            {
               dir = "south";
            }
            else if(questTargetLocation == 2)
            {
               dir = "east";
            }
            else if(questTargetLocation == 3)
            {
               dir = "west";
            }
            questName = "Reduce undead in " + territoryData.townName;
            questDialogueStr1 = "It has been reported that there is an undead horde in the territory to the " + dir + ".";
            questDialogueStr2 = "Please head to " + territoryData.townName + " to thin their ranks before that arrive here.";
         }
         else
         {
            questDialogueStr1 = "The undead are everywhere! Please help us get rid of them!";
            questDialogueStr2 = "A particularly large horde was recently seen at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItemLocation.nodeid,questItemLocation.roomid) + ".";
         }
         var flavorText:String = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         var nodelvl:int = NodeGenerator.instance.getNodeLevel(nodeid);
         var questReward:int = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         var questCoinReward:int = nodelvl * 5;
         var greetings:Array = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         var introStr:String = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         var rewardStr:String = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         var questStep1Str:String = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItemLocation.getLocation() + "</node>";
         questStep1Str += "<action>1</action>";
         questStep1Str += "<bg>-1</bg>";
         var targetlvl:int = NodeGenerator.instance.getNodeLevel(questItemLocation.getLocation());
         var waveCount:int = rng.rand(4) + 2;
         var roomWidth:int = NodeGenerator.instance.getRoomWidth(questItemLocation.getLocation());
         questStep1Str += "<roomobj><room>0</room><id>9</id><name>aggrooni</name><x>-1</x><property>" + aggroid + "," + targetlvl.toString() + "</property></roomobj>";
         for(var i:int = 0; i < waveCount; i++)
         {
            if(i == 0)
            {
               questStep1Str += "<wave><enemy><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty><x>650</x></enemy></wave>";
            }
            else
            {
               questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy></wave>";
            }
         }
         questStep1Str += "</step>";
         var questStep1Data:XMLQuestStep = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         var questStep2Str:String = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         var questStep2Data:XMLQuestStep = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         var questData:XMLQuest = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateGiveOreQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var rng:RNG = null;
         var oreType:int = 0;
         var qtyNeeded:int = 0;
         var oreId:int = 0;
         var oreName:String = null;
         var questDialogueStr:String = null;
         var questStr:String = null;
         var questTurnInStr:String = null;
         var step1TitleStr:String = null;
         var questAcceptStr:String = null;
         var questAcceptNPCResponseStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var step2TitleStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         var territory:Point = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_GIVEORE,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         rng = new RNG(nodeid * date + roomid * 3);
         if(rng.rand(3) == 0)
         {
            oreType = NodeGenerator.instance.getOreType(nodeid,true);
            qtyNeeded = 1;
         }
         else
         {
            oreType = NodeGenerator.instance.getOreType(nodeid,false);
            qtyNeeded = 3;
         }
         if(oreType == 2)
         {
            oreId = 20060;
            oreName = "coal";
            questDialogueStr = "Bring me " + qtyNeeded + " pieces of coal.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " pieces of coal";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " pieces of coal";
            questTurnInStr = "Give " + qtyNeeded + " coal";
         }
         else if(oreType == 3)
         {
            oreId = 20061;
            oreName = "iron";
            questDialogueStr = "Bring me " + qtyNeeded + " iron ore.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " iron ore";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " iron ore";
            questTurnInStr = "Give " + qtyNeeded + " iron ore";
         }
         else if(oreType == 4)
         {
            oreId = 20062;
            oreName = "tin";
            questDialogueStr = "Bring me " + qtyNeeded + " tin ore.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " tin ore";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " tin ore";
            questTurnInStr = "Give " + qtyNeeded + " tin ore";
         }
         else if(oreType == 5)
         {
            oreId = 20063;
            oreName = "copper";
            questDialogueStr = "Bring me " + qtyNeeded + " copper ore.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " copper ore";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " copper ore";
            questTurnInStr = "Give " + qtyNeeded + " copper ore";
         }
         else if(oreType == 6)
         {
            oreId = 20064;
            oreName = "silver";
            questDialogueStr = "Bring me " + qtyNeeded + " silver ore.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " silver ore";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " silver ore";
            questTurnInStr = "Give " + qtyNeeded + " silver ore";
         }
         else if(oreType == 7)
         {
            oreId = 20065;
            oreName = "titanium";
            questDialogueStr = "Bring me " + qtyNeeded + " titanium ore.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " titanium ore";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " titanium ore";
            questTurnInStr = "Give " + qtyNeeded + " titanium ore";
         }
         else if(oreType == 8)
         {
            oreId = 20066;
            oreName = "diamond";
            questDialogueStr = "Bring me " + qtyNeeded + " diamond.";
            step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " diamond";
            questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " diamond";
            questTurnInStr = "Give " + qtyNeeded + " diamond";
         }
         questAcceptStr = "I\'ll see what I can do.";
         questAcceptNPCResponseStr = "Thanks!";
         questTurnInNPCResponseStr = "Thanks! You have been a great help!";
         step2TitleStr = "Return to " + questGiverName;
         questName = "Get " + oreName + " for " + questGiverName;
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         var dice:int = rng.rand(2);
         if(dice == 0)
         {
            questDialogueStr2 = "Please bring us " + oreName + " so that we can create more weapons to defend ourselves.";
         }
         else
         {
            questDialogueStr2 = "Please bring us " + oreName + " so that we can create more armor to protect ourselves.";
         }
         if(questReason == QuestItem.REASON_BANDITSATTACKINGTOWN)
         {
            questDialogueStr1 = "Bandits are attacking!";
         }
         else if(questReason == QuestItem.REASON_ONIATTACKINGTOWN)
         {
            questDialogueStr1 = "Oni are attacking!";
         }
         else if(questReason == QuestItem.REASON_ONIATTACKINGTOWN_PREEMPTIVE)
         {
            questDialogueStr1 = "Oni sightings have been increasing. We are expecting an attack from them.";
         }
         else if(questReason == QuestItem.REASON_UNDEADATTACKINGTOWN)
         {
            questDialogueStr1 = "Undead are attacking!";
         }
         else if(questReason == QuestItem.REASON_UNDEADATTACKINGTOWN_PREEMPTIVE)
         {
            questDialogueStr1 = "There are reports that a horde undead is headed our way!";
         }
         else
         {
            questDialogueStr1 = "Word has it that bandits are planning an attack on " + territoryData.getTownName() + ".";
         }
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + "You can find some in the nearby mines." + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>" + oreId + "</id><qty>" + qtyNeeded + "</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>" + oreId + "</id><qty>" + qtyNeeded + "</qty><comp>lt</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>" + oreId + "</id><modify>-" + qtyNeeded + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + nodeid + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep1Str += "</step>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>" + oreId + "</id><qty>" + qtyNeeded + "</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<outcome><id>" + oreId + "</id><modify>-" + qtyNeeded + "</modify></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateGiveCropsQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var rng:RNG = null;
         var qtyNeeded:int = 0;
         var cropsId:int = 0;
         var oreName:String = null;
         var questStr:String = null;
         var questTurnInStr:String = null;
         var step1TitleStr:String = null;
         var questAcceptStr:String = null;
         var questAcceptNPCResponseStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         territory = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_GIVECROPS,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         rng = new RNG(nodeid * date + roomid * 3);
         qtyNeeded = rng.rand(3) + 3;
         cropsId = 20040;
         questStr = "Quest: Bring " + questGiverName + " " + qtyNeeded + " crops";
         questTurnInStr = "Give " + qtyNeeded + " crops to " + questGiverName;
         step1TitleStr = "Bring " + questGiverName + " " + qtyNeeded + " crops";
         questAcceptStr = "I\'ll see what I can do.";
         questAcceptNPCResponseStr = "Thanks!";
         questTurnInNPCResponseStr = "Thanks! You have been a great help!";
         questName = "Crops for " + questGiverName;
         questDialogueStr1 = "Bring me " + qtyNeeded + " crops.";
         questDialogueStr2 = "Just because.";
         if(questReason == QuestItem.REASON_EATINGCROPS)
         {
            questDialogueStr1 = "The wildlife in the area have eaten all our crops!";
            questDialogueStr2 = "Can you please bring us some crops so that we don\'t starve?";
         }
         else if(questReason == QuestItem.REASON_ONIATTACKINGTOWN)
         {
            questDialogueStr1 = "The oni have eaten all our crops!";
            questDialogueStr2 = "Please bring us some crops so that we don\'t starve!";
         }
         else
         {
            questDialogueStr1 = "Our crops are not growing very well.";
            questDialogueStr2 = "Can you please bring us more crops?";
         }
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>" + cropsId + "</id><qty>" + qtyNeeded + "</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>" + cropsId + "</id><qty>" + qtyNeeded + "</qty><comp>lt</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>" + cropsId + "</id><modify>-" + qtyNeeded + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + nodeid + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep1Str += "</step>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = "Return to " + questGiverName;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>" + cropsId + "</id><qty>" + qtyNeeded + "</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks! You have been a great help!</text></dialogue>";
         introStr += "<outcome><id>" + cropsId + "</id><modify>-" + qtyNeeded + "</modify></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateSummonOniQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var questItem:ItemAndLocation = null;
         var itemName:String = null;
         var rng:RNG = null;
         var questStr:String = null;
         var questTurnInStr:String = null;
         var questAcceptStr:String = null;
         var questAcceptNPCResponseStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var step1TitleStr:String = null;
         var step2TitleStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         territory = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_SUMMONONI,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         questItem = this.getOniQuestItem(nodeid,questTargetLocation,date);
         itemName = questItem.getItem().getPlainName();
         rng = new RNG(nodeid * date + roomid * 3);
         questStr = "Quest: Find " + itemName;
         questTurnInStr = "Give " + itemName;
         questAcceptStr = "I\'ll see what I can do.";
         questAcceptNPCResponseStr = "Thanks!";
         questTurnInNPCResponseStr = "Thanks! You have been a great help!";
         step1TitleStr = "Find " + itemName + " for " + questGiverName;
         step2TitleStr = "Return to " + questGiverName;
         questName = "Find " + itemName;
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         questDialogueStr1 = "If there are Oni present in this territory, our crops will grow much faster.";
         questDialogueStr2 = "Can you find and bring us a " + itemName + "? With it, we might be able to tempt some Oni to come stay in the territory.";
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questItem.getDarumaLocationString() + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>-1</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItem.getLocation() + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>0</room><id>-1</id></roomobj>";
         questStep1Str += "</step>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.title = step1TitleStr;
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks! You have been a great help!</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateSummonNinjaQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = null;
         var currentTerritoryData:TerritoryData = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var targetnodeid:int = 0;
         var rng:RNG = null;
         var questItem:ItemAndLocation = null;
         var questTurnInStr:String = null;
         var questAutoTurnInStr:String = null;
         var questStr:String = null;
         var questAcceptStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var step1TitleStr:String = null;
         var step1ActionStr:String = null;
         var step2TitleStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         territory = this.getTerritory(nodeid);
         currentTerritoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         if(questTargetLocation == 0)
         {
            --territory.y;
         }
         else if(questTargetLocation == 1)
         {
            ++territory.y;
         }
         else if(questTargetLocation == 2)
         {
            ++territory.x;
         }
         else if(questTargetLocation == 3)
         {
            --territory.x;
         }
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_SUMMONNINJA,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         targetnodeid = territoryData.getTown();
         rng = new RNG(nodeid * date + roomid * 3);
         questItem = new ItemAndLocation(null,targetnodeid);
         questTurnInStr = "I have done as you asked.";
         questAutoTurnInStr = "Complete quest";
         questStr = "Quest: Summon ninja to help " + currentTerritoryData.getTownName();
         questAcceptStr = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         questTurnInNPCResponseStr = "Thanks! You have been a great help. I hope they arrive soon!";
         step1TitleStr = "Summon ninja to help " + currentTerritoryData.getTownName();
         step1ActionStr = "Talk to ninja";
         step2TitleStr = "Return to " + questGiverName;
         questName = "Request help from ninja village";
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         questDialogueStr1 = "We are in a very bad situation here! Please bring this message to the ninja village at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
         questDialogueStr2 = "I hope help arrives soon!";
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks!</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItem.getLocation() + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>0</room><id>4</id><name>ninjacontact</name><x>-1</x><property>31</property></roomobj>";
         questStep1Str += "</step>";
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>I have been sent to request your help.</text></dialogue>";
         introStr += "<dialogue><id>31</id><text>Understood. Ninja will be dispatched right away.</text></dialogue>";
         introStr += "</intro>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.intro = questStep1Data.getXMLIntroList(XMLList(introStr));
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateSummonMercQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = null;
         var currentTerritoryData:TerritoryData = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var targetnodeid:int = 0;
         var rng:RNG = null;
         var questItem:ItemAndLocation = null;
         var questStr:String = null;
         var questAcceptStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var questAutoTurnInStr:String = null;
         var step1TitleStr:String = null;
         var step1ActionStr:String = null;
         var step2TitleStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var flavorText:String = null;
         var mercRefuse:Boolean = false;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         territory = this.getTerritory(nodeid);
         currentTerritoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         if(questTargetLocation == 0)
         {
            --territory.y;
         }
         else if(questTargetLocation == 1)
         {
            ++territory.y;
         }
         else if(questTargetLocation == 2)
         {
            ++territory.x;
         }
         else if(questTargetLocation == 3)
         {
            --territory.x;
         }
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_SUMMONMERC,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         targetnodeid = territoryData.getMercCamp();
         rng = new RNG(nodeid * date + roomid * 3);
         questItem = new ItemAndLocation(null,targetnodeid);
         questStr = "Quest: Summon mercenaries to help " + currentTerritoryData.getTownName();
         questAcceptStr = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         questTurnInNPCResponseStr = "Thanks! You have been a great help. I hope they arrive soon!";
         questAutoTurnInStr = "Complete quest";
         step1TitleStr = "Summon mercenaries to help " + currentTerritoryData.getTownName();
         step1ActionStr = "Talk to Mercenary Captain";
         step2TitleStr = "Return to " + questGiverName;
         questName = "Request help from mercenaries";
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         if(questReason == QuestItem.REASON_BANDITSATTACKINGTOWN)
         {
            questDialogueStr1 = "Bandits are attacking! Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
            questDialogueStr2 = "I hope help arrives soon!";
         }
         else if(questReason == QuestItem.REASON_ONIATTACKINGTOWN)
         {
            questDialogueStr1 = "The Oni are attacking! Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
            questDialogueStr2 = "I hope help arrives soon!";
         }
         else if(questReason == QuestItem.REASON_ONIATTACKINGTOWN_PREEMPTIVE)
         {
            questDialogueStr1 = "We have reason to believe that the Oni are going to attack us soon. Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
            questDialogueStr2 = "I hope the mercenaries arrive before the oni do!";
         }
         else if(questReason == QuestItem.REASON_UNDEADATTACKINGTOWN)
         {
            questDialogueStr1 = "The undead are attacking! Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
            questDialogueStr2 = "I hope help arrives soon!";
         }
         else if(questReason == QuestItem.REASON_UNDEADATTACKINGTOWN_PREEMPTIVE)
         {
            questDialogueStr1 = "The undead are coming! Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
            questDialogueStr2 = "I hope the mercenaries arrive before the undead do!";
         }
         else
         {
            questDialogueStr1 = "Word has it that bandits are planning an attack on " + territoryData.getTownName() + ". Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
            questDialogueStr2 = "I hope the mercenaries arrive before the bandits do!";
         }
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         mercRefuse = currentTerritoryData.townProsperity < territoryData.townProsperity;
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>I have done as you have asked</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks!</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItem.getLocation() + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>0</room><id>4</id><name>merccaptain</name><x>-1</x><property>142</property></roomobj>";
         questStep1Str += "</step>";
         if(!mercRefuse)
         {
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>I have been sent to request your help.</text></dialogue>";
            introStr += "<dialogue><id>142</id><text>Understood. Mercenaries will be dispatched right away.</text></dialogue>";
            introStr += "</intro>";
         }
         else
         {
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>I have been sent to request your help.</text></dialogue>";
            introStr += "<dialogue><id>142</id><text>I am sorry but " + territoryData.getTownName() + " is paying us more than what " + currentTerritoryData.getTownName() + " is offering.</text></dialogue>";
            introStr += "<option><id>142</id><text>If you are willing to pay us a little something upfront, we will consider your request</text>";
            introStr += "<choice><text>Give Mercenary Captain 500 coins</text><gotolabel>smallbribe</gotolabel><condition><has><id>11</id><qty>500</qty><comp>gte</comp></has></condition></choice>";
            introStr += "<choice><text>Give Mercenary Captain 1000 coins</text><gotolabel>bigbribe</gotolabel><condition><has><id>11</id><qty>1000</qty><comp>gte</comp></has></condition></choice>";
            introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
            introStr += "<label>smallbribe</label>";
            introStr += "<outcome><id>11</id><modify>-500</modify><end>0</end></outcome>";
            introStr += "<goto>finish</goto>";
            introStr += "<label>bigbribe</label>";
            introStr += "<outcome><id>11</id><modify>-1000</modify><end>0</end></outcome>";
            introStr += "<goto>finish</goto>";
            introStr += "<label>finish</label>";
            introStr += "<dialogue><id>142</id><text>Your generosity is much appreciated. We will take your request into consideration.</text></dialogue>";
            introStr += "<outcome><end>1</end></outcome>";
            introStr += "<label>leave</label>";
            introStr += "<outcome><end>-1</end></outcome>";
            introStr += "</intro>";
         }
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.intro = questStep1Data.getXMLIntroList(XMLList(introStr));
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateUnwantedMercQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territory:Point = null;
         var territoryData:TerritoryData = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var targetnodeid:int = 0;
         var rng:RNG = null;
         var questItem:ItemAndLocation = null;
         var questStr:String = null;
         var questName:String = null;
         var questTurnInStr:String = null;
         var questAutoTurnInStr:String = null;
         var questAcceptStr:String = null;
         var questAcceptNPCResponseStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var step1TitleStr:String = null;
         var step1ActionStr:String = null;
         var step2TitleStr:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var questDialogueStr3:String = null;
         var flavorText:String = null;
         var mercResponse:int = 0;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var endingStr:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         var targetlvl:int = 0;
         var waveCount:int = 0;
         var waveid:String = null;
         var roomWidth:int = 0;
         var i:int = 0;
         territory = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_UNWANTEDMERC,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         targetnodeid = territoryData.getMercCamp();
         rng = new RNG(nodeid * date + roomid * 3);
         questItem = new ItemAndLocation(null,targetnodeid);
         questStr = "Quest: get mercenaries to leave " + territoryData.getTownName();
         questName = "Get mercenaries to leave " + territoryData.getTownName();
         questTurnInStr = "I have done as you have asked";
         questAutoTurnInStr = "Complete quest";
         questAcceptStr = "I\'ll see what I can do.";
         questAcceptNPCResponseStr = "Thanks!";
         questTurnInNPCResponseStr = "Thanks! You have been a great help!";
         step1TitleStr = "Talk to mercenary captain";
         step1ActionStr = "Talk to mercenary captain";
         step2TitleStr = "Return to " + questGiverName;
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         questDialogueStr3 = "";
         questDialogueStr1 = "The mercenaries loitering in our territory are starting to make a nuisance of themselves!";
         questDialogueStr2 = "Please bring this message to the mercenary captain at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(nodeid,roomid) + ".";
         questDialogueStr3 = "Hopefully they will leave without making a fuss.";
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr3 + "</text></dialogue>";
         var questReasonStr:String = "Just because." + questReason;
         mercResponse = rng.rand(3);
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItem.getLocation() + "</node>";
         questStep1Str += "<roomobj><room>0</room><id>4</id><name>merccaptain</name><x>-1</x><property>142</property></roomobj>";
         endingStr = "";
         if(mercResponse == 0)
         {
            questStep1Str += "<action>0</action>";
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>" + territoryData.getTownName() + " has no further need for your services. They would like to request that you leave.</text></dialogue>";
            introStr += "<dialogue><id>142</id><text>We were about to leave anyway. Goodbye.</text></dialogue>";
            introStr += "</intro>";
         }
         else if(mercResponse == 1)
         {
            questStep1Str += "<action>1</action>";
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>" + territoryData.getTownName() + " has no further need for your services. They would like to request that you leave.</text></dialogue>";
            introStr += "<option><id>142</id><text>Ungrateful people! And if we refuse to leave?</text>";
            introStr += "<choice><text>Then I will make you leave.</text><gotolabel>fight</gotolabel></choice>";
            introStr += "<choice><text>Sorry for bothering you.</text><gotolabel>leave</gotolabel></choice></option>";
            introStr += "<label>fight</label>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Bring it on!</text></dialogue>";
            introStr += "<outcome><end>1</end></outcome>";
            introStr += "<label>leave</label>";
            introStr += "<outcome><end>-1</end></outcome>";
            introStr += "</intro>";
            targetlvl = NodeGenerator.instance.getNodeLevel(nodeid);
            waveCount = rng.rand(3) + 3;
            waveid = "33|34|35|36|37|38";
            roomWidth = NodeGenerator.instance.getRoomWidth(questItem.getLocation());
            for(i = 0; i < waveCount; i++)
            {
               if(i == waveCount - 1)
               {
                  questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><fatal>0</fatal><id>39</id><lvl></lvl>" + (targetlvl + 2).toString() + "<qty>1</qty></enemy></wave>";
               }
               else if(i == 0)
               {
                  questStep1Str += "<wave><enemy><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty><x>650</x></enemy></wave>";
               }
               else
               {
                  questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy></wave>";
               }
            }
            endingStr = "<ending>";
            endingStr += "<dialogue><id>142</id><text>Alright! Fine! We will leave!</text></dialogue>";
            endingStr += "</ending>";
         }
         else
         {
            questStep1Str += "<action>0</action>";
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>" + territoryData.getTownName() + " has no further need for your services. They would like to request that you leave.</text></dialogue>";
            introStr += "<option><id>142</id><text>Fine. We will leave if you pay us 1000 coins.</text>";
            introStr += "<choice><text>Give Mercenary Captain 1000 coins</text><gotolabel>bribe</gotolabel><condition><has><id>11</id><qty>1000</qty><comp>gte</comp></has></condition></choice>";
            introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
            introStr += "<label>bribe</label>";
            introStr += "<outcome><id>11</id><modify>-1000</modify><end>0</end></outcome>";
            introStr += "<dialogue><id>142</id><text>Your generosity is much appreciated. We will be moving on soon.</text></dialogue>";
            introStr += "<outcome><end>1</end></outcome>";
            introStr += "<label>leave</label>";
            introStr += "<outcome><end>-1</end></outcome>";
            introStr += "</intro>";
         }
         questStep1Str += "</step>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.intro = questStep1Data.getXMLIntroList(XMLList(introStr));
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         if(endingStr != "")
         {
            questStep1Data.ending = questStep1Data.getXMLIntroList(XMLList(endingStr));
         }
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks! You have been a great help.</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateGraveyardQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = null;
         var templeLocation:int = 0;
         var i:int = 0;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var rng:RNG = null;
         var questItem:ItemAndLocation = null;
         var questStr:String = null;
         var questAcceptStr:String = null;
         var questTurnInStr:String = null;
         var questAutoTurnInStr:String = null;
         var questTurnInNPCResponseStr:String = null;
         var step1TitleStr:String = null;
         var step1ActionStr:String = null;
         var step2TitleStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var questDialogueStr3:String = null;
         var questDialogueStr4:String = null;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questStep2Str:String = null;
         var questStep2Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         territory = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         templeLocation = territoryData.getTemple();
         i = 0;
         while(i < 4 && templeLocation == -1)
         {
            if(i == 0)
            {
               templeLocation = NodeGenerator.instance.getTerritoryData(territory.x,territory.y - 1).getTemple();
            }
            else if(i == 1)
            {
               templeLocation = NodeGenerator.instance.getTerritoryData(territory.x,territory.y + 1).getTemple();
            }
            else if(i == 2)
            {
               templeLocation = NodeGenerator.instance.getTerritoryData(territory.x + 1,territory.y).getTemple();
            }
            else if(i == 3)
            {
               templeLocation = NodeGenerator.instance.getTerritoryData(territory.x - 1,territory.y).getTemple();
            }
            i++;
         }
         if(templeLocation == -1)
         {
            return this.generateItemQuest(nodeid,roomid,index,date);
         }
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_GRAVEYARD,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         rng = new RNG(nodeid * date + roomid * 3);
         questItem = new ItemAndLocation(null,templeLocation);
         questStr = "Quest: Get help from monks to cleanse the " + territoryData.getTownName() + " graveyard.";
         questAcceptStr = "I\'ll see what I can do.";
         var questAcceptNPCResponseStr:String = "Thanks!";
         questTurnInStr = "I have done as you asked.";
         questAutoTurnInStr = "Complete quest";
         questTurnInNPCResponseStr = "Thanks! You have been a great help!";
         step1TitleStr = "Talk to monk";
         step1ActionStr = "Talk to monk";
         step2TitleStr = "Return to " + questGiverName;
         questName = "Request monks to bless graveyard";
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         questDialogueStr3 = "";
         questDialogueStr4 = "";
         questDialogueStr1 = "We have reports that there is an undead horde in the neighboring territory. If they arrive here, they will raise up the dead in our graveyard to add to their ranks!";
         questDialogueStr2 = "If we can get monks to bless our graveyard, we can prevent them from rising.";
         questDialogueStr3 = "Please bring this message to the monk at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(questItem.nodeid,questItem.roomid) + ".";
         questDialogueStr4 = "I hope the monks arrive soon!";
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr3 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr4 + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>9</id><modify>" + questReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>11</id><modify>" + questCoinReward + "</modify><end>0</end></outcome>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>0</end></outcome>";
         introStr += "<outcome><id>50007</id><modify>5</modify><end>1</end></outcome>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks!</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItem.getLocation() + "</node>";
         questStep1Str += "<action>0</action>";
         questStep1Str += "<roomobj><room>0</room><id>4</id><name>monkcontact</name><x>-1</x><property>109</property></roomobj>";
         questStep1Str += "</step>";
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>I have been sent to request your help to cleanse the graveyard at " + territoryData.getTownName() + "</text></dialogue>";
         introStr += "<dialogue><id>109</id><text>I understand. I will dispatch a few acolytes there immediately.</text></dialogue>";
         introStr += "</intro>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<forshow>1</forshow>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.intro = questStep1Data.getXMLIntroList(XMLList(introStr));
         questStep1Data.title = step1TitleStr;
         questStep1Data.stitle = step1ActionStr;
         questStep2Str = "";
         questStep2Str += "<step>";
         questStep2Str += "<node>" + nodeid + "</node>";
         questStep2Str += "<action>0</action>";
         questStep2Str += "<roomobj><room>" + roomid + "</room><id>-1</id></roomobj>";
         questStep2Str += "</step>";
         questStep2Data = new XMLQuestStep(XML(questStep2Str));
         questStep2Data.title = step2TitleStr;
         introStr = "<intro>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAutoTurnInStr + "</text><gotolabel>complete</gotolabel><condition><has><id>91</id><qty>1</qty><comp>gte</comp></has></condition></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>complete</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questTurnInNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep2Data.intro = questStep2Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "<loot><id>50007</id><qty>5</qty></loot>";
         rewardStr += "</reward>";
         questStep2Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         questData.stepList[2] = questStep2Data;
         return questData;
      }
      
      internal function generateDuelQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territoryData:TerritoryData = null;
         var territory:Point = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var rng:RNG = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var dice:int = 0;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var endingStr:String = null;
         var targetlvl:int = 0;
         var rewardStr:String = null;
         var questData:XMLQuest = null;
         territory = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 6;
         questStep0Data.bg = -1;
         questStep0Data.stagewidth = NodeGenerator.instance.getRoomWidth(nodeid);
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_DUEL,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date);
         rng = new RNG(nodeid * date + roomid * 3);
         dice = rng.rand(4);
         if(dice == 0)
         {
            questDialogueStr1 = "Hey you look like you know how to use that sword! Would you like to spar?";
         }
         else if(dice == 1)
         {
            questDialogueStr1 = "My blade is thirsty for blood!";
         }
         else if(dice == 2)
         {
            questDialogueStr1 = "Would you like to engage in a friendly duel?";
         }
         else if(dice == 3)
         {
            questDialogueStr1 = "Please lose to me. I need to level up.";
         }
         dice = rng.rand(4);
         if(dice == 0)
         {
            questDialogueStr2 = "Wow you are good!";
         }
         else if(dice == 1)
         {
            questDialogueStr2 = "I surrender!";
         }
         else if(dice == 2)
         {
            questDialogueStr2 = "I will beat you the next time!";
         }
         else if(dice == 3)
         {
            questDialogueStr2 = "Arrrgh!";
         }
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         questReward /= 2;
         questCoinReward /= 2;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>duel</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>duel</label>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questGiverName + " has challenged you to a duel!</text>";
         introStr += "<choice><text>Accept challenge</text><gotolabel>accept</gotolabel></choice>";
         introStr += "<choice><text>Decline challenge</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>accept</label>";
         introStr += "<outcome><end>1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         endingStr = "<ending>";
         endingStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         endingStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
         endingStr += "</ending>";
         questStep0Data.ending = questStep0Data.getXMLIntroList(XMLList(endingStr));
         targetlvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questStep0Data.wave = new Vector.<XMLQuestWave>();
         questStep0Data.wave.push(new XMLQuestWave(XML("<wave><enemy><fatal>0</fatal><id>" + XMLNpc.INDEX_DUELIST + "</id><lvl>" + targetlvl.toString() + "</lvl><qty>1</qty><x>650</x></enemy></wave>")));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "</reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = "";
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         return questData;
      }
      
      internal function generateGuideQuest(nodeid:int, roomid:int, index:int, date:int, questReason:int, questGiver:int, questTargetLocation:int) : XMLQuest
      {
         var territory:Point = null;
         var territoryData:TerritoryData = null;
         var questStep0Data:XMLQuestStep = null;
         var questGiverName:String = null;
         var rng:RNG = null;
         var dungeonList:Array = null;
         var targetnodeid:int = 0;
         var roninResponse:int = 0;
         var questItem:ItemAndLocation = null;
         var questStr:String = null;
         var questAcceptStr:String = null;
         var questAcceptNPCResponseStr:String = null;
         var questTurnInStr:String = null;
         var questName:String = null;
         var questDialogueStr1:String = null;
         var questDialogueStr2:String = null;
         var flavorText:String = null;
         var nodelvl:int = 0;
         var questReward:int = 0;
         var questCoinReward:int = 0;
         var greetings:Array = null;
         var introStr:String = null;
         var rewardStr:String = null;
         var questStep1Str:String = null;
         var endingStr:String = null;
         var questStep1Data:XMLQuestStep = null;
         var questData:XMLQuest = null;
         var targetlvl:int = 0;
         var waveCount:int = 0;
         var waveid:String = null;
         var roomWidth:int = 0;
         var i:int = 0;
         territory = this.getTerritory(nodeid);
         territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y);
         questStep0Data = new XMLQuestStep(null);
         questStep0Data.nodeID = nodeid;
         questStep0Data.action = 0;
         this.storeCurrentNPC(nodeid,roomid,index,date,QuestItem.QUEST_GUIDE,questReason,questGiver,questTargetLocation);
         questGiverName = QuestGenerator.instance.getNPCName(nodeid,roomid,index,date,true);
         rng = new RNG(nodeid * date + roomid * 3);
         dungeonList = territoryData.getDungeonList();
         targetnodeid = int(dungeonList[rng.rand(dungeonList.length)]);
         roninResponse = rng.rand(4);
         questItem = new ItemAndLocation(null,targetnodeid);
         questStr = "Quest: Guide " + questGiverName + " to " + NodeGenerator.instance.getNodeName(targetnodeid);
         questAcceptStr = "Follow me.";
         questAcceptNPCResponseStr = "Thanks!";
         questTurnInStr = "Here it is.";
         questName = "Guide " + questGiverName + " to " + NodeGenerator.instance.getNodeName(targetnodeid);
         questDialogueStr1 = "";
         questDialogueStr2 = "";
         questDialogueStr1 = "I am on a quest and need to get to " + NodeGenerator.instance.getNodeName(targetnodeid) + ".";
         questDialogueStr2 = "Do you know the way there?";
         flavorText = "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr1 + "</text></dialogue>";
         flavorText += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questDialogueStr2 + "</text></dialogue>";
         nodelvl = NodeGenerator.instance.getNodeLevel(nodeid);
         questReward = (StatsManager.getXPLevelThreshhold(nodelvl + 1) - StatsManager.getXPLevelThreshhold(nodelvl)) / ((nodelvl + 1) * 1.2);
         if(StatsManager.getLevel() == StatsManager.levelCap)
         {
            questReward = 0;
         }
         questCoinReward = nodelvl * 5;
         questReward /= 2;
         questCoinReward /= 2;
         greetings = ["Ohayou!","Konnichiwa!","Nanika atta? (What\'s up?)","Dou shiteru? (How\'s everything?)","Kawatta koto aru? (What\'s new?)"];
         introStr = "<intro>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Konnichiwa Samurai-sama!</text></dialogue>";
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + greetings[int(Math.random() * greetings.length)] + "</text>";
         introStr += "<choice><text>Quest</text><gotolabel>quest</gotolabel><condition>" + QuestGenerator.instance.getNotCompletedQuestConditionStr(false) + "</condition></choice>";
         introStr += "<choice><text>Talk</text><gotolabel>talk</gotolabel></choice>";
         introStr += "<choice><text>Leave</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>quest</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>Is there anything that I can help you with?</text></dialogue>";
         introStr += flavorText;
         introStr += "<option><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questStr + "</text>";
         introStr += "<choice><text>" + questAcceptStr + "</text><gotolabel>accept</gotolabel><condition><has><id>91</id><qty>0</qty><comp>eq</comp></has></condition></choice>";
         introStr += "<choice><text>Maybe later</text><gotolabel>leave</gotolabel></choice></option>";
         introStr += "<label>accept</label>";
         introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + questAcceptNPCResponseStr + "</text></dialogue>";
         introStr += "<outcome><id>91</id><modify>1</modify><end>-1</end></outcome>";
         introStr += "<label>leave</label>";
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "<label>talk</label>";
         introStr += this.getNPCTalk(rng,territoryData);
         introStr += "<outcome><end>-1</end></outcome>";
         introStr += "</intro>";
         questStep0Data.intro = questStep0Data.getXMLIntroList(XMLList(introStr));
         rewardStr = "<reward></reward>";
         questStep0Data.reward = XMLList(rewardStr);
         questStep1Str = "";
         questStep1Str += "<step>";
         questStep1Str += "<node>" + questItem.getLocation() + "</node>";
         questStep1Str += "<roomobj><room>0</room><id>4</id><name>ronin</name><x>-1</x><property>" + XMLNpc.INDEX_NPCHOLDER + "</property></roomobj>";
         endingStr = "";
         if(roninResponse <= 2)
         {
            questStep1Str += "<action>0</action>";
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questTurnInStr + "</text></dialogue>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Thanks a lot!</text></dialogue>";
            introStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
            introStr += "</intro>";
         }
         else
         {
            questStep1Str += "<action>1</action>";
            introStr = "<intro>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_SELF + "</id><text>" + questTurnInStr + "</text></dialogue>";
            introStr += "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>Attack now!</text></dialogue>";
            introStr += "</intro>";
            targetlvl = NodeGenerator.instance.getNodeLevel(nodeid);
            waveCount = rng.rand(3) + 3;
            waveid = "11|12|13|14|15|16";
            roomWidth = NodeGenerator.instance.getRoomWidth(questItem.getLocation());
            for(i = 0; i < waveCount; i++)
            {
               if(i == waveCount - 1)
               {
                  questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><id>" + XMLNpc.INDEX_DUELIST + "</id><lvl></lvl>" + (targetlvl + 2).toString() + "<qty>1</qty></enemy></wave>";
               }
               else if(i == 0)
               {
                  questStep1Str += "<wave><enemy><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty><x>650</x></enemy></wave>";
               }
               else
               {
                  questStep1Str += "<wave><enemy><x>" + -100 + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + waveid + "</id><lvl>" + targetlvl + "</lvl><qty>" + (rng.rand(3) + 3).toString() + "</qty></enemy></wave>";
               }
            }
            endingStr = "<ending>";
            endingStr += "<outcome><id>91</id><modify>2</modify><end>1</end></outcome>";
            endingStr += "</ending>";
         }
         questStep1Str += "</step>";
         questStep1Data = new XMLQuestStep(XML(questStep1Str));
         rewardStr = "<reward>";
         rewardStr += "<exp>" + questReward + "</exp>";
         rewardStr += "<loot><id>0</id><qty>" + questCoinReward + "</qty></loot>";
         rewardStr += "</reward>";
         questStep1Data.reward = XMLList(rewardStr);
         questStep1Data.intro = questStep1Data.getXMLIntroList(XMLList(introStr));
         questStep1Data.title = "Guide " + questGiverName + " to " + NodeGenerator.instance.getNodeName(targetnodeid);
         questStep1Data.stitle = "Talk to " + questGiverName;
         if(endingStr != "")
         {
            questStep1Data.ending = questStep1Data.getXMLIntroList(XMLList(endingStr));
         }
         questData = new XMLQuest(null);
         questData.id = PROCGENQUEST;
         questData.startin = nodeid;
         questData.name = questName;
         questData.level = 0;
         questData.type = 3;
         questData.startCondition = null;
         questData.stepList = new Vector.<XMLQuestStep>();
         questData.stepList[0] = questStep0Data;
         questData.stepList[1] = questStep1Data;
         return questData;
      }
      
      internal function getNPCTalk(rng:RNG, territoryData:TerritoryData) : String
      {
         var dialogueStr:String = null;
         var dice:int = 0;
         dialogueStr = "";
         dice = rng.rand(8);
         dice = 6;
         if(dice == 0)
         {
            dialogueStr = "I\'ve got nothing to say to you.";
         }
         else if(dice == 1)
         {
            dialogueStr = "Have a nice day!";
         }
         else if(dice == 2)
         {
            dialogueStr = "(mumble mumble)";
         }
         else if(dice == 3)
         {
            dialogueStr = "Good day!";
         }
         else if(dice == 4)
         {
            dialogueStr = "Nice hat!";
         }
         else if(dice == 5)
         {
            dialogueStr = "(grumble)";
         }
         else if(dice == 6 && territoryData.encounterList.length > 0)
         {
            dialogueStr = this.getEncounterRelatedDialogue(rng,territoryData);
         }
         else
         {
            dialogueStr = GameEngine.getRandomTip();
         }
         return "<dialogue><id>" + XMLNpc.INDEX_NPCHOLDER + "</id><text>" + dialogueStr + "</text></dialogue>";
      }
      
      internal function getEncounterRelatedDialogue(rng:RNG, territoryData:TerritoryData) : String
      {
         var encounter:int = 0;
         var str:String = null;
         encounter = int(territoryData.encounterList[rng.rand(territoryData.encounterList.length)]);
         str = "...";
         if(encounter == EncounterItem.BANDITS_ONI)
         {
            str = "I saw some bandits fighting oni today. What a battle!";
         }
         else if(encounter == EncounterItem.BANDITS_UNDEAD)
         {
            str = "I saw some bandits fighting the undead today. At least they have something better to do than rob us.";
         }
         else if(encounter == EncounterItem.BANDITS_WILDLIFE)
         {
            str = "Cursed poachers! They keep hunting illegally!";
         }
         else if(encounter == EncounterItem.BANDITS_BANDITS)
         {
            str = "Did you hear? There was a fight between two bandit gangs today.";
         }
         else if(encounter == EncounterItem.MERC_BANDITS)
         {
            str = "The mercenaries are doing a good job chasing of the bandits.";
         }
         else if(encounter == EncounterItem.MERC_ONI)
         {
            str = "The mercenaries are doing a good job fighting off the Oni.";
         }
         else if(encounter == EncounterItem.MERC_UNDEAD)
         {
            str = "The mercenaries are doing a good job getting rid of the Undead.";
         }
         else if(encounter == EncounterItem.NINJA_BANDITS)
         {
            str = "Bandits are no match for the ninja!";
         }
         else if(encounter == EncounterItem.NINJA_ONI)
         {
            str = "The ninja will save us from the oni!";
         }
         else if(encounter == EncounterItem.NINJA_UNDEAD)
         {
            str = "The ninja will definitely keep the undead away!";
         }
         else if(encounter == EncounterItem.VILLAGE_WILDLIFE)
         {
            str = "Today is a good day to go hunting.";
         }
         else if(encounter == EncounterItem.BANDITS)
         {
            str = "Word has it that there is a bandit hideout somewhere nearby.";
         }
         else if(encounter == EncounterItem.ONI)
         {
            str = "Be careful when entering caves. There is an oni den somewhere in this territory.";
         }
         else if(encounter == EncounterItem.UNDEAD)
         {
            str = "There is undead roaming in the graveyard. Scary!";
         }
         else if(encounter == EncounterItem.WILDLIFE)
         {
            str = "There are certain locations nearby that are good for hunting.";
         }
         else if(encounter == EncounterItem.BANDITS_ROAMING)
         {
            str = "Be careful of bandits! They have been seen around.";
         }
         else if(encounter == EncounterItem.ONI_ROAMING)
         {
            str = "Watch out for the Oni! They have been seen lurking around.";
         }
         else if(encounter == EncounterItem.UNDEAD_ROAMING)
         {
            str = "The undead horde is here. Be wary!";
         }
         else if(encounter == EncounterItem.WILDLIFE_ROAMING)
         {
            str = "Hunting is good today!";
         }
         else if(encounter == EncounterItem.BANDITS_VILLAGE)
         {
            str = "The village is under attack by the bandits! I hope I don\'t die.";
         }
         else if(encounter == EncounterItem.ONI_VILLAGE)
         {
            str = "The Oni are here! Can you help?";
         }
         else if(encounter == EncounterItem.UNDEAD_VILLAGE)
         {
            str = "The undead are attacking! Will you save us?";
         }
         else if(encounter == EncounterItem.MERCCAMP)
         {
            str = "The mercenaries have set up camp in this territory.";
         }
         else if(encounter == EncounterItem.NINJAVILLAGE)
         {
            str = "Rumor has it that there is a hidden ninja village in this territory.";
         }
         return str;
      }
   }
}

