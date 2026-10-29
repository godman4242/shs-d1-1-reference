package
{
   import flash.geom.Point;
   
   public class NodeGenerator
   {
      
      public static var instance:NodeGenerator;
      
      internal static var ROOMGRIDSIZE:int = 32;
      
      public static var EXIT_N:int = 0;
      
      public static var EXIT_S:int = 1;
      
      public static var EXIT_E:int = 2;
      
      public static var EXIT_W:int = 3;
      
      public static var DIR_NW:int = 0;
      
      public static var DIR_SE:int = 1;
      
      public static var DIR_E:int = 2;
      
      public static var DIR_W:int = 3;
      
      public static var DIR_NE:int = 4;
      
      public static var DIR_SW:int = 5;
      
      public static var DIR_S_LOW:int = 6;
      
      public static var ICON_NOTHING:int = 0;
      
      public static var ICON_TOWN:int = 1;
      
      public static var ICON_DUNGEON:int = 2;
      
      public static var ICON_CAVE:int = 3;
      
      public static var ICON_MINE:int = 4;
      
      public static var ICON_FORT:int = 5;
      
      public static var ICON_CONTROL:int = 6;
      
      public static var ICON_EXIT:int = 7;
      
      public static var ICON_PICKABLE:int = 8;
      
      public static var ICON_DOJO:int = 9;
      
      public static var ICON_TEMPLE:int = 10;
      
      public static var ICON_HUT:int = 11;
      
      public static var ICON_GRAVEYARD:int = 12;
      
      public static var ICON_ONIDEN:int = 13;
      
      public static var ICON_MERCCAMP:int = 14;
      
      public static var ICON_ANIMALSPAWN:int = 15;
      
      public static var ICON_NINJAVILLAGE:int = 16;
      
      public static var ICON_DESTROYEDVILLAGE:int = 17;
      
      public static var ICON_JINMAKU:int = 18;
      
      public static var ICON_ROUTE:int = 19;
      
      public static var ICON_TEMPLEDUNGEON:int = 20;
      
      public static var ICON_RUINS:int = 21;
      
      public static var ICON_NINJATRAIL:int = 22;
      
      public static var ICON_BEACH:int = 23;
      
      public static var ICON_OVERWRITENODE:int = 100;
      
      public static var THEME_BANDIT:int = 0;
      
      public static var THEME_ONI:int = 1;
      
      public static var THEME_UNDEAD:int = 2;
      
      public static var THEME_WOLF:int = 3;
      
      public static var THEME_BEAR:int = 4;
      
      public static var THEME_BOAR:int = 5;
      
      public static var THEME_DEER:int = 6;
      
      public static var THEME_FOX:int = 7;
      
      public static var THEME_NINJA:int = 8;
      
      public static var THEME_MERC:int = 9;
      
      public static var THEME_CIVILIAN:int = 10;
      
      public static var THEME_CLAN:int = 11;
      
      public static var THEME_ABANDONED:int = 13;
      
      public static var THEME_TOWN:int = 14;
      
      public static var THEME_TEMPLE:int = 15;
      
      public static var THEME_TRAP:int = 16;
      
      public static var THEME_DOJO:int = 17;
      
      public static var THEME_CULTIST:int = 18;
      
      public static var THEME_CLANPURPLE:int = 19;
      
      public static var THEME_CULTIST_UNDEAD:int = 20;
      
      public static var THEME_CLANPURPLE_UNDEAD:int = 21;
      
      internal static var TERRITORYCACHEMAX:int = 20;
      
      internal static var TERRITORYCACHEREDUCTION:int = 5;
      
      internal static var ROOMDATACACHEMAX:int = 20;
      
      internal static var ROOMDATACACHEREDUCTION:int = 5;
      
      internal var dungeonGenerator:DungeonGenerator;
      
      internal var territoryCache:Array = new Array();
      
      internal var surroundingTerrCache:Array = new Array();
      
      internal var roomDataCache:Array = new Array();
      
      internal var roomDataKeyCache:Array = new Array();
      
      internal var LEVELSTART:int = 3;
      
      public function NodeGenerator()
      {
         super();
         if(instance != null)
         {
            return;
         }
         instance = this;
         this.dungeonGenerator = new DungeonGenerator();
      }
      
      public static function getInstance() : NodeGenerator
      {
         if(instance == null)
         {
            new NodeGenerator();
         }
         return instance;
      }
      
      public static function destroy() : *
      {
         NodeGenerator.instance = null;
      }
      
      public function initSurroundingTerrCache(nodeid:int, checkServer:Boolean = true) : *
      {
         var territory:Point = this.getTerritory(nodeid);
         this.surroundingTerrCache[0] = this.getTerritoryData(territory.x - 1,territory.y - 1,checkServer);
         this.surroundingTerrCache[1] = this.getTerritoryData(territory.x,territory.y - 1,checkServer);
         this.surroundingTerrCache[2] = this.getTerritoryData(territory.x + 1,territory.y - 1,checkServer);
         this.surroundingTerrCache[3] = this.getTerritoryData(territory.x - 1,territory.y,checkServer);
         this.surroundingTerrCache[4] = this.getTerritoryData(territory.x,territory.y,checkServer);
         this.surroundingTerrCache[5] = this.getTerritoryData(territory.x + 1,territory.y,checkServer);
         this.surroundingTerrCache[6] = this.getTerritoryData(territory.x - 1,territory.y + 1,checkServer);
         this.surroundingTerrCache[7] = this.getTerritoryData(territory.x,territory.y + 1,checkServer);
         this.surroundingTerrCache[8] = this.getTerritoryData(territory.x - 1,territory.y + 1,checkServer);
         if(!checkServer)
         {
            QueryManager.instance.getTerritoryGroupData(territory.x,territory.y);
         }
      }
      
      public function getTerritoryData(terrX:int, terrY:int, checkServer:Boolean = true, forceCache:Boolean = false) : TerritoryData
      {
         var territoryId:int = terrX << 12 | terrY;
         var territoryData:TerritoryData = this.findTerritoryData(territoryId);
         if(territoryData == null)
         {
            territoryData = this.generateTerritoryData(terrX,terrY,checkServer);
            if(checkServer || forceCache)
            {
               this.territoryCache.push(territoryData);
               if(this.territoryCache.length > TERRITORYCACHEMAX)
               {
                  this.territoryCache.splice(0,TERRITORYCACHEREDUCTION);
               }
            }
         }
         return territoryData;
      }
      
      internal function findTerritoryData(territoryId:int) : TerritoryData
      {
         var territoryData:TerritoryData = null;
         var max:int = int(this.territoryCache.length);
         for(var i:int = 0; i < max; i++)
         {
            territoryData = this.territoryCache[i];
            if(territoryData.getID() == territoryId)
            {
               return territoryData;
            }
         }
         return null;
      }
      
      public function getAdjacentTerritories() : Array
      {
         var output:Array = new Array();
         output.push(this.surroundingTerrCache[1]);
         output.push(this.surroundingTerrCache[3]);
         output.push(this.surroundingTerrCache[5]);
         output.push(this.surroundingTerrCache[7]);
         return output;
      }
      
      internal function generateTerritoryData(terrX:int, terrY:int, checkServer:Boolean = true) : TerritoryData
      {
         var territoryId:int = terrX << 12 | terrY;
         var territoryData:TerritoryData = new TerritoryData(territoryId);
         if(checkServer)
         {
            QueryManager.instance.getTerritoryData(terrX,terrY);
         }
         return territoryData;
      }
      
      public function gotTerritoryData(terrX:int, terrY:int, terrData:String) : *
      {
         var hasFalse:Boolean = false;
         var i:int = 0;
         var territoryData:TerritoryData = this.getTerritoryData(terrX,terrY,false,true);
         territoryData.setTerrData(terrData);
         if(GameEngine.isLoadingScreen())
         {
            if(OverworldHUD.instance != null && OverworldHUD.instance.screenTransition.isWaitingForTerritoryData())
            {
               OverworldHUD.instance.screenTransition.gotTerritoryData();
            }
            else
            {
               hasFalse = false;
               for(i = 0; i < 9; i++)
               {
                  if(this.surroundingTerrCache[i] == null || !this.surroundingTerrCache[i].hasDataFromServer())
                  {
                     hasFalse = true;
                     break;
                  }
               }
               if(!hasFalse)
               {
                  GameEngine.hideLoadingScreen();
               }
            }
         }
      }
      
      public function gotTerritoryExtraData(terrX:int, terrY:int, terrData:String, influence:Array) : *
      {
         var territoryData:TerritoryData = this.getTerritoryData(terrX,terrY,true);
         territoryData.setTerrExtraData(terrData,influence);
      }
      
      public function gotTerritoryGroupData(terrX:int, terrY:int, terrData:String) : *
      {
         var j:int = 0;
         var strArray:Array = terrData.split("|");
         var index:* = 0;
         for(var i:int = terrX - 1; i <= terrX + 1; i++)
         {
            for(j = terrY - 1; j <= terrY + 1; j++)
            {
               this.gotTerritoryData(i,j,strArray[index++]);
            }
         }
         GameEngine.initOverworld();
      }
      
      public function getTerritory(nodeid:int) : Point
      {
         var sectorx:int = nodeid >> 12 & 0x0FFF;
         var sectory:int = nodeid & 0x0FFF;
         var territoryx:int = Math.floor(sectorx / 6);
         var territoryy:int = Math.floor(sectory / 6);
         return new Point(territoryx,territoryy);
      }
      
      public function getTerritoryId(nodeid:int) : int
      {
         var sectorx:int = nodeid >> 12 & 0x0FFF;
         var sectory:int = nodeid & 0x0FFF;
         var territoryx:int = Math.floor(sectorx / 6);
         var territoryy:int = Math.floor(sectory / 6);
         return territoryx << 12 | territoryy;
      }
      
      public function getTerritorySector(nodeid:int) : Point
      {
         var sectorx:int = nodeid >> 12 & 0x0FFF;
         var sectory:int = nodeid & 0x0FFF;
         var territoryx:int = sectorx % 6;
         var territoryy:int = sectory % 6;
         return new Point(territoryx,territoryy);
      }
      
      public function getSector(nodeid:int) : Point
      {
         var sectorx:int = nodeid >> 12 & 0x0FFF;
         var sectory:int = nodeid & 0x0FFF;
         return new Point(sectorx,sectory);
      }
      
      public function generateNode(nodex:int, nodey:int) : XMLWorldNode
      {
         var nodeData:XMLWorldNode = new XMLWorldNode(new XML());
         var nodeid:int = nodex << 12 | nodey;
         nodeData.x = nodex;
         nodeData.y = nodey;
         nodeData.id = nodeid;
         nodeData.level = this.getNodeLevel(nodeid);
         nodeData.name = this.getNodeName(nodeid);
         nodeData.roomsXML = null;
         var territory:Point = this.getTerritory(nodeid);
         var territoryData:TerritoryData = this.getTerritoryData(territory.x,territory.y);
         var locationType:int = territoryData.getLocationType(nodeid);
         if(locationType == ICON_TOWN && territoryData.getTownLevel() > 0)
         {
            nodeData.name = territoryData.getTownName();
         }
         else if(locationType == ICON_DOJO)
         {
            nodeData.name = territoryData.townName + " " + LangManager.getString(1000);
         }
         else if(locationType == ICON_TEMPLE)
         {
            nodeData.name = territoryData.townName + " " + LangManager.getString(1027);
         }
         else if(locationType == ICON_DUNGEON)
         {
            nodeData.name = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1001);
         }
         else if(locationType == ICON_CAVE)
         {
            nodeData.name = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1021);
         }
         else if(locationType == ICON_MINE)
         {
            nodeData.name = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1005);
         }
         else if(locationType == ICON_RUINS)
         {
            nodeData.name = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1028);
         }
         else if(locationType == ICON_GRAVEYARD)
         {
            nodeData.name = territoryData.townName + " " + LangManager.getString(1016);
         }
         else if(locationType == ICON_BEACH)
         {
            nodeData.name = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1020);
         }
         return nodeData;
      }
      
      public function getNodeLevel(nodeid:int) : int
      {
         var territory:Point = this.getTerritory(nodeid);
         var lvl:int = Math.abs(territory.x - 341) + Math.abs(territory.y - 341) + this.LEVELSTART;
         if(lvl > 200)
         {
            lvl = 200;
         }
         return lvl;
      }
      
      public function isNoChangeTown(territoryID:int) : Boolean
      {
         if(territoryID == 1466699 || territoryID == 1503572 || territoryID == 1368424 || territoryID == 1540387)
         {
            return true;
         }
         var lvl:int = this.getTerritoryLevel(territoryID);
         return lvl < this.LEVELSTART + 5;
      }
      
      public function getNoChangeTownLevel(territoryID:int) : int
      {
         var rng:RNG = null;
         var dice:int = 0;
         if(territoryID == 1397077 || territoryID == 1397078)
         {
            return 0;
         }
         if(territoryID == 1401173)
         {
            return 3;
         }
         if(territoryID == 1405270)
         {
            return 4;
         }
         if(territoryID == 1466699 || territoryID == 1503572 || territoryID == 1368424 || territoryID == 1540387 || territoryID == 1413461 || territoryID == 1409366 || territoryID == 1401176 || territoryID == 1397081)
         {
            return 5;
         }
         rng = new RNG(territoryID);
         dice = rng.rand(7);
         if(dice == 0)
         {
            return 0;
         }
         if(dice == 1)
         {
            return 1;
         }
         if(dice == 2)
         {
            return 2;
         }
         if(dice == 3)
         {
            return 3;
         }
         if(dice == 4)
         {
            return 4;
         }
         if(dice == 5)
         {
            return 5;
         }
         return 0;
      }
      
      public function isStoryQuestTown(territoryID:int) : Boolean
      {
         switch(territoryID)
         {
            case 1413463:
               return true;
            case 1458520:
               return true;
            case 1454424:
               return true;
            case 1470806:
               return true;
            case 1474900:
               return true;
            case 1483089:
               return true;
            default:
               return false;
         }
      }
      
      public function getTerritoryLevel(territoryID:int) : int
      {
         var territoryx:int = territoryID >> 12 & 0x0FFF;
         var territoryy:int = territoryID & 0x0FFF;
         var lvl:int = Math.abs(territoryx - 341) + Math.abs(territoryy - 341) + this.LEVELSTART;
         if(lvl > 100)
         {
            lvl = 100;
         }
         return lvl;
      }
      
      internal function getNodeCompassDir(nodeid:int) : *
      {
         var dir1:String = "";
         var dir2:String = "";
         var terrSector:Point = NodeGenerator.instance.getTerritorySector(nodeid);
         if(terrSector.y <= 1)
         {
            dir1 = LangManager.getString(398);
         }
         else if(terrSector.y >= 4)
         {
            dir1 = LangManager.getString(399);
         }
         if(terrSector.x <= 1)
         {
            dir2 = LangManager.getString(401);
         }
         else if(terrSector.x >= 4)
         {
            dir2 = LangManager.getString(400);
         }
         var dir:String = dir1 + dir2;
         if(dir != "")
         {
            dir += " ";
         }
         return dir;
      }
      
      public function getWildlifeType(nodeid:int) : int
      {
         var rng:RNG = new RNG(nodeid);
         var animaldice:int = rng.rand(5);
         if(animaldice == 0)
         {
            return THEME_WOLF;
         }
         if(animaldice == 1)
         {
            return THEME_BEAR;
         }
         if(animaldice == 2)
         {
            return THEME_BOAR;
         }
         if(animaldice == 3)
         {
            return THEME_DEER;
         }
         if(animaldice == 4)
         {
            return THEME_FOX;
         }
         return THEME_WOLF;
      }
      
      internal function findRoomData(nodeid:int) : Array
      {
         var roomData:Array = null;
         var max:int = int(this.roomDataKeyCache.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.roomDataKeyCache[i] == nodeid)
            {
               return this.roomDataCache[i];
            }
         }
         return null;
      }
      
      internal function addRoomData(nodeid:int, roomData:Array) : *
      {
         this.roomDataKeyCache.push(nodeid);
         this.roomDataCache.push(roomData);
         if(this.roomDataKeyCache.length > ROOMDATACACHEMAX)
         {
            this.roomDataKeyCache.splice(0,ROOMDATACACHEREDUCTION);
            this.roomDataCache.splice(0,ROOMDATACACHEREDUCTION);
         }
      }
      
      public function generateRooms(nodeid:int, generateInnerRooms:Boolean = true, locationType:int = -1, theme:int = -1, overwriteType:int = 0) : Array
      {
         var xpos:int = 0;
         var signdir:int = 0;
         var destnodewidth:int = 0;
         var townColor:uint = 0;
         var totalExits:int = 0;
         var signXPos:int = 0;
         var entranceXPos:int = 0;
         var entranceroomnum:int = 0;
         var objid:int = 0;
         var prop:String = null;
         var randchance:int = 0;
         var intervalDist:int = 0;
         var noObjects:Boolean = false;
         var maxobj:int = 0;
         var cachedRoomData:Array = null;
         var dungeonentranceprop:String = null;
         var mineEntranceXPos:int = 0;
         var stageWidth:int = 0;
         var startDir:int = 0;
         var perpenDir:int = 0;
         if(overwriteType == 0)
         {
            cachedRoomData = this.findRoomData(nodeid);
            if(cachedRoomData != null)
            {
               return cachedRoomData;
            }
         }
         var territory:Point = this.getTerritory(nodeid);
         var territoryData:TerritoryData = this.getTerritoryData(territory.x,territory.y);
         if(locationType == -1)
         {
            locationType = territoryData.getLocationType(nodeid);
         }
         var rng:RNG = new RNG(nodeid);
         var roomDataVector:Array = new Array();
         var roomData:XMLRoomData = new XMLRoomData(new XML());
         roomData.bg = this.getRoomBG(nodeid);
         roomData.roomName = this.getNodeName(nodeid);
         var nodelevel:int = this.getNodeLevel(nodeid);
         var townlevel:int = territoryData.getTownLevel();
         if(locationType == ICON_DESTROYEDVILLAGE || locationType == ICON_TOWN && townlevel == 1)
         {
            roomData.width = 1600;
            roomData.roomName = territoryData.getTownName() + LangManager.getString(495);
            roomData.bg = GameStage.BG_DESTROYEDVILLAGE_OUTSIDE;
         }
         else if(locationType == ICON_TOWN && townlevel > 1)
         {
            if(townlevel == 2)
            {
               roomData.width = 1600;
            }
            else if(townlevel == 3)
            {
               roomData.width = 1600;
            }
            else if(townlevel == 4)
            {
               roomData.width = 2000;
            }
            else if(townlevel == 5)
            {
               roomData.width = 2000;
            }
            roomData.roomName = territoryData.getTownName() + LangManager.getString(495);
            if(townlevel == 2)
            {
               roomData.bg = GameStage.BG_BAMBOOFOREST;
            }
            else
            {
               roomData.bg = GameStage.BG_BAMBOOFORESTTOWN;
            }
         }
         else if(locationType == ICON_GRAVEYARD)
         {
            roomData.bg = GameStage.BG_GRAVEYARD;
            roomData.roomName = territoryData.townName + " " + LangManager.getString(1016);
         }
         else if(locationType == ICON_BEACH)
         {
            roomData.bg = GameStage.BG_BEACH;
            roomData.roomName = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1020);
         }
         else if(locationType == ICON_ONIDEN)
         {
            roomData.bg = GameStage.BG_MOUNTAIN;
            roomData.roomName = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1021);
         }
         else if(locationType == ICON_DOJO)
         {
            roomData.width = 1600;
            roomData.roomName = territoryData.townName + " " + LangManager.getString(1000) + LangManager.getString(495);
            roomData.bg = GameStage.BG_BAMBOOFOREST;
         }
         else if(locationType == ICON_TEMPLE)
         {
            roomData.width = 2200;
            roomData.roomName = territoryData.townName + " " + LangManager.getString(1027);
            roomData.bg = GameStage.BG_TEMPLEEXTERIOR;
         }
         else if(locationType == ICON_JINMAKU)
         {
            roomData.width = 1600;
            roomData.roomName = LangManager.getString(1014);
            roomData.bg = GameStage.BG_JINMAKU_OUTSIDE;
         }
         else if(locationType == ICON_DUNGEON)
         {
            if(rng.rand(3) == 0)
            {
               roomData.roomName = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1028);
               roomData.bg = GameStage.BG_TEMPLERUINS;
            }
            else
            {
               roomData.roomName = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1001);
            }
         }
         else if(locationType == ICON_CAVE)
         {
            roomData.roomName = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1021);
         }
         else if(locationType == ICON_MINE)
         {
            roomData.roomName = this.getNodeCompassDir(nodeid) + territoryData.townName + " " + LangManager.getString(1005);
         }
         else
         {
            roomData.width = this.getRoomWidth(nodeid);
         }
         var objList:String = "";
         var exitList:Array = this.getNodeExits(nodeid);
         var isNSOrientation:Boolean = this.isNodeNSOrientation(exitList);
         var destN:int = this.getShiftedNodeId(nodeid,0,-1);
         var destS:int = this.getShiftedNodeId(nodeid,0,1);
         var destE:int = this.getShiftedNodeId(nodeid,1,0);
         var destW:int = this.getShiftedNodeId(nodeid,-1,0);
         for(var i:int = 0; i < 4; i++)
         {
            totalExits += exitList[i];
         }
         if(exitList[EXIT_S] == 1)
         {
            if(isNSOrientation)
            {
               xpos = 50;
               signdir = EXIT_W;
            }
            else if(totalExits == 2)
            {
               if(exitList[EXIT_W] == 0)
               {
                  xpos = 250;
                  signdir = DIR_SW;
               }
               else
               {
                  xpos = roomData.width - 250;
                  signdir = DIR_SE;
               }
            }
            else
            {
               xpos = roomData.width / 2;
               signdir = EXIT_S;
               if(exitList[EXIT_N] == 1)
               {
                  signdir = 8;
               }
            }
            objList += "<obj><id>0</id><x>" + xpos + "</x><property>0,50," + destS + ",1," + EXIT_S + "," + signdir + "</property></obj>";
         }
         if(exitList[EXIT_N] == 1)
         {
            if(isNSOrientation)
            {
               xpos = roomData.width - 50;
               signdir = EXIT_E;
            }
            else if(totalExits == 2)
            {
               if(exitList[EXIT_E] == 0)
               {
                  xpos = roomData.width - 250;
                  signdir = DIR_NE;
               }
               else
               {
                  xpos = 250;
                  signdir = DIR_NW;
               }
            }
            else
            {
               xpos = roomData.width / 2;
               signdir = EXIT_N;
            }
            objList += "<obj><id>0</id><x>" + xpos + "</x><property>0,50," + destN + ",1," + EXIT_N + "," + signdir + "</property></obj>";
         }
         if(exitList[EXIT_E] == 1)
         {
            if(!isNSOrientation)
            {
               xpos = roomData.width - 50;
               signdir = EXIT_E;
            }
            else if(totalExits == 2)
            {
               if(exitList[EXIT_S] == 0)
               {
                  xpos = 250;
                  signdir = DIR_SW;
               }
               else
               {
                  xpos = roomData.width - 250;
                  signdir = DIR_SE;
               }
            }
            else
            {
               xpos = roomData.width / 2;
               signdir = EXIT_S;
            }
            objList += "<obj><id>0</id><x>" + xpos + "</x><property>0,50," + destE + ",1," + EXIT_E + "," + signdir + "</property></obj>";
         }
         if(exitList[EXIT_W] == 1)
         {
            if(!isNSOrientation)
            {
               xpos = 50;
               signdir = EXIT_W;
            }
            else if(totalExits == 2)
            {
               if(exitList[EXIT_N] == 0)
               {
                  xpos = roomData.width - 250;
                  signdir = DIR_NE;
               }
               else
               {
                  xpos = 250;
                  signdir = DIR_NW;
               }
            }
            else
            {
               xpos = roomData.width / 2;
               signdir = EXIT_N;
            }
            objList += "<obj><id>0</id><x>" + xpos + "</x><property>0,50," + destW + ",1," + EXIT_W + "," + signdir + "</property></obj>";
         }
         var hasMoreRooms:Boolean = false;
         if(locationType == ICON_DUNGEON || locationType == ICON_TEMPLEDUNGEON || locationType == ICON_RUINS)
         {
            hasMoreRooms = true;
            if(exitList[EXIT_S] == 1 || exitList[EXIT_W] == 1)
            {
               signXPos = roomData.width - 300;
               entranceXPos = 50;
               entranceroomnum = 1;
               if(roomData.bg == GameStage.BG_TEMPLERUINS)
               {
                  dungeonentranceprop = "1,11";
               }
               else
               {
                  dungeonentranceprop = "1,1";
               }
            }
            else if(exitList[EXIT_N] == 1 || exitList[EXIT_E] == 1)
            {
               signXPos = 300;
               entranceXPos = 750;
               entranceroomnum = 1;
               if(roomData.bg == GameStage.BG_TEMPLERUINS)
               {
                  dungeonentranceprop = "-1,11";
               }
               else
               {
                  dungeonentranceprop = "-1,1";
               }
            }
            objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + entranceXPos + ",-1,0</property></obj>";
            objList += "<obj><id>52</id><x>" + signXPos + "</x><property>" + dungeonentranceprop + "</property></obj>";
         }
         else if(locationType == ICON_CAVE || locationType == ICON_MINE || locationType == ICON_ONIDEN)
         {
            hasMoreRooms = true;
            if(exitList[EXIT_N] == 1 || exitList[EXIT_E] == 1)
            {
               signXPos = 100;
               entranceroomnum = 1;
               entranceXPos = 750;
               if(roomData.bg == GameStage.BG_MOUNTAIN)
               {
                  if(locationType == ICON_MINE)
                  {
                     objList += "<obj><id>72</id><x>" + 100 + "</x><property>1</property></obj>";
                  }
                  else if(locationType == ICON_CAVE || locationType == ICON_ONIDEN)
                  {
                     objList += "<obj><id>72</id><x>" + 100 + "</x><property>2</property></obj>";
                  }
               }
               else
               {
                  signXPos = 151;
                  dungeonentranceprop = "-1,21";
                  objList += "<obj><id>52</id><x>" + signXPos + "</x><property>" + dungeonentranceprop + "</property></obj>";
               }
            }
            else
            {
               signXPos = roomData.width - 100;
               entranceXPos = 50;
               entranceroomnum = 1;
               if(roomData.bg == GameStage.BG_MOUNTAIN)
               {
                  stageWidth = roomData.width;
                  if(signXPos > stageWidth - 350)
                  {
                     mineEntranceXPos = MCSPlayer.playerScrollMax + (stageWidth - 800) / 4 + (MCSPlayer.playerScrollMin - 100);
                  }
                  else
                  {
                     mineEntranceXPos = 450 + (xpos - 450) / 4;
                  }
                  if(locationType == ICON_MINE)
                  {
                     objList += "<obj><id>72</id><x>" + mineEntranceXPos + "</x><property>1</property></obj>";
                  }
                  else if(locationType == ICON_CAVE || locationType == ICON_ONIDEN)
                  {
                     objList += "<obj><id>72</id><x>" + mineEntranceXPos + "</x><property>2</property></obj>";
                  }
               }
               else
               {
                  signXPos = roomData.width - 151;
                  dungeonentranceprop = "1,21";
                  objList += "<obj><id>52</id><x>" + signXPos + "</x><property>" + dungeonentranceprop + "</property></obj>";
               }
            }
            objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + entranceXPos + "</property></obj>";
            if(locationType == ICON_ONIDEN)
            {
               objid = 24;
               prop = "<property>" + nodeid + "</property>";
               randchance = 2;
               intervalDist = 200;
               maxobj = roomData.width / intervalDist;
               i = 0;
               while(i < maxobj && !noObjects)
               {
                  if(rng.rand(randchance) == 0)
                  {
                     objList += "<obj><id>" + objid + "</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x>" + prop + "</obj>";
                  }
                  i++;
               }
            }
         }
         else if(locationType == ICON_TOWN)
         {
            hasMoreRooms = true;
            signXPos = roomData.width / 2;
            entranceXPos = 50;
            entranceroomnum = 1;
            townColor = this.getTownStyle(nodeid);
            objList += "<obj><id>26</id><x>" + (signXPos - 250) + "</x><property>" + territoryData.getTownLevel() + "</property></obj>";
            if(!territoryData.territoryAtWar())
            {
               if(territoryData.getTownLevel() < 3 || territoryData.getTownSide() == 0 || territoryData.getTownSide() == StatsManager.getSide())
               {
                  objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + 50 + "</property></obj>";
               }
               else if(territoryData.hasEncounter(EncounterItem.UNDEAD_VILLAGE) || territoryData.hasEncounter(EncounterItem.ONI_VILLAGE) || territoryData.hasEncounter(EncounterItem.BANDITS_VILLAGE))
               {
                  objList += "<obj><id>71</id><x>" + signXPos + "</x><property>" + territoryData.getTownSide() + ",1</property></obj>";
               }
               else
               {
                  objList += "<obj><id>71</id><x>" + signXPos + "</x><property>" + territoryData.getTownSide() + ",0</property></obj>";
               }
            }
            if(townlevel > 1)
            {
               objList += "<obj><id>25</id><x>" + signXPos + "</x><property>" + territoryData.getTownLevel() + "," + territoryData.getTownSide() + "," + townColor + "," + territoryData.atWar + "</property></obj>";
            }
         }
         else if(locationType == ICON_DESTROYEDVILLAGE)
         {
            hasMoreRooms = true;
            signXPos = roomData.width / 2;
            entranceXPos = 50;
            entranceroomnum = 1;
            objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + 50 + "</property></obj>";
         }
         else if(locationType == ICON_NINJAVILLAGE || locationType == ICON_NINJATRAIL)
         {
            hasMoreRooms = true;
            signXPos = roomData.width / 2;
            objList += "<obj><id>53</id><x>" + signXPos + "</x><property>1</property></obj>";
            roomData.bg = GameStage.BG_FOREST;
         }
         else if(locationType == ICON_ROUTE)
         {
            hasMoreRooms = true;
            if(exitList[EXIT_S] == 1 || exitList[EXIT_W] == 1)
            {
               signXPos = roomData.width - 50;
               entranceXPos = 50;
               entranceroomnum = 1;
            }
            else if(exitList[EXIT_N] == 1 || exitList[EXIT_E] == 1)
            {
               signXPos = 50;
               entranceXPos = 750;
               entranceroomnum = 1;
            }
            objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + entranceXPos + ",-1,0</property></obj>";
            if(theme == THEME_UNDEAD)
            {
               roomData.bg = GameStage.BG_FORESTSPOOKY;
            }
            else
            {
               roomData.bg = GameStage.BG_FOREST;
            }
         }
         else if(locationType == ICON_DOJO)
         {
            hasMoreRooms = true;
            signXPos = roomData.width / 2;
            entranceroomnum = 1;
            objList += "<obj><id>0</id><x>" + (signXPos - 50).toString() + "</x><property>" + entranceroomnum + ",750,-1,1</property></obj>";
            if(nodeid != 8402944)
            {
               objList += "<obj><id>14</id><x>" + (signXPos + 350).toString() + "</x><property>30004</property></obj>";
            }
            objList += "<obj><id>28</id><x>" + signXPos + "</x><property></property></obj>";
         }
         else if(locationType == ICON_TEMPLE)
         {
            hasMoreRooms = true;
            signXPos = roomData.width / 2;
            entranceroomnum = 1;
            objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + 50 + "</property></obj>";
         }
         else if(locationType == ICON_JINMAKU)
         {
            hasMoreRooms = true;
            if(exitList[EXIT_S] == 1 || exitList[EXIT_W] == 1)
            {
               signXPos = 1350;
            }
            else
            {
               signXPos = 250;
            }
            entranceroomnum = 1;
            objList += "<obj><id>0</id><x>" + signXPos + "</x><property>" + entranceroomnum + "," + 50 + "</property></obj>";
         }
         else if(locationType == ICON_HUT)
         {
            hasMoreRooms = rng.rand(2) == 0;
            if(roomData.width > 1000)
            {
               signXPos = 500 + rng.rand(roomData.width - 1000);
            }
            else
            {
               signXPos = 400 + rng.rand(roomData.width - 800);
            }
            if(!(territory.x == 341 && territory.y == 341) && !territoryData.atWar && rng.rand(3) == 0)
            {
               objList += "<obj><id>23</id><x>" + signXPos + "</x><property>0</property></obj>";
            }
            if(!territoryData.atWar && hasMoreRooms)
            {
               objList += "<obj><id>31</id><x>" + signXPos + "</x><property>1</property></obj>";
            }
            else
            {
               objList += "<obj><id>31</id><x>" + signXPos + "</x><property>0</property></obj>";
            }
         }
         else if(totalExits == 1)
         {
            objid = 24;
            prop = "<property>" + nodeid + "</property>";
            randchance = 2;
            intervalDist = 200;
            maxobj = roomData.width / intervalDist;
            i = 0;
            while(i < maxobj && !noObjects)
            {
               if(rng.rand(randchance) == 0)
               {
                  objList += "<obj><id>" + objid + "</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x>" + prop + "</obj>";
               }
               i++;
            }
         }
         prop = "";
         randchance = 3;
         intervalDist = 250;
         noObjects = false;
         var roomDecor:int = rng.rand(4);
         switch(roomDecor)
         {
            case 0:
               objid = 2;
               intervalDist = 250;
               break;
            case 1:
               objid = 17;
               randchance = 2;
               intervalDist = 200;
               break;
            default:
               noObjects = true;
         }
         if(locationType == ICON_TOWN || locationType == ICON_DOJO || locationType == ICON_TEMPLE || locationType == ICON_GRAVEYARD || Boolean(territoryData.atWar))
         {
            noObjects = true;
         }
         if(locationType == ICON_DESTROYEDVILLAGE)
         {
            noObjects = true;
         }
         maxobj = roomData.width / intervalDist;
         i = 0;
         while(i < maxobj && !noObjects)
         {
            if(rng.rand(randchance) == 0)
            {
               if(objid == 17)
               {
                  objList = "<obj><id>" + objid + "</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x><property>" + (rng.rand(2) + 1) + "</property></obj>" + objList;
               }
               else if(objid == 2)
               {
                  objList = "<obj><id>" + objid + "</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x><property>" + (rng.rand(10) + 1) + "," + nodelevel + "</property></obj>" + objList;
               }
            }
            i++;
         }
         var hasEncounter:Boolean = false;
         if(locationType == ICON_DESTROYEDVILLAGE)
         {
            hasEncounter = true;
         }
         if(locationType != ICON_DOJO && locationType != ICON_TEMPLE && roomData.isPrivate != 9 && !(locationType == ICON_MERCCAMP && territoryData.hasEncounter(EncounterItem.MERCCAMP)))
         {
            if(territoryData.hasEncounter(EncounterItem.UNDEAD_VILLAGE) && locationType == ICON_TOWN)
            {
               if(int(Math.random() * 3) == 0)
               {
                  maxobj = roomData.width / 400;
                  for(i = 1; i < maxobj - 1; i++)
                  {
                     if(rng.rand(2) == 0)
                     {
                        objList += RoomGenNode.createRoomEnemy(rng,THEME_UNDEAD,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"zombie" + (i - i % 2).toString());
                     }
                  }
               }
               hasEncounter = true;
               if(rng.rand(3) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_CIVILIAN,roomData.width,THEME_UNDEAD);
               }
            }
            else if(territoryData.hasEncounter(EncounterItem.UNDEAD) && locationType == ICON_GRAVEYARD)
            {
               maxobj = roomData.width / 300;
               for(i = 1; i < maxobj - 1; i++)
               {
                  if(rng.rand(2) == 0)
                  {
                     objList += RoomGenNode.createRoomEnemy(rng,THEME_UNDEAD,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"zombie" + (i - i % 2).toString());
                  }
               }
               hasEncounter = true;
            }
            else if(locationType != ICON_TOWN && territoryData.hasEncounter(EncounterItem.UNDEAD_ROAMING) && int(Math.random() * 3) == 0)
            {
               maxobj = roomData.width / 300;
               for(i = 1; i < maxobj - 1; i++)
               {
                  if(rng.rand(2) == 0)
                  {
                     objList += RoomGenNode.createRoomEnemy(rng,THEME_UNDEAD,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"zombie");
                  }
               }
               hasEncounter = true;
               if(territoryData.hasEncounter(EncounterItem.BANDITS_UNDEAD) && int(Math.random() * 3) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_UNDEAD);
               }
               else if(territoryData.hasEncounter(EncounterItem.MERC_UNDEAD) && int(Math.random() * 4) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_MERC,roomData.width,THEME_UNDEAD);
               }
               else if(territoryData.hasEncounter(EncounterItem.NINJA_UNDEAD) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_NINJA,roomData.width,THEME_UNDEAD);
               }
            }
            if(!hasEncounter)
            {
               if(territoryData.hasEncounter(EncounterItem.ONI_VILLAGE) && locationType == ICON_TOWN)
               {
                  if(int(Math.random() * 3) == 0)
                  {
                     maxobj = roomData.width / 400;
                     for(i = 1; i < maxobj - 1; i++)
                     {
                        objList += RoomGenNode.createRoomEnemy(rng,THEME_ONI,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"goblin" + (i - i % 2).toString());
                     }
                  }
                  hasEncounter = true;
                  if(rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_CIVILIAN,roomData.width,THEME_ONI);
                  }
               }
               else if(territoryData.hasEncounter(EncounterItem.ONI_ROAMING) && int(Math.random() * 3) == 0)
               {
                  if(int(Math.random() * 5) == 0)
                  {
                     objList += RoomGenNode.createRoomEnemy(rng,THEME_ONI,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"ogre",true);
                  }
                  else
                  {
                     maxobj = roomData.width / 300;
                     for(i = 1; i < maxobj - 1; i++)
                     {
                        if(rng.rand(2) == 0)
                        {
                           objList += RoomGenNode.createRoomEnemy(rng,THEME_ONI,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"goblin");
                        }
                     }
                  }
                  hasEncounter = true;
                  if(territoryData.hasEncounter(EncounterItem.BANDITS_ONI) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_ONI);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.MERC_ONI) && rng.rand(4) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_MERC,roomData.width,THEME_ONI);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.NINJA_ONI) && rng.rand(5) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_NINJA,roomData.width,THEME_ONI);
                  }
               }
               else if(locationType != ICON_TOWN && territoryData.hasEncounter(EncounterItem.ONI_ROAMING))
               {
                  if(territoryData.hasEncounter(EncounterItem.BANDITS_ONI) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_ONI);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.MERC_ONI) && rng.rand(4) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_MERC,roomData.width,THEME_ONI);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.NINJA_ONI) && rng.rand(5) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_NINJA,roomData.width,THEME_ONI);
                  }
               }
            }
            if(!hasEncounter)
            {
               if(territoryData.hasEncounter(EncounterItem.BANDITS_VILLAGE) && locationType == ICON_TOWN)
               {
                  if(int(Math.random() * 3) == 0)
                  {
                     maxobj = roomData.width / 400;
                     for(i = 1; i < maxobj - 1; i++)
                     {
                        objList += RoomGenNode.createRoomEnemy(rng,THEME_BANDIT,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"aggrobandits" + (i - i % 2).toString(),false);
                     }
                  }
                  hasEncounter = true;
                  if(rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_CIVILIAN,roomData.width,THEME_BANDIT);
                  }
               }
               else if(territoryData.hasEncounter(EncounterItem.BANDITS_WILDLIFE) && locationType == ICON_ANIMALSPAWN && int(Math.random() * 3) == 0)
               {
                  maxobj = roomData.width / 300;
                  for(i = 1; i < maxobj - 1; i++)
                  {
                     if(rng.rand(2) == 0)
                     {
                        objList += RoomGenNode.createRoomEnemy(rng,THEME_BANDIT,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"aggrobandits",false);
                     }
                  }
                  hasEncounter = true;
                  if(rng.rand(2) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,this.getWildlifeType(nodeid),roomData.width,THEME_BANDIT);
                  }
               }
               else if(locationType != ICON_TOWN && territoryData.hasEncounter(EncounterItem.BANDITS_ROAMING) && int(Math.random() * 2) == 0)
               {
                  maxobj = roomData.width / 300;
                  for(i = 1; i < maxobj - 1; i++)
                  {
                     if(rng.rand(2) == 0)
                     {
                        objList += RoomGenNode.createRoomEnemy(rng,THEME_BANDIT,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"aggrobandits",false);
                     }
                  }
                  hasEncounter = true;
                  if(territoryData.hasEncounter(EncounterItem.MERC_BANDITS) && rng.rand(4) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_MERC,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.NINJA_BANDITS) && rng.rand(5) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_NINJA,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.BANDITS_BANDITS) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.BANDITS_ONI) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_ONI,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.BANDITS_UNDEAD) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_UNDEAD,roomData.width,THEME_BANDIT);
                  }
               }
               else if(locationType != ICON_TOWN && locationType != ICON_DOJO && locationType != ICON_TEMPLE && locationType != ICON_GRAVEYARD && int(Math.random() * 4) == 0)
               {
                  maxobj = roomData.width / 300;
                  for(i = 1; i < maxobj - 1; i++)
                  {
                     if(rng.rand(2) == 0)
                     {
                        objList += RoomGenNode.createRoomEnemy(rng,THEME_BANDIT,roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"aggrobandits",false);
                     }
                  }
                  hasEncounter = true;
                  if(territoryData.hasEncounter(EncounterItem.MERC_BANDITS) && rng.rand(4) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_MERC,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.NINJA_BANDITS) && rng.rand(5) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_NINJA,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.BANDITS_BANDITS) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.BANDITS_ONI) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_ONI,roomData.width,THEME_BANDIT);
                  }
                  else if(territoryData.hasEncounter(EncounterItem.BANDITS_UNDEAD) && rng.rand(3) == 0)
                  {
                     objList += RoomGenNode.createRoomDead(rng,THEME_UNDEAD,roomData.width,THEME_BANDIT);
                  }
               }
            }
            if(!hasEncounter)
            {
               if(territoryData.hasEncounter(EncounterItem.WILDLIFE) && locationType == ICON_ANIMALSPAWN && int(Math.random() * 3) == 0 || territoryData.hasEncounter(EncounterItem.WILDLIFE_ROAMING) && rng.rand(3) == 0 && locationType !== ICON_TOWN && locationType != ICON_DOJO && (roomData.bg == GameStage.BG_BAMBOOFOREST || roomData.bg == GameStage.BG_FOREST || roomData.bg == GameStage.BG_BATTLEFIELD || roomData.bg == GameStage.BG_MOUNTAINPATH))
               {
                  objList += RoomGenNode.createRoomEnemy(rng,this.getWildlifeType(nodeid),roomData.width,rng.rand(roomData.width - 400) + 200,nodelevel,"wildlife");
                  hasEncounter = true;
               }
            }
            if(!hasEncounter && locationType != ICON_TOWN)
            {
               if(territoryData.hasEncounter(EncounterItem.MERC_BANDITS) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_MERC);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_MERC,roomData.width);
                  hasEncounter = true;
               }
               else if(territoryData.hasEncounter(EncounterItem.MERC_ONI) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_ONI,roomData.width,THEME_MERC);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_MERC,roomData.width);
                  hasEncounter = true;
               }
               else if(territoryData.hasEncounter(EncounterItem.MERC_UNDEAD) && (territoryData.hasEncounter(EncounterItem.UNDEAD_ROAMING) || locationType == ICON_GRAVEYARD) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_UNDEAD,roomData.width,THEME_MERC);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_MERC,roomData.width);
                  hasEncounter = true;
               }
               else if(territoryData.hasEncounter(EncounterItem.NINJA_BANDITS) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_BANDIT,roomData.width,THEME_NINJA);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_NINJA,roomData.width);
                  hasEncounter = true;
               }
               else if(territoryData.hasEncounter(EncounterItem.NINJA_ONI) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_ONI,roomData.width,THEME_NINJA);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_NINJA,roomData.width);
                  hasEncounter = true;
               }
               else if(territoryData.hasEncounter(EncounterItem.NINJA_UNDEAD) && (territoryData.hasEncounter(EncounterItem.UNDEAD_ROAMING) || locationType == ICON_GRAVEYARD) && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,THEME_UNDEAD,roomData.width,THEME_NINJA);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_NINJA,roomData.width);
                  hasEncounter = true;
               }
               else if(territoryData.hasEncounter(EncounterItem.VILLAGE_WILDLIFE) && locationType == ICON_ANIMALSPAWN && int(Math.random() * 5) == 0)
               {
                  objList += RoomGenNode.createRoomDead(rng,this.getWildlifeType(nodeid),roomData.width,THEME_CIVILIAN);
                  objList += RoomGenNode.createRoomFriendly(rng,THEME_CIVILIAN,roomData.width);
                  hasEncounter = true;
               }
            }
         }
         if(!(territory.x == 341 && territory.y == 341) && !hasEncounter && rng.rand(5) == 0 && int(Math.random() * 3) == 0)
         {
            objList += "<obj><id>" + 23 + "</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x><property>0,1</property><name>procgenronin</name></obj>";
         }
         else if(!hasEncounter && int(Math.random() * 2) == 0)
         {
            maxobj = Math.random() * 7 + 1;
            for(i = 0; i < maxobj; i++)
            {
               objList = "<obj><id>61</id><x>" + Math.random() * roomData.width + "</x></obj>" + objList;
            }
         }
         if(locationType == ICON_MERCCAMP && territoryData.hasEncounter(EncounterItem.MERCCAMP))
         {
            maxobj = roomData.width / 700;
            for(i = 0; i < maxobj; i++)
            {
               if(rng.rand(2) == 0)
               {
                  objList += "<obj><id>34</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x></obj>";
               }
            }
            maxobj = roomData.width / 300;
            for(i = 0; i < maxobj; i++)
            {
               if(rng.rand(2) == 0)
               {
                  objList += "<obj><id>4</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x><property>82</property></obj>";
               }
            }
            objList += "<obj><id>4</id><x>" + (rng.rand(roomData.width - 300) + 150) + "</x><property>142</property><name>merccaptain</name></obj>";
         }
         roomData.objectList = new XMLList(objList);
         roomData.roomid = 0;
         roomDataVector.push(roomData);
         if(hasMoreRooms && generateInnerRooms)
         {
            if(exitList[EXIT_N] == 1)
            {
               startDir = EXIT_S;
            }
            if(exitList[EXIT_S] == 1)
            {
               startDir = EXIT_N;
            }
            if(exitList[EXIT_E] == 1)
            {
               startDir = EXIT_W;
            }
            if(exitList[EXIT_W] == 1)
            {
               startDir = EXIT_E;
            }
            if(isNSOrientation)
            {
               perpenDir = EXIT_W;
            }
            else
            {
               perpenDir = EXIT_N;
            }
            if(locationType == ICON_DUNGEON)
            {
               this.dungeonGenerator.createDungeon(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme,overwriteType == XMLWorldNode.OVERWRITE_CLANMISSIONLOCATION);
            }
            else if(locationType == ICON_TEMPLEDUNGEON)
            {
               this.dungeonGenerator.createTempleDungeon(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme,overwriteType == XMLWorldNode.OVERWRITE_CLANMISSIONLOCATION);
            }
            else if(locationType == ICON_CAVE)
            {
               this.dungeonGenerator.createCave(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
            }
            else if(locationType == ICON_MINE)
            {
               this.dungeonGenerator.createMine(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
            }
            else if(locationType == ICON_RUINS)
            {
               this.dungeonGenerator.createRuins(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
            }
            else if(locationType == ICON_TOWN)
            {
               this.dungeonGenerator.createTown(signXPos,nodeid,nodelevel,startDir,roomDataVector,territoryData,townColor,theme);
            }
            else if(locationType == ICON_DESTROYEDVILLAGE)
            {
               territoryData = new TerritoryData(nodeid);
               territoryData.townProsperity = 499;
               this.dungeonGenerator.createTown(signXPos,nodeid,nodelevel,EXIT_N,roomDataVector,territoryData,townColor,theme);
            }
            else if(locationType == ICON_NINJAVILLAGE)
            {
               this.dungeonGenerator.createNinjaVillage(signXPos,nodeid,nodelevel,perpenDir,roomDataVector,theme);
            }
            else if(locationType == ICON_NINJATRAIL)
            {
               this.dungeonGenerator.createNinjaTrail(signXPos,nodeid,nodelevel,perpenDir,roomDataVector,theme);
            }
            else if(locationType == ICON_DOJO)
            {
               this.dungeonGenerator.createDojo(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
            }
            else if(locationType == ICON_TEMPLE)
            {
               this.dungeonGenerator.createTemple(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
            }
            else if(locationType == ICON_JINMAKU)
            {
               this.dungeonGenerator.createJinmaku(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme,overwriteType == XMLWorldNode.OVERWRITE_CLANMISSIONLOCATION);
            }
            else if(locationType == ICON_HUT)
            {
               this.dungeonGenerator.createHut(signXPos,nodeid,nodelevel,roomDataVector,theme);
            }
            else if(locationType == ICON_ONIDEN)
            {
               if(territoryData.hasEncounter(EncounterItem.ONI))
               {
                  this.dungeonGenerator.createOniDen(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
               }
               else
               {
                  this.dungeonGenerator.createAnimalCave(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme);
               }
            }
            else if(locationType == ICON_ROUTE)
            {
               this.dungeonGenerator.createForestRoute(signXPos,nodeid,nodelevel,startDir,roomDataVector,theme,overwriteType == XMLWorldNode.OVERWRITE_CLANMISSIONLOCATION);
            }
         }
         if(overwriteType == 0)
         {
            this.addRoomData(nodeid,roomDataVector);
         }
         return roomDataVector;
      }
      
      public function getLocationType(nodeid:int) : int
      {
         var territory:Point = this.getTerritory(nodeid);
         var territoryData:TerritoryData = this.getTerritoryData(territory.x,territory.y);
         return territoryData.getLocationType(nodeid);
      }
      
      internal function getBGGroupType(groupx:int, groupy:int) : int
      {
         var grouptype:int = 0;
         var groupid:int = groupx << 12 | groupy;
         var dice:int = RNG.getRandAfterXTimes(groupid,0,4);
         if(dice == 0)
         {
            grouptype = GameStage.BG_FOREST;
         }
         else if(dice == 1)
         {
            grouptype = GameStage.BG_BAMBOOFOREST;
         }
         else if(dice == 2)
         {
            grouptype = GameStage.BG_BATTLEFIELD;
         }
         else if(dice == 3)
         {
            grouptype = GameStage.BG_MOUNTAIN;
         }
         return grouptype;
      }
      
      public function getRoomBG(nodeid:int) : int
      {
         var groupx:* = Math.floor((nodeid >> 12 & 0x0FFF) / 3);
         var groupy:* = Math.floor((nodeid & 0x0FFF) / 3);
         var grouptype:int = this.getBGGroupType(groupx,groupy);
         var dice:int = RNG.getRandAfterXTimes(nodeid,0,9);
         var roomType:int = grouptype;
         switch(grouptype)
         {
            case GameStage.BG_BAMBOOFOREST:
               if(dice == 0)
               {
                  roomType = GameStage.BG_PADIFIELD;
               }
               break;
            case GameStage.BG_FOREST:
               if(dice <= 2)
               {
                  roomType = GameStage.BG_FOREST2;
               }
               else if(dice <= 5)
               {
                  roomType = GameStage.BG_FOREST3;
               }
               break;
            case GameStage.BG_BATTLEFIELD:
               if(dice == 0)
               {
                  roomType = GameStage.BG_FOREST;
               }
               break;
            case GameStage.BG_MOUNTAIN:
               if(dice == 0)
               {
                  roomType = GameStage.BG_BATTLEFIELD;
               }
               else if(dice == 1)
               {
                  roomType = GameStage.BG_MOUNTAINPATH;
               }
         }
         return roomType;
      }
      
      internal function isSeaSide(nodeid:int) : Boolean
      {
         var territorySector:Point = this.getTerritorySector(nodeid);
         var territory:Point = this.getTerritory(nodeid);
         if(territorySector.y == 0 && !QuestEngine.hasTerritory(territory.x,territory.y - 1))
         {
            return true;
         }
         if(territorySector.y == 5 && !QuestEngine.hasTerritory(territory.x,territory.y + 1))
         {
            return true;
         }
         if(territorySector.x == 5 && !QuestEngine.hasTerritory(territory.x + 1,territory.y))
         {
            return true;
         }
         if(territorySector.x == 0 && !QuestEngine.hasTerritory(territory.x - 1,territory.y))
         {
            return true;
         }
         return false;
      }
      
      public function getNodeName(nodeid:int) : String
      {
         var roomBG:int = this.getRoomBG(nodeid);
         var dir1:String = "";
         var dir2:String = "";
         var terrSector:Point = this.getTerritorySector(nodeid);
         if(terrSector.y <= 1)
         {
            dir1 = LangManager.getString(398);
         }
         else if(terrSector.y >= 4)
         {
            dir1 = LangManager.getString(399);
         }
         if(terrSector.x <= 1)
         {
            dir2 = LangManager.getString(401);
         }
         else if(terrSector.x >= 4)
         {
            dir2 = LangManager.getString(400);
         }
         var dir:String = dir1 + dir2;
         if(dir != "")
         {
            dir += " ";
         }
         var territoryName:String = NameGenerator.getInstance().getPlaceName(this.getTerritoryId(nodeid));
         var bgString:String = "";
         switch(roomBG)
         {
            case GameStage.BG_FOREST:
            case GameStage.BG_FOREST2:
            case GameStage.BG_FOREST3:
            case GameStage.BG_FOREST4:
            case GameStage.BG_BAMBOOFOREST:
               bgString = LangManager.getString(1003);
               break;
            case GameStage.BG_BATTLEFIELD:
               bgString = LangManager.getString(1002);
               break;
            case GameStage.BG_MOUNTAIN:
            case GameStage.BG_MOUNTAINPATH:
               bgString = LangManager.getString(1015);
               break;
            case GameStage.BG_PADIFIELD:
               bgString = LangManager.getString(1006);
               break;
            case GameStage.BG_WATERFALL:
               bgString = LangManager.getString(1022);
               break;
            case GameStage.BG_BEACH:
               bgString = LangManager.getString(1020);
               break;
            case GameStage.BG_CAVE:
               bgString = LangManager.getString(1021);
         }
         return dir + territoryName + " " + bgString;
      }
      
      public function getNodeNameCode(nodeid:int) : String
      {
         var territory:Point = this.getTerritory(nodeid);
         var sector:Point = this.getTerritorySector(nodeid);
         return LangManager.getString(557) + "(" + (territory.x - 341 + WarSelectUI.DTERRSHIFTX) + "," + (territory.y - 341 + WarSelectUI.DTERRSHIFTY) + ") " + LangManager.getString(319) + "(" + sector.x + "," + sector.y + ")";
      }
      
      public function getQuestLogDescriptiveNodeName(nodeid:int, roomid:int) : String
      {
         var room:XMLRoomData = null;
         var str:String = QuestEngine.getNodeData(nodeid).name;
         if(roomid != 0 && roomid != -1)
         {
            room = QuestEngine.getNodeData(nodeid).getRoomData()[roomid];
            if(room != null && str != room.getName())
            {
               str += ", " + room.getName();
            }
         }
         return str;
      }
      
      public function getNodeExits(nodeid:int) : Array
      {
         var territory:Point = null;
         var territorysector:Point = null;
         var nodeXML:XMLWorldNode = QuestEngine.hasNodeData(nodeid);
         if(nodeXML == null || nodeXML.isGenerated || nodeXML.overwrite == XMLWorldNode.OVERWRITE_PARTIAL || nodeXML.overwrite == XMLWorldNode.OVERWRITE_CLANMISSIONLOCATION || nodeXML.overwrite == XMLWorldNode.OVERWRITE_PARTIAL_KEEP0)
         {
            territory = this.getTerritory(nodeid);
            territorysector = this.getTerritorySector(nodeid);
            return this.getTerritoryData(territory.x,territory.y).getNodeExits(territorysector.x,territorysector.y);
         }
         return nodeXML.getNodeExits();
      }
      
      public function isNodeNSOrientation(exitarray:Array) : Boolean
      {
         var ns:int = exitarray[EXIT_N] + exitarray[EXIT_S];
         var ew:int = exitarray[EXIT_E] + exitarray[EXIT_W];
         if(ns == 2 && ew != 2)
         {
            return true;
         }
         if(ew == 0 && ns == 1)
         {
            return true;
         }
         if(ns == 1 && ew == 1)
         {
            return false;
         }
         return false;
      }
      
      internal function isStraightRoom(exitarray:Array) : Boolean
      {
         var ns:int = 0;
         var ew:int = 0;
         var total:int = exitarray[EXIT_N] + exitarray[EXIT_S] + exitarray[EXIT_E] + exitarray[EXIT_W];
         if(total == 2)
         {
            ns = exitarray[EXIT_N] + exitarray[EXIT_S];
            ew = exitarray[EXIT_E] + exitarray[EXIT_W];
            if(ns == 2 || ew == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function isDeadEnd(exitarray:Array) : Boolean
      {
         var total:int = exitarray[EXIT_N] + exitarray[EXIT_S] + exitarray[EXIT_E] + exitarray[EXIT_W];
         return total == 1;
      }
      
      public function getRoomWidth(nodeid:int) : int
      {
         return 800 + RNG.getRandAfterXTimes(nodeid,3,800);
      }
      
      internal function getShiftedNodeId(currentNodeID:int, shiftX:int, shiftY:int) : int
      {
         var xpart:int = (currentNodeID >> 12 & 0x0FFF) + shiftX;
         var ypart:int = (currentNodeID & 0x0FFF) + shiftY;
         if(xpart < 0 || xpart > 4094 || ypart < 0 || ypart > 4094)
         {
            return -1;
         }
         return xpart << 12 | ypart;
      }
      
      internal function getShiftedRoomId(currentRoomID:int, shiftX:int, shiftY:int) : int
      {
         var xpart:int = (currentRoomID >> 8 & 0xFF) + shiftX;
         var ypart:int = (currentRoomID & 0xFF) + shiftY;
         return xpart << 8 | ypart;
      }
      
      public function getOreType(nodeid:int, premium:Boolean) : *
      {
         var dice:int = 0;
         var lvl:int = 0;
         var rng:RNG = new RNG(nodeid);
         if(!premium)
         {
            if(lvl > 60)
            {
               dice = rng.rand(6);
            }
            else if(lvl > 30)
            {
               dice = rng.rand(5);
            }
            else
            {
               dice = rng.rand(4);
            }
            if(dice == 0)
            {
               return 2;
            }
            if(dice == 1)
            {
               return 3;
            }
            if(dice == 2)
            {
               return 4;
            }
            if(dice == 3)
            {
               return 5;
            }
            if(dice == 4)
            {
               return 6;
            }
            if(dice == 5)
            {
               return 7;
            }
            return;
         }
         lvl = this.getNodeLevel(nodeid);
         if(lvl < 30)
         {
            return 6;
         }
         if(lvl < 60)
         {
            return 7;
         }
         return 8;
      }
      
      public function getTownStyle(nodeid:int) : uint
      {
         var rng:RNG = new RNG(nodeid);
         var townColor:uint = uint(rng.rand(10));
         if(townColor == 0 || townColor > 4)
         {
            townColor = ColorCode.generateLightColor(nodeid);
         }
         return townColor;
      }
   }
}

