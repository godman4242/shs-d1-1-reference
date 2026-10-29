package
{
   import playerio.DatabaseObject;
   
   public class TerritoryData
   {
      
      internal var territoryID:int;
      
      internal var dungeonList:Array = new Array();
      
      internal var controlPointList:Array = new Array();
      
      internal var pickableList:Array = new Array();
      
      internal var exitsList:Array = new Array();
      
      internal var hutList:Array = new Array();
      
      internal var animalSpawnList:Array = new Array();
      
      internal var recentEvents:String = "";
      
      internal var dojoNode:int = -1;
      
      internal var templeNode:int = -1;
      
      internal var oniDenNode:int = -1;
      
      internal var graveyardNode:int = -1;
      
      internal var mercCampNode:int = -1;
      
      internal var overwriteNode:int = -1;
      
      internal var townProsperity:int = 0;
      
      internal var townName:String = "";
      
      internal var townSide:int = 0;
      
      internal var customClanOwnerName:String = LangManager.getString(813);
      
      internal var customClanOwnerTextColor:String = "#666666";
      
      internal var dataFromServer:Boolean = false;
      
      internal var nodeExits:Array = new Array();
      
      internal var townNode:int = -1;
      
      internal var atWar:int = 0;
      
      internal var questList:Array = new Array();
      
      internal var encounterList:Array = new Array(22);
      
      internal var battleReportList:Array = new Array();
      
      internal var townFounder:String = "";
      
      internal var townHeroes:String = "";
      
      internal var townEnemies:String = "";
      
      internal var clanInfluence:IntMap;
      
      internal var extraData:Boolean = false;
      
      private var aggroLocationList:Array;
      
      public function TerritoryData(id:int)
      {
         super();
         this.territoryID = id;
         this.nodeExits = this.generateSectors();
         this.townName = NameGenerator.getInstance().getPlaceName(this.territoryID);
         this.townProsperity = 0;
         this.townSide = 0;
         this.atWar = 0;
         this.setDefault();
      }
      
      public static function getNorthExits(territoryId:int) : Array
      {
         var rng:RNG = new RNG(territoryId);
         var dice:int = rng.rand(3);
         var count:int = 1;
         if(dice == 3)
         {
            count = 2;
         }
         var output:Array = new Array();
         for(var i:int = 0; i < count; i++)
         {
            output.push(rng.rand(4) + 1);
         }
         return output;
      }
      
      public static function getSouthExits(territoryId:int) : Array
      {
         var south:int = NodeGenerator.instance.getShiftedNodeId(territoryId,0,1);
         return getNorthExits(south);
      }
      
      public static function getWestExits(territoryId:int) : Array
      {
         var rng:RNG = new RNG(territoryId * 2);
         var dice:int = rng.rand(3);
         var count:int = 1;
         if(dice == 3)
         {
            count = 2;
         }
         var output:Array = new Array();
         for(var i:int = 0; i < count; i++)
         {
            output.push(rng.rand(4) + 1);
         }
         return output;
      }
      
      public static function getEastExits(territoryId:int) : Array
      {
         var east:int = NodeGenerator.instance.getShiftedNodeId(territoryId,1,0);
         return getWestExits(east);
      }
      
      public function isInBoundary() : Boolean
      {
         var territoryy:int = this.territoryID & 0x0FFF;
         var territoryx:int = this.territoryID >> 12 & 0x0FFF;
         return QuestEngine.hasTerritory(territoryx,territoryy);
      }
      
      public function getID() : int
      {
         return this.territoryID;
      }
      
      public function hasTown() : Boolean
      {
         return this.townProsperity > 0 && this.townNode != -1;
      }
      
      public function isDungeon(nodeid:int) : *
      {
         var max:int = int(this.dungeonList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.dungeonList[i] == nodeid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasPickable(nodeid:int) : *
      {
         var max:int = int(this.pickableList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.pickableList[i] == nodeid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isExit(nodeid:int) : *
      {
         var max:int = int(this.exitsList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.exitsList[i] == nodeid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isBeach(nodeid:int) : Boolean
      {
         if(!this.isExit(nodeid))
         {
            return false;
         }
         return NodeGenerator.instance.isSeaSide(nodeid);
      }
      
      public function isControlPoint(nodeid:int) : *
      {
         var max:int = int(this.controlPointList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.controlPointList[i] == nodeid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isHut(nodeid:int) : *
      {
         var max:int = int(this.hutList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.hutList[i] == nodeid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isAnimalSpawn(nodeid:int) : *
      {
         var max:int = int(this.animalSpawnList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.animalSpawnList[i] == nodeid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isDojo(nodeid:int) : *
      {
         return this.dojoNode == nodeid;
      }
      
      public function getDojo() : int
      {
         return this.dojoNode;
      }
      
      public function isTemple(nodeid:int) : *
      {
         return this.templeNode == nodeid;
      }
      
      public function getTemple() : int
      {
         return this.templeNode;
      }
      
      public function isGraveyard(nodeid:int) : *
      {
         return this.graveyardNode == nodeid;
      }
      
      public function getGraveyard() : int
      {
         return this.graveyardNode;
      }
      
      public function isOniDen(nodeid:int) : *
      {
         return this.oniDenNode == nodeid;
      }
      
      public function getOniDen() : int
      {
         return this.oniDenNode;
      }
      
      public function hasOniDen() : Boolean
      {
         return this.oniDenNode != -1 && this.hasEncounter(EncounterItem.ONI);
      }
      
      public function isMercCamp(nodeid:int) : *
      {
         return this.mercCampNode == nodeid;
      }
      
      public function getMercCamp() : int
      {
         return this.mercCampNode;
      }
      
      public function isOverwriteNode(nodeid:int) : *
      {
         return this.overwriteNode == nodeid;
      }
      
      public function getOverwriteNode() : int
      {
         return this.overwriteNode;
      }
      
      public function isNinjaVillage(nodeid:int) : *
      {
         var rng:RNG = new RNG(this.territoryID);
         return this.townNode == nodeid && this.townProsperity == 0 && !NodeGenerator.instance.isNoChangeTown(this.territoryID) && rng.rand(2) == 0;
      }
      
      public function isNinjaTrail(nodeid:int) : *
      {
         var rng:RNG = new RNG(this.territoryID);
         return this.townNode == nodeid && this.townProsperity == 0 && !NodeGenerator.instance.isNoChangeTown(this.territoryID) && rng.rand(2) != 0;
      }
      
      public function isTown(nodeid:int) : *
      {
         return this.townNode == nodeid && this.townProsperity > 0;
      }
      
      public function getTown() : int
      {
         if(this.townProsperity > 0)
         {
            return this.townNode;
         }
         return -1;
      }
      
      public function getTownNode() : int
      {
         return this.townNode;
      }
      
      public function getTownFounder() : String
      {
         return this.townFounder;
      }
      
      public function getTownHeroes() : String
      {
         return this.townHeroes.split("|").join(", ");
      }
      
      public function getTownEnemies() : String
      {
         return this.townEnemies.split("|").join(", ");
      }
      
      public function getClanInfluence() : String
      {
         var str:String = "<font color=\'#FF0000\'>" + this.clanInfluence.getInt(1) + "</font>/<font color=\'#00FF00\'>" + this.clanInfluence.getInt(2) + "</font>/<font color=\'#00FFFF\'>" + this.clanInfluence.getInt(3) + "</font>/<font color=\'#FFFF00\'>" + this.clanInfluence.getInt(4) + "</font>";
         var keys:Array = this.clanInfluence.getKeys();
         var values:Array = this.clanInfluence.getValues();
         var max:int = int(keys.length);
         var highestValue:int = -1;
         for(var i:int = 0; i < max; i++)
         {
            if(StatsManager.isCustomClan(keys[i]) && keys[i] != StatsManager.getSide())
            {
               if(values[i] > highestValue)
               {
                  highestValue = int(values[i]);
               }
            }
         }
         if(highestValue > -1)
         {
            str += "/<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>" + highestValue + "</font>";
         }
         if(StatsManager.isCustomClan(StatsManager.getSide()))
         {
            str += "/<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>" + this.clanInfluence.getInt(StatsManager.getSide()) + "</font>";
         }
         return str;
      }
      
      public function addToClanInfluence(side:int, inf:int) : *
      {
         if(this.clanInfluence == null)
         {
            return;
         }
         var currentInfluence:int = this.clanInfluence.getInt(side);
         currentInfluence += inf;
         this.clanInfluence.put(side,currentInfluence,true);
      }
      
      public function changeProsperity(pros:int) : *
      {
         this.townProsperity += pros;
         if(pros < 0)
         {
            pros = 0;
         }
      }
      
      public function isAbandonedTown() : Boolean
      {
         return this.townProsperity > 0 && this.townProsperity < 500;
      }
      
      public function territoryAtWar() : Boolean
      {
         return this.atWar == 1 && !NodeGenerator.instance.isStoryQuestTown(this.territoryID);
      }
      
      public function getDungeonList() : Array
      {
         return this.dungeonList;
      }
      
      public function getHutList() : Array
      {
         return this.hutList;
      }
      
      public function getControlPointList() : Array
      {
         return this.controlPointList;
      }
      
      public function getPickableList() : Array
      {
         return this.pickableList;
      }
      
      internal function setDefault() : *
      {
         var rng:RNG = null;
         var dice:int = QuestEngine.getTownState(this.territoryID);
         if(QueryManager.instance.offlineMode)
         {
            rng = new RNG(this.territoryID);
            dice = rng.rand(7);
         }
         if(dice == 0)
         {
            this.townProsperity = 0;
         }
         else if(dice == 1)
         {
            this.townProsperity = 250;
         }
         else if(dice == 2)
         {
            this.townProsperity = 750;
         }
         else if(dice == 3)
         {
            this.townProsperity = 1500;
         }
         else if(dice == 4)
         {
            this.townProsperity = 2500;
         }
         else if(dice == 5)
         {
            this.townProsperity = 5000;
         }
         else
         {
            this.townProsperity = 0;
         }
         this.townSide = 0;
         this.atWar = 0;
      }
      
      public function setTerrData(terrdata:String) : *
      {
         var innerStrArray:Array = null;
         var inner2StrArray:Array = null;
         var max:int = 0;
         var max2:int = 0;
         var i:int = 0;
         var questdata:String = null;
         var questitem:QuestItem = null;
         var encounterdata:String = null;
         var battlereports:String = null;
         var battleReport:BattleReport = null;
         this.dataFromServer = true;
         var strArray:Array = terrdata.split(",");
         this.questList = new Array();
         this.encounterList = new Array();
         this.battleReportList = new Array();
         if(NodeGenerator.instance.isNoChangeTown(this.territoryID))
         {
            if(this.territoryID == 1397077)
            {
               this.townProsperity = 0;
               this.townSide = 0;
            }
            else if(this.territoryID == 1397078)
            {
               this.townProsperity = 0;
               this.townSide = 0;
            }
            else if(this.territoryID == 1397078)
            {
               this.townProsperity = 1500;
               this.townSide = 0;
            }
            else if(this.territoryID == 1413461)
            {
               this.townProsperity = 5000;
               this.townSide = 2;
            }
            else if(this.territoryID == 1405270)
            {
               this.townProsperity = 2500;
               this.townSide = 0;
            }
            else if(this.territoryID == 1409366)
            {
               this.townProsperity = 5000;
               this.townSide = 4;
            }
            else if(this.territoryID == 1401176)
            {
               this.townProsperity = 5000;
               this.townSide = 3;
            }
            else if(this.territoryID == 1397081)
            {
               this.townProsperity = 5000;
               this.townSide = 1;
            }
            else if(this.territoryID == 1466699)
            {
               this.townProsperity = 5000;
               this.townSide = 4;
            }
            else if(this.territoryID == 1503572)
            {
               this.townProsperity = 5000;
               this.townSide = 2;
            }
            else if(this.territoryID == 1368424)
            {
               this.townProsperity = 5000;
               this.townSide = 3;
            }
            else if(this.territoryID == 1540387)
            {
               this.townProsperity = 5000;
               this.townSide = 1;
            }
            else
            {
               this.setDefault();
            }
            return;
         }
         if(strArray.length == 7 || strArray.length == 4)
         {
            if(!NodeGenerator.instance.isNoChangeTown(this.territoryID))
            {
               if(strArray[0] != "0")
               {
                  this.townProsperity = int(strArray[0]);
               }
               this.townSide = int(strArray[1]);
               if(strArray[2] != "")
               {
                  this.townName = strArray[2];
               }
               this.atWar = int(strArray[3]);
            }
            if(strArray.length == 7)
            {
               questdata = strArray[4];
               innerStrArray = questdata.split("@");
               max = int(innerStrArray.length);
               for(i = 0; i < max; i++)
               {
                  inner2StrArray = innerStrArray[i].split("!");
                  if(inner2StrArray.length == 4)
                  {
                     questitem = new QuestItem(inner2StrArray[0],inner2StrArray[1],inner2StrArray[2],inner2StrArray[3]);
                     this.questList.push(questitem);
                  }
               }
               this.questList.push(new QuestItem(QuestItem.VILLAGESIM,QuestItem.QUEST_ITEM,QuestItem.REASON_FORITEMS));
               encounterdata = strArray[5];
               innerStrArray = encounterdata.split("@");
               for(i = 0; i < 22; i++)
               {
                  this.encounterList[i] = false;
               }
               max = int(innerStrArray.length);
               for(i = 0; i < max; i++)
               {
                  this.encounterList[int(innerStrArray[i])] = true;
               }
               battlereports = strArray[6];
               innerStrArray = battlereports.split("@");
               max = int(innerStrArray.length);
               for(i = 0; i < max; i++)
               {
                  inner2StrArray = innerStrArray[i].split("!");
                  if(inner2StrArray.length == 7)
                  {
                     battleReport = new BattleReport(inner2StrArray[0],inner2StrArray[1],inner2StrArray[2],inner2StrArray[3],inner2StrArray[4],inner2StrArray[5],inner2StrArray[6]);
                     this.battleReportList.push(battleReport);
                  }
               }
            }
         }
         else if(!NodeGenerator.instance.isNoChangeTown(this.territoryID))
         {
            this.setDefault();
         }
         if(NodeGenerator.instance.isStoryQuestTown(this.territoryID) && this.townProsperity < 500)
         {
            this.townProsperity = 500;
         }
         if(this.territoryID == 1470806)
         {
            this.townProsperity = 1500;
         }
         else if(this.territoryID == 1442136)
         {
            this.townProsperity = 0;
         }
      }
      
      public function hasDataFromServer() : Boolean
      {
         return this.dataFromServer;
      }
      
      public function setTerrExtraData(terrdata:String, influence:Array) : *
      {
         var i:int = 0;
         var index:String = null;
         var strArray:Array = terrdata.split(",");
         this.townFounder = strArray[0];
         this.townHeroes = strArray[1];
         this.townEnemies = strArray[2];
         this.extraData = true;
         this.clanInfluence = new IntMap();
         this.clanInfluence.put(1,0);
         this.clanInfluence.put(2,0);
         this.clanInfluence.put(3,0);
         this.clanInfluence.put(4,0);
         if(strArray.length >= 7)
         {
            this.clanInfluence.put(1,int(strArray[3]),true);
            this.clanInfluence.put(2,int(strArray[4]),true);
            this.clanInfluence.put(3,int(strArray[5]),true);
            this.clanInfluence.put(4,int(strArray[6]),true);
         }
         if(influence != null)
         {
            for(index in influence)
            {
               i = int(index);
               this.clanInfluence.put(int(i),influence[i],true);
            }
         }
      }
      
      public function hasExtraData() : Boolean
      {
         return this.extraData;
      }
      
      public function showTownData() : *
      {
         var playerside:int = 0;
         var iToConvert:int = 0;
         if(!this.extraData)
         {
            QueryManager.instance.getTownData(this.territoryID >> 12 & 0x0FFF,this.territoryID & 0x0FFF);
         }
         var townlevel:int = this.getTownLevel();
         var output:String = "<font color=\'#FFFFFF\'>" + this.getTownName() + "</font>\n";
         if(!NodeGenerator.instance.isNoChangeTown(this.territoryID))
         {
            output += "(prosperity: " + this.getProsperityStr() + ")\n";
         }
         else
         {
            output += LangManager.getString(584) + "\n";
         }
         if(this.extraData && this.townFounder != null && this.townFounder != "")
         {
            output += LangManager.getString(496) + " " + this.townFounder + "\n";
         }
         output += LangManager.getString(554) + NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) + "\n\n";
         if(townlevel == 1)
         {
            output += LangManager.getString(493) + "\n";
         }
         else if(!NodeGenerator.instance.isNoChangeTown(this.territoryID) && (this.townSide == 0 || this.townSide == 5))
         {
            output += LangManager.getString(585) + "\n";
         }
         else if(this.townSide == 1)
         {
            output += LangManager.getString(490) + "<font color=\'#FF0000\'>" + LangManager.getString(275) + "</font>\n";
         }
         else if(this.townSide == 2)
         {
            output += LangManager.getString(490) + "<font color=\'#00FF00\'>" + LangManager.getString(276) + "</font>\n";
         }
         else if(this.townSide == 3)
         {
            output += LangManager.getString(490) + "<font color=\'#00FFFF\'>" + LangManager.getString(277) + "</font>\n";
         }
         else if(this.townSide == 4)
         {
            output += LangManager.getString(490) + "<font color=\'#FFFF00\'>" + LangManager.getString(278) + "</font>\n";
         }
         else if(StatsManager.isCustomClan(this.townSide))
         {
            if(this.townSide == StatsManager.getSide())
            {
               output += LangManager.getString(490) + "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>" + StatsManager.getCustomClanName() + "</font>\n";
            }
            else
            {
               output += LangManager.getString(490) + "<font color=\'" + this.customClanOwnerTextColor + "\'>" + this.customClanOwnerName + "</font>\n";
            }
         }
         if(this.territoryAtWar())
         {
            output += "\n" + LangManager.getString(560) + "\n";
         }
         else if(this.extraData)
         {
            if(this.clanInfluence != null && !NodeGenerator.instance.isNoChangeTown(this.territoryID))
            {
               output += LangManager.getString(561) + this.getClanInfluence() + "\n";
               playerside = StatsManager.getSide();
               if(this.townSide != playerside && playerside != 0)
               {
                  if(this.townSide == 0 || this.townSide == 5)
                  {
                     iToConvert = 100;
                  }
                  else
                  {
                     iToConvert = this.clanInfluence.getInt(this.townSide) * 2;
                  }
                  if(iToConvert < 100)
                  {
                     iToConvert = 100;
                  }
                  output += LangManager.getString(626);
                  if(playerside == 1)
                  {
                     output += "<font color=\'#FF0000\'>";
                  }
                  else if(playerside == 2)
                  {
                     output += "<font color=\'#00FF00\'>";
                  }
                  else if(playerside == 3)
                  {
                     output += "<font color=\'#00FFFF\'>";
                  }
                  else if(playerside == 4)
                  {
                     output += "<font color=\'#FFFF00\'>";
                  }
                  else if(StatsManager.isCustomClan(playerside))
                  {
                     output += "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
                  }
                  else
                  {
                     output += "<font>";
                  }
                  output += iToConvert + "</font>\n";
               }
            }
            if(this.townHeroes != null && this.townHeroes != "")
            {
               output += "\n" + LangManager.getString(562) + this.getTownHeroes();
            }
         }
         OverworldHUD.instance.dialogBig.show("",LangManager.getString(5),true,2);
         OverworldHUD.instance.dialogBig.showHTML(output);
      }
      
      public function getTownLevel() : int
      {
         if(this.townProsperity == 0)
         {
            return 0;
         }
         if(this.townProsperity < 500)
         {
            return 1;
         }
         if(this.townProsperity < 1000)
         {
            return 2;
         }
         if(this.townProsperity < 2000)
         {
            return 3;
         }
         if(this.townProsperity < 4000)
         {
            return 4;
         }
         return 5;
      }
      
      public function getProsperityStr() : String
      {
         if(this.townProsperity == 0)
         {
            return "0";
         }
         if(this.townProsperity < 500)
         {
            return this.townProsperity + "/" + 500;
         }
         if(this.townProsperity < 1000)
         {
            return this.townProsperity + "/" + 1000;
         }
         if(this.townProsperity < 2000)
         {
            return this.townProsperity + "/" + 2000;
         }
         if(this.townProsperity < 4000)
         {
            return this.townProsperity + "/" + 4000;
         }
         return this.townProsperity.toString();
      }
      
      public function getTownName() : String
      {
         var lvl:int = this.getTownLevel();
         if(lvl == 0)
         {
            return "";
         }
         if(lvl == 1)
         {
            return this.townName + " " + LangManager.getString(450);
         }
         if(lvl == 2)
         {
            return this.townName + " " + LangManager.getString(450);
         }
         if(lvl == 3)
         {
            return this.townName + " " + LangManager.getString(451);
         }
         if(lvl == 4)
         {
            return this.townName + " " + LangManager.getString(452);
         }
         return this.townName + " " + LangManager.getString(453);
      }
      
      public function getTownSide() : int
      {
         return this.townSide;
      }
      
      public function getNodeExits(x:int, y:int) : Array
      {
         var num:int = int(this.nodeExits[x][y]);
         return [num & 1,num >> 1 & 1,num >> 2 & 1,num >> 3 & 1];
      }
      
      public function getNodeExitsNum(x:int, y:int) : int
      {
         return this.nodeExits[x][y];
      }
      
      public function getLocationType(nodeid:int) : int
      {
         var locationType:int = 0;
         var rng:RNG = null;
         if(nodeid == 8472589)
         {
            return NodeGenerator.ICON_CAVE;
         }
         if(this.isDungeon(nodeid))
         {
            rng = new RNG(nodeid);
            if(NodeGenerator.instance.getRoomBG(nodeid) == GameStage.BG_MOUNTAIN)
            {
               if(rng.rand(2) == 0)
               {
                  locationType = NodeGenerator.ICON_CAVE;
               }
               else
               {
                  locationType = NodeGenerator.ICON_MINE;
               }
            }
            else
            {
               locationType = NodeGenerator.ICON_DUNGEON;
            }
         }
         else if(this.isTown(nodeid))
         {
            locationType = NodeGenerator.ICON_TOWN;
         }
         else if(this.isNinjaVillage(nodeid))
         {
            locationType = NodeGenerator.ICON_NINJAVILLAGE;
         }
         else if(this.isNinjaTrail(nodeid))
         {
            locationType = NodeGenerator.ICON_NINJATRAIL;
         }
         else if(this.isDojo(nodeid))
         {
            locationType = NodeGenerator.ICON_DOJO;
         }
         else if(this.isTemple(nodeid))
         {
            locationType = NodeGenerator.ICON_TEMPLE;
         }
         else if(this.isGraveyard(nodeid))
         {
            locationType = NodeGenerator.ICON_GRAVEYARD;
         }
         else if(this.isOniDen(nodeid))
         {
            locationType = NodeGenerator.ICON_ONIDEN;
         }
         else if(this.isMercCamp(nodeid))
         {
            locationType = NodeGenerator.ICON_MERCCAMP;
         }
         else if(this.isAnimalSpawn(nodeid))
         {
            locationType = NodeGenerator.ICON_ANIMALSPAWN;
         }
         else if(this.isControlPoint(nodeid))
         {
            locationType = NodeGenerator.ICON_CONTROL;
         }
         else if(this.isHut(nodeid))
         {
            locationType = NodeGenerator.ICON_HUT;
         }
         else if(this.isExit(nodeid))
         {
            if(NodeGenerator.instance.isSeaSide(nodeid))
            {
               locationType = NodeGenerator.ICON_BEACH;
            }
            else
            {
               locationType = NodeGenerator.ICON_EXIT;
            }
         }
         else if(this.hasPickable(nodeid))
         {
            locationType = NodeGenerator.ICON_PICKABLE;
         }
         else if(this.isOverwriteNode(nodeid))
         {
            locationType = NodeGenerator.ICON_OVERWRITENODE;
         }
         return locationType;
      }
      
      public function hasEncounter(num:int) : Boolean
      {
         if(NodeGenerator.instance.isNoChangeTown(this.territoryID))
         {
            return false;
         }
         if(!this.isInBoundary() && (num == EncounterItem.BANDITS_ROAMING || num == EncounterItem.ONI_ROAMING || num == EncounterItem.UNDEAD_ROAMING))
         {
            return true;
         }
         return this.encounterList[num];
      }
      
      public function getQuestList() : Array
      {
         return this.questList;
      }
      
      public function getAggoSpawnLocations() : Array
      {
         var territoryx:int = 0;
         var territoryy:int = 0;
         var nodeid:int = 0;
         var i:int = 0;
         var j:int = 0;
         if(this.aggroLocationList == null)
         {
            territoryx = this.territoryID >> 12 & 0x0FFF;
            territoryy = this.territoryID & 0x0FFF;
            this.aggroLocationList = new Array();
            for(i = 0; i < 6; i++)
            {
               for(j = 0; j < 6; j++)
               {
                  nodeid = territoryx * 6 + i << 12 | territoryy * 6 + j;
                  if(nodeid != this.dojoNode && nodeid != this.graveyardNode && nodeid != this.mercCampNode)
                  {
                     this.aggroLocationList.push(nodeid);
                  }
               }
            }
         }
         return this.aggroLocationList;
      }
      
      public function getRecentEvents() : *
      {
         if(this.recentEvents == "")
         {
            OverworldHUD.instance.interactUI.detailstext.text = "Loading...";
            QueryManagerPIO.instance.getRecentEvents(this.territoryID);
         }
         else
         {
            OverworldHUD.instance.interactUI.detailstext.text = this.recentEvents;
         }
      }
      
      public function gotRecentEvents(array:Array) : *
      {
         if(array == null || array.length == 0)
         {
            this.recentEvents = "No events recorded.";
         }
         else
         {
            this.recentEvents = HistoryItem.parseData(array,this.townProsperity);
         }
         if(OverworldHUD.instance.interactUI.visible && OverworldHUD.instance.interactUI.uimode == InteractUI.UIMODE_RECENTEVENTSBOARD)
         {
            OverworldHUD.instance.interactUI.detailstext.text = this.recentEvents;
         }
      }
      
      public function gotCustomClanData(o:DatabaseObject) : *
      {
         if(o.clanname != "?")
         {
            this.customClanOwnerName = LangManager.getString(563) + " " + o.clanname;
         }
         for(var str:String = o.color.toString(16); str.length < 6; )
         {
            str = "0" + str;
         }
         this.customClanOwnerTextColor = "#" + str;
      }
      
      internal function generateSectors() : Array
      {
         var sectorBuild:SectorBuild = null;
         var exits:Array = null;
         var max:int = 0;
         var index:int = 0;
         var j:int = 0;
         var exitIndex:int = 0;
         var routeOK:Boolean = false;
         var counter:int = 0;
         var counterMax:int = 0;
         var fields:Array = null;
         var rng:RNG = new RNG(this.territoryID);
         var sectorBuildArray:Array = new Array();
         var emptyList:Array = new Array();
         var territoryx:int = this.territoryID >> 12 & 0x0FFF;
         var territoryy:int = this.territoryID & 0x0FFF;
         for(var i:int = 0; i < 6; i++)
         {
            sectorBuildArray[i] = new Array();
            for(j = 0; j < 6; j++)
            {
               sectorBuild = new SectorBuild(i,j,territoryx * 6 + i << 12 | territoryy * 6 + j);
               sectorBuildArray[i][j] = sectorBuild;
               emptyList.push(sectorBuild);
            }
         }
         var exitList:Array = new Array();
         var secondExitList:Array = new Array();
         var sectory:int = this.territoryID & 0x0FFF;
         var sectorx:int = this.territoryID >> 12 & 0x0FFF;
         exits = getNorthExits(this.territoryID);
         max = int(exits.length);
         for(i = 0; i < max; i++)
         {
            sectorBuild = sectorBuildArray[exits[i]][0];
            sectorBuild.setType(SectorBuild.TYPE_EXIT);
            if(QuestEngine.hasTerritory(territoryx,territoryy - 1))
            {
               sectorBuild.addExit(SectorBuild.DIR_N);
            }
            index = emptyList.indexOf(sectorBuild);
            emptyList.splice(index,1);
            if(i == 0)
            {
               exitList.push(sectorBuild);
            }
            else
            {
               secondExitList.push(sectorBuild);
            }
         }
         exits = getSouthExits(this.territoryID);
         max = int(exits.length);
         for(i = 0; i < max; i++)
         {
            sectorBuild = sectorBuildArray[exits[i]][5];
            sectorBuild.setType(SectorBuild.TYPE_EXIT);
            if(QuestEngine.hasTerritory(territoryx,territoryy + 1))
            {
               sectorBuild.addExit(SectorBuild.DIR_S);
            }
            index = emptyList.indexOf(sectorBuild);
            emptyList.splice(index,1);
            if(i == 0)
            {
               exitList.push(sectorBuild);
            }
            else
            {
               secondExitList.push(sectorBuild);
            }
         }
         exits = getEastExits(this.territoryID);
         max = int(exits.length);
         for(i = 0; i < max; i++)
         {
            sectorBuild = sectorBuildArray[5][exits[i]];
            sectorBuild.setType(SectorBuild.TYPE_EXIT);
            if(QuestEngine.hasTerritory(territoryx + 1,territoryy))
            {
               sectorBuild.addExit(SectorBuild.DIR_E);
            }
            index = emptyList.indexOf(sectorBuild);
            emptyList.splice(index,1);
            if(i == 0)
            {
               exitList.push(sectorBuild);
            }
            else
            {
               secondExitList.push(sectorBuild);
            }
         }
         exits = getWestExits(this.territoryID);
         max = int(exits.length);
         for(i = 0; i < max; i++)
         {
            sectorBuild = sectorBuildArray[0][exits[i]];
            sectorBuild.setType(SectorBuild.TYPE_EXIT);
            if(QuestEngine.hasTerritory(territoryx - 1,territoryy))
            {
               sectorBuild.addExit(SectorBuild.DIR_W);
            }
            index = emptyList.indexOf(sectorBuild);
            emptyList.splice(index,1);
            if(i == 0)
            {
               exitList.push(sectorBuild);
            }
            else
            {
               secondExitList.push(sectorBuild);
            }
         }
         for(i = 0; i < 4; i += 2)
         {
            this.createRoute(exitList[i],exitList[i + 1],sectorBuildArray,emptyList,rng,false);
            this.exitsList.push(exitList[i].getNodeId());
            this.exitsList.push(exitList[i + 1].getNodeId());
         }
         max = int(secondExitList.length);
         for(i = 0; i < max; i++)
         {
            this.createRoute(secondExitList[i],exitList[rng.rand(exitList.length)],sectorBuildArray,emptyList,rng,false);
            this.exitsList.push(secondExitList[i].getNodeId());
         }
         exitList = exitList.concat(secondExitList);
         var spotCount:int = rng.rand(2) + 5;
         i = 0;
         while(i < spotCount && emptyList.length > 0)
         {
            index = rng.rand(emptyList.length);
            sectorBuild = emptyList[index];
            if(i == 0)
            {
               sectorBuild.setType(SectorBuild.TYPE_DUNGEON);
               this.dungeonList.push(sectorBuild.getNodeId());
            }
            else if(i == 1)
            {
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               this.dojoNode = sectorBuild.getNodeId();
            }
            else if(i == 2)
            {
               this.graveyardNode = sectorBuild.getNodeId();
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               this.pickableList.push(sectorBuild.getNodeId());
            }
            else if(i == 3)
            {
               this.oniDenNode = sectorBuild.getNodeId();
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               this.pickableList.push(sectorBuild.getNodeId());
            }
            else if(i == 4)
            {
               this.mercCampNode = sectorBuild.getNodeId();
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               this.pickableList.push(sectorBuild.getNodeId());
            }
            else if(i == 5)
            {
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               if(rng.rand(4) == 0)
               {
                  this.templeNode = sectorBuild.getNodeId();
                  this.pickableList.push(sectorBuild.getNodeId());
               }
               else
               {
                  this.overwriteNode = sectorBuild.getNodeId();
               }
            }
            else
            {
               sectorBuild.setType(SectorBuild.TYPE_PICKABLE);
               this.pickableList.push(sectorBuild.getNodeId());
            }
            emptyList.splice(index,1);
            exitIndex = rng.rand(exitList.length);
            routeOK = this.createRoute(sectorBuild,exitList[exitIndex],sectorBuildArray,emptyList,rng);
            if(!routeOK)
            {
               trace("route not ok" + i);
               counter = 1;
               counterMax = int(exitList.length);
               while(!routeOK && counter < counterMax)
               {
                  trace("TerritoryData.generateSectors: try another route",counter);
                  exitIndex++;
                  counter++;
                  if(exitIndex == counterMax)
                  {
                     exitIndex = 0;
                  }
                  routeOK = this.createRoute(sectorBuild,exitList[exitIndex],sectorBuildArray,emptyList,rng);
               }
               if(routeOK)
               {
                  sectorBuild.removeExitsExceptExitTo();
               }
            }
            i++;
         }
         var emptyListCount:int = int(emptyList.length);
         var fieldList:Array = new Array();
         for(i = 0; i < emptyListCount; i++)
         {
            sectorBuild = emptyList[i];
            if(sectorBuild.getType() == SectorBuild.TYPE_EMPTY)
            {
               fields = new Array();
               fieldList.push(fields);
               this.connectSurroundingEmpty(sectorBuild.getX(),sectorBuild.getY(),sectorBuildArray,fields,-1);
            }
         }
         max = int(fieldList.length);
         for(i = 0; i < max; i++)
         {
            this.linkToRoad(fieldList[i],sectorBuildArray,rng);
         }
         if(this.territoryID == 1397077)
         {
            sectorBuildArray[0][2].exits = [1,0,0,0];
            sectorBuildArray[0][3].exits = [0,0,1,0];
            sectorBuildArray[0][4].exits = [0,1,1,0];
            sectorBuildArray[2][0].exits = [0,0,1,0];
            sectorBuildArray[2][1].exits = [0,1,1,1];
            sectorBuildArray[3][0].exits = [0,1,1,1];
            sectorBuildArray[3][1].exits = [1,1,0,1];
            sectorBuildArray[3][3].exits = [1,1,1,1];
            sectorBuildArray[3][4].exits = [1,1,1,1];
            sectorBuildArray[4][0].exits = [0,1,1,1];
            sectorBuildArray[4][1].exits = [1,1,1,0];
            sectorBuildArray[4][2].exits = [1,1,1,0];
            sectorBuildArray[4][3].exits = [0,0,1,1];
            sectorBuildArray[4][3].exits = [1,0,1,1];
            sectorBuildArray[4][4].exits = [0,1,1,1];
            sectorBuildArray[5][3].exits = [0,0,0,1];
            sectorBuildArray[5][4].exits = [0,0,1,1];
         }
         else if(this.territoryID == 1442135)
         {
            sectorBuildArray[2][1].exits = [1,0,1,1];
            sectorBuildArray[3][1].exits = [1,1,0,1];
            sectorBuildArray[0][3].exits = [1,0,1,0];
            sectorBuildArray[0][4].exits = [0,1,1,1];
         }
         else if(this.territoryID == 1425752)
         {
            sectorBuildArray[1][0].exits = [0,1,0,1];
            sectorBuildArray[2][0].exits = [0,1,1,0];
            sectorBuildArray[1][2].exits = [1,1,0,0];
            sectorBuildArray[1][3].exits = [1,0,1,1];
         }
         else if(this.territoryID == 1483092)
         {
            sectorBuildArray[0][1].exits = [1,1,1,0];
            sectorBuildArray[1][1].exits = [1,1,0,1];
            sectorBuildArray[2][1].exits = [1,0,1,0];
            sectorBuildArray[3][1].exits = [0,1,1,1];
            sectorBuildArray[3][2].exits = [1,1,1,1];
         }
         else if(this.territoryID == 1483090)
         {
            sectorBuildArray[2][3].exits = [1,1,0,1];
            sectorBuildArray[3][3].exits = [0,1,1,0];
            sectorBuildArray[4][2].exits = [1,0,1,1];
            sectorBuildArray[5][2].exits = [1,1,0,1];
         }
         else if(this.territoryID == 1483087)
         {
            sectorBuildArray[2][0].exits = [0,0,1,1];
            sectorBuildArray[3][1].exits = [0,0,0,1];
            sectorBuildArray[3][2].exits = [0,1,1,0];
            sectorBuildArray[3][0].exits = [0,0,1,1];
            sectorBuildArray[4][1].exits = [1,1,1,0];
         }
         else if(this.territoryID == 1401184)
         {
            sectorBuildArray[1][4].exits = [0,1,1,1];
            sectorBuildArray[2][4].exits = [1,0,1,1];
         }
         var enclosedList:Array = new Array();
         var deadEndList:Array = new Array();
         var straightRoomList:Array = new Array();
         var straightRoomFieldList:Array = new Array();
         var forkedroadList:Array = new Array();
         var crossroadList:Array = new Array();
         for(i = 0; i < 6; i++)
         {
            for(j = 0; j < 6; j++)
            {
               sectorBuild = sectorBuildArray[i][j];
               if(sectorBuild.isEnclosed())
               {
                  enclosedList.push(sectorBuild);
               }
               else if(sectorBuild.isDeadEnd() && sectorBuild.getType() == SectorBuild.TYPE_FIELD)
               {
                  deadEndList.push(sectorBuild);
               }
               else if(sectorBuild.isStraightRoom() && sectorBuild.getType() == SectorBuild.TYPE_ROAD)
               {
                  straightRoomList.push(sectorBuild);
               }
               else if(sectorBuild.isStraightRoom() && sectorBuild.getType() == SectorBuild.TYPE_FIELD)
               {
                  straightRoomFieldList.push(sectorBuild);
               }
               else if(sectorBuild.isForkedRoad() && sectorBuild.getType() == SectorBuild.TYPE_ROAD)
               {
                  forkedroadList.push(sectorBuild);
               }
               else if(sectorBuild.isCrossRoad() && sectorBuild.getType() == SectorBuild.TYPE_ROAD)
               {
                  crossroadList.push(sectorBuild);
               }
            }
         }
         var dungeonCount:int = rng.rand(2);
         i = 0;
         while(i < dungeonCount && deadEndList.length > 0)
         {
            index = rng.rand(deadEndList.length);
            sectorBuild = deadEndList[index];
            sectorBuild.setType(SectorBuild.TYPE_DUNGEON);
            deadEndList.splice(index,1);
            this.dungeonList.push(sectorBuild.getNodeId());
            i++;
         }
         max = int(deadEndList.length);
         for(i = 0; i < max; i++)
         {
            sectorBuild = deadEndList[i];
            if(i == 0 && this.overwriteNode == -1)
            {
               this.overwriteNode = sectorBuild.getNodeId();
            }
            else
            {
               this.pickableList.push(sectorBuild.getNodeId());
            }
         }
         var controlPointCount:* = int(rng.rand(2) + 2);
         if(straightRoomList.length > 0)
         {
            index = rng.rand(straightRoomList.length);
            sectorBuild = straightRoomList[index];
            sectorBuild.setType(SectorBuild.TYPE_CONTROLPOINT);
            straightRoomList.splice(index,1);
            if(this.territoryID == 1397077)
            {
               this.townNode = sectorBuildArray[4][3].getNodeId();
            }
            else
            {
               this.townNode = sectorBuild.getNodeId();
            }
         }
         i = 0;
         while(i < controlPointCount && crossroadList.length > 0)
         {
            index = rng.rand(crossroadList.length);
            sectorBuild = crossroadList[index];
            sectorBuild.setType(SectorBuild.TYPE_CONTROLPOINT);
            crossroadList.splice(index,1);
            this.controlPointList.push(sectorBuild.getNodeId());
            i++;
            controlPointCount--;
         }
         i = 0;
         while(i < controlPointCount && forkedroadList.length > 0)
         {
            index = rng.rand(forkedroadList.length);
            sectorBuild = forkedroadList[index];
            sectorBuild.setType(SectorBuild.TYPE_CONTROLPOINT);
            forkedroadList.splice(index,1);
            this.controlPointList.push(sectorBuild.getNodeId());
            i++;
            i++;
         }
         var hutCount:int = rng.rand(3);
         i = 0;
         while(i < hutCount && straightRoomList.length > 0)
         {
            index = rng.rand(straightRoomList.length);
            sectorBuild = straightRoomList[index];
            sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
            straightRoomList.splice(index,1);
            this.hutList.push(sectorBuild.getNodeId());
            i++;
         }
         var animalSpawnCount:int = rng.rand(3) + 2;
         if(straightRoomFieldList.length > 0)
         {
            i = 0;
            while(i < animalSpawnCount && straightRoomFieldList.length > 0)
            {
               index = rng.rand(straightRoomFieldList.length);
               sectorBuild = straightRoomFieldList[index];
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               straightRoomFieldList.splice(index,1);
               this.animalSpawnList.push(sectorBuild.getNodeId());
               i++;
            }
         }
         else
         {
            i = 0;
            while(i < animalSpawnCount && straightRoomList.length > 0)
            {
               index = rng.rand(straightRoomList.length);
               sectorBuild = straightRoomList[index];
               sectorBuild.setType(SectorBuild.TYPE_SPECIAL);
               straightRoomList.splice(index,1);
               this.animalSpawnList.push(sectorBuild.getNodeId());
               i++;
            }
         }
         var output:Array = new Array(6);
         for(i = 0; i < 6; i++)
         {
            output[i] = new Array(6);
            for(j = 0; j < 6; j++)
            {
               output[i][j] = sectorBuildArray[i][j].getNodeExits();
            }
         }
         return output;
      }
      
      internal function linkToRoad(fields:Array, sectorBuildArray:Array, rng:RNG) : *
      {
         var currentNode:SectorBuild = null;
         var northNode:SectorBuild = null;
         var southNode:SectorBuild = null;
         var eastNode:SectorBuild = null;
         var westNode:SectorBuild = null;
         var roadNode:SectorBuild = null;
         var choices:Array = null;
         var dir:int = 0;
         var max:int = int(fields.length);
         var currentRoute:Array = new Array();
         for(var i:int = 0; i < max; i++)
         {
            currentNode = fields[i];
            northNode = this.getValidMove(currentNode,SectorBuild.DIR_N,-1,sectorBuildArray,currentRoute);
            southNode = this.getValidMove(currentNode,SectorBuild.DIR_S,-1,sectorBuildArray,currentRoute);
            eastNode = this.getValidMove(currentNode,SectorBuild.DIR_E,-1,sectorBuildArray,currentRoute);
            westNode = this.getValidMove(currentNode,SectorBuild.DIR_W,-1,sectorBuildArray,currentRoute);
            choices = new Array();
            if(northNode != null)
            {
               choices.push(SectorBuild.DIR_N);
            }
            if(southNode != null)
            {
               choices.push(SectorBuild.DIR_S);
            }
            if(eastNode != null)
            {
               choices.push(SectorBuild.DIR_E);
            }
            if(westNode != null)
            {
               choices.push(SectorBuild.DIR_W);
            }
            if(choices.length != 0)
            {
               dir = int(choices[rng.rand(choices.length)]);
               if(dir == SectorBuild.DIR_N)
               {
                  roadNode = northNode;
               }
               else if(dir == SectorBuild.DIR_S)
               {
                  roadNode = southNode;
               }
               else if(dir == SectorBuild.DIR_E)
               {
                  roadNode = eastNode;
               }
               else if(dir == SectorBuild.DIR_W)
               {
                  roadNode = westNode;
               }
               currentRoute.push(roadNode);
               this.linkNodes(currentNode,roadNode,dir);
               return;
            }
         }
      }
      
      internal function connectSurroundingEmpty(x:int, y:int, sectorBuildArray:Array, fields:Array, lastDir:int) : *
      {
         var sectorBuild:SectorBuild = sectorBuildArray[x][y];
         if(sectorBuild.getType() != SectorBuild.TYPE_EMPTY && sectorBuild.getType() != SectorBuild.TYPE_FIELD)
         {
            return;
         }
         if(sectorBuild.hasExitFrom(lastDir) == 1)
         {
            return;
         }
         fields.push(sectorBuild);
         sectorBuild.setType(SectorBuild.TYPE_FIELD);
         if(lastDir == SectorBuild.DIR_N)
         {
            this.linkNodes(sectorBuildArray[x][y + 1],sectorBuild,lastDir);
         }
         else if(lastDir == SectorBuild.DIR_S)
         {
            this.linkNodes(sectorBuildArray[x][y - 1],sectorBuild,lastDir);
         }
         else if(lastDir == SectorBuild.DIR_E)
         {
            this.linkNodes(sectorBuildArray[x - 1][y],sectorBuild,lastDir);
         }
         else if(lastDir == SectorBuild.DIR_W)
         {
            this.linkNodes(sectorBuildArray[x + 1][y],sectorBuild,lastDir);
         }
         if(y > 0)
         {
            this.connectSurroundingEmpty(x,y - 1,sectorBuildArray,fields,SectorBuild.DIR_N);
         }
         if(y < 5)
         {
            this.connectSurroundingEmpty(x,y + 1,sectorBuildArray,fields,SectorBuild.DIR_S);
         }
         if(x < 5)
         {
            this.connectSurroundingEmpty(x + 1,y,sectorBuildArray,fields,SectorBuild.DIR_E);
         }
         if(x > 0)
         {
            this.connectSurroundingEmpty(x - 1,y,sectorBuildArray,fields,SectorBuild.DIR_W);
         }
      }
      
      internal function getValidMove(currentNode:SectorBuild, dir:int, lastDir:int, sectorBuildArray:Array, currentRoute:Array) : SectorBuild
      {
         var nextNode:SectorBuild = null;
         if(dir == SectorBuild.DIR_N)
         {
            if(lastDir == SectorBuild.DIR_S || currentNode.getY() == 0)
            {
               return null;
            }
            nextNode = sectorBuildArray[currentNode.getX()][currentNode.getY() - 1];
         }
         else if(dir == SectorBuild.DIR_S)
         {
            if(lastDir == SectorBuild.DIR_N || currentNode.getY() == 5)
            {
               return null;
            }
            nextNode = sectorBuildArray[currentNode.getX()][currentNode.getY() + 1];
         }
         else if(dir == SectorBuild.DIR_E)
         {
            if(lastDir == SectorBuild.DIR_W || currentNode.getX() == 5)
            {
               return null;
            }
            nextNode = sectorBuildArray[currentNode.getX() + 1][currentNode.getY()];
         }
         else if(dir == SectorBuild.DIR_W)
         {
            if(lastDir == SectorBuild.DIR_E || currentNode.getX() == 0)
            {
               return null;
            }
            nextNode = sectorBuildArray[currentNode.getX() - 1][currentNode.getY()];
         }
         if(nextNode.getType() == SectorBuild.TYPE_DUNGEON || nextNode.getType() == SectorBuild.TYPE_FIELD || nextNode.getType() == SectorBuild.TYPE_PICKABLE || nextNode.getType() == SectorBuild.TYPE_SPECIAL)
         {
            return null;
         }
         if(nextNode.getType() == SectorBuild.TYPE_CONTROLPOINT && !nextNode.checkAddExitToCP(dir))
         {
            return null;
         }
         if(currentRoute.indexOf(nextNode) != -1)
         {
            return null;
         }
         return nextNode;
      }
      
      internal function linkNodes(prevNode:SectorBuild, currentNode:SectorBuild, dir:int) : *
      {
         if(dir == SectorBuild.DIR_N)
         {
            prevNode.addExit(SectorBuild.DIR_N);
            currentNode.addExit(SectorBuild.DIR_S);
         }
         else if(dir == SectorBuild.DIR_S)
         {
            prevNode.addExit(SectorBuild.DIR_S);
            currentNode.addExit(SectorBuild.DIR_N);
         }
         else if(dir == SectorBuild.DIR_W)
         {
            prevNode.addExit(SectorBuild.DIR_W);
            currentNode.addExit(SectorBuild.DIR_E);
         }
         else if(dir == SectorBuild.DIR_E)
         {
            prevNode.addExit(SectorBuild.DIR_E);
            currentNode.addExit(SectorBuild.DIR_W);
         }
      }
      
      internal function createRoute(startNode:SectorBuild, endNode:SectorBuild, sectorBuildArray:Array, emptyList:Array, rng:RNG, stopAtRoad:Boolean = true) : Boolean
      {
         var northNode:SectorBuild = null;
         var southNode:SectorBuild = null;
         var eastNode:SectorBuild = null;
         var westNode:SectorBuild = null;
         var choices:Array = null;
         var prevNode:SectorBuild = null;
         var index:int = 0;
         var currentNode:SectorBuild = startNode;
         var selectedDir:int = -1;
         var currentRoute:Array = new Array();
         while(currentNode != endNode)
         {
            northNode = this.getValidMove(currentNode,SectorBuild.DIR_N,selectedDir,sectorBuildArray,currentRoute);
            southNode = this.getValidMove(currentNode,SectorBuild.DIR_S,selectedDir,sectorBuildArray,currentRoute);
            eastNode = this.getValidMove(currentNode,SectorBuild.DIR_E,selectedDir,sectorBuildArray,currentRoute);
            westNode = this.getValidMove(currentNode,SectorBuild.DIR_W,selectedDir,sectorBuildArray,currentRoute);
            choices = new Array();
            if(northNode != null && currentNode.getY() > endNode.getY())
            {
               choices.push(SectorBuild.DIR_N);
            }
            if(southNode != null && currentNode.getY() < endNode.getY())
            {
               choices.push(SectorBuild.DIR_S);
            }
            if(eastNode != null && currentNode.getX() < endNode.getX())
            {
               choices.push(SectorBuild.DIR_E);
            }
            if(westNode != null && currentNode.getX() > endNode.getX())
            {
               choices.push(SectorBuild.DIR_W);
            }
            if(choices.length == 0)
            {
               if(!stopAtRoad)
               {
                  return false;
               }
               if(northNode != null)
               {
                  choices.push(SectorBuild.DIR_N);
               }
               if(southNode != null)
               {
                  choices.push(SectorBuild.DIR_S);
               }
               if(eastNode != null)
               {
                  choices.push(SectorBuild.DIR_E);
               }
               if(westNode != null)
               {
                  choices.push(SectorBuild.DIR_W);
               }
               if(choices.length == 0)
               {
                  trace("TerritoryData:createRoute - no options");
                  return false;
               }
            }
            prevNode = currentNode;
            selectedDir = int(choices[rng.rand(choices.length)]);
            if(selectedDir == SectorBuild.DIR_N)
            {
               currentNode = northNode;
            }
            else if(selectedDir == SectorBuild.DIR_S)
            {
               currentNode = southNode;
            }
            else if(selectedDir == SectorBuild.DIR_W)
            {
               currentNode = westNode;
            }
            else if(selectedDir == SectorBuild.DIR_E)
            {
               currentNode = eastNode;
            }
            this.linkNodes(prevNode,currentNode,selectedDir);
            currentRoute.push(currentNode);
            if(currentNode.getType() == SectorBuild.TYPE_EMPTY)
            {
               currentNode.setType(SectorBuild.TYPE_ROAD);
               index = emptyList.indexOf(currentNode);
               emptyList.splice(index,1);
            }
            else if(currentNode.getType() != SectorBuild.TYPE_EXIT)
            {
               if(currentNode.getType() != SectorBuild.TYPE_CONTROLPOINT)
               {
                  if(!(!stopAtRoad && currentNode.getType() == SectorBuild.TYPE_ROAD))
                  {
                     return true;
                  }
               }
            }
         }
         return true;
      }
      
      public function toString() : String
      {
         var j:int = 0;
         var str:String = this.territoryID + " ";
         for(var i:int = 0; i < 6; i++)
         {
            for(j = 0; j < 6; j++)
            {
               str += this.nodeExits[i][j] + ",";
            }
         }
         return str;
      }
   }
}

