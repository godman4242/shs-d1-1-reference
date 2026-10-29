package
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.geom.Point;
   
   public class StageManager
   {
      
      internal static var gameStage:GameStage;
      
      internal static var gameStageType:int;
      
      internal static var player:MCSPlayer;
      
      internal static var action:int;
      
      internal static var timing:int;
      
      internal static var battleUI:BattleUI;
      
      internal static var skillUI:SkillUI;
      
      internal static var duelIntroBar:DuelIntroBar;
      
      internal static var battleIntroBar:BattleIntroBar;
      
      internal static var actionState:int;
      
      internal static var timeCounter:int;
      
      internal static var secCounter:int;
      
      internal static var returnPosX:int;
      
      internal static var interactActionCounter:int;
      
      internal static var roomData:Array;
      
      internal static var currentNode:int;
      
      internal static var currentRoom:int;
      
      internal static var currentTerritory:Point;
      
      internal static var overworldHUD:OverworldHUD;
      
      internal static var screenShakeStartPos:Point;
      
      public static var STATE_PEACEFUL:int = 0;
      
      public static var STATE_FROZEN:int = 1;
      
      public static var STATE_BATTLE:int = 2;
      
      internal static var redFreezeCounter:int = -1;
      
      internal static var roomDeadList:Vector.<String> = new Vector.<String>();
      
      internal static var playerMinBounds:int = 350;
      
      internal static var playerMaxBounds:int = 450;
      
      internal static var screenShake:Boolean = false;
      
      internal static var screenShakeCounter:int = 0;
      
      internal static var screenShakeAmt:int = 0;
      
      public function StageManager()
      {
         super();
      }
      
      public static function setCurrentNode(num:int) : *
      {
         currentNode = num;
      }
      
      public static function initStage(actionType:int, stageMC:Stage, bg:int, stageWidth:int, time:int, bgparam:int, bgparam2:int = 0) : *
      {
         if(gameStage != null)
         {
            disposeStage();
         }
         switch(bg)
         {
            case GameStage.BG_MOUNTAIN:
               gameStage = new BG_Loader(bg,bgparam,stageWidth);
               break;
            case GameStage.BG_BAMBOOFOREST:
               gameStage = new BG_BambooForest();
               break;
            case GameStage.BG_BAMBOOFORESTHUT:
               gameStage = new BG_BambooForestHut();
               break;
            case GameStage.BG_BAMBOOFORESTDOJO:
               gameStage = new BG_BambooForestDojo();
               break;
            case GameStage.BG_BAMBOOFORESTTOWN:
               gameStage = new BG_BambooForestTown();
               break;
            case GameStage.BG_TOWNPROCGEN_VILLAGE:
               gameStage = new BG_TownVillage();
               break;
            case GameStage.BG_TOWNPROCGEN_TOWN:
               gameStage = new BG_TownProcGen(1,bgparam);
               break;
            case GameStage.BG_TOWNPROCGEN_CITY:
               gameStage = new BG_TownProcGen(2,bgparam);
               break;
            default:
               gameStage = new BG_Loader(bg,bgparam,bgparam2);
         }
         stageMC.addChild(gameStage);
         gameStage.doResize();
         action = actionType;
         gameStage.setGameStageWidth(stageWidth);
         gameStageType = bg;
         timing = time;
         if(battleUI == null)
         {
            battleUI = new BattleUI();
         }
         stageMC.addChild(battleUI);
         skillUI = new SkillUI();
         stageMC.addChild(skillUI);
         skillUI.visible = false;
         overworldHUD = OverworldHUD.getInstance();
         stageMC.addChild(overworldHUD);
         GameEngine.placeBlockers();
         if(action == GameEngine.ACTION_ADVENTURE)
         {
            battleUI.visible = false;
            actionState = STATE_PEACEFUL;
            overworldHUD.initForAdventureMode();
            InputManager.setAdventureMode();
         }
         else
         {
            overworldHUD.initForBattleMode();
            battleUI.init();
         }
         if(timing > 0)
         {
            battleUI.showTimer(true);
            battleUI.setTimerNumber(timing);
         }
         else
         {
            battleUI.showTimer(false);
         }
         if(action != GameEngine.ACTION_DUEL && action != GameEngine.ACTION_ADVENTURE)
         {
            battleIntroBar = new BattleIntroBar();
            battleIntroBar.scaleX = StatsManager.stageScale;
            battleIntroBar.scaleY = StatsManager.stageScale;
            battleIntroBar.x = StatsManager.stageOffsetX;
            battleIntroBar.y = (480 - 80) / 2 * StatsManager.stageScale + StatsManager.stageOffsetY;
            stageMC.addChild(battleIntroBar);
            battleIntroBar.init(action);
            actionState = STATE_FROZEN;
         }
         redFreezeCounter = -1;
         timeCounter = 0;
         secCounter = 0;
         player = StatsManager.getPlayer();
         InputManager.initStage(stageMC);
         if(action == GameEngine.ACTION_PVPROOM || GameEngine.isAdventureMode())
         {
            StatsManager.initPlayer();
         }
      }
      
      public static function reinitStage(actionType:int, stageWidth:int, time:int) : *
      {
         action = actionType;
         gameStage.setStagePosition(0);
         gameStage.setGameStageWidth(stageWidth);
         timing = time;
         overworldHUD.initForBattleMode();
         battleUI.visible = true;
         battleUI.init();
         if(timing > 0)
         {
            battleUI.showTimer(true);
            battleUI.setTimerNumber(timing);
         }
         else
         {
            battleUI.showTimer(false);
         }
         var stageMC:Stage = GameEngine.getStageMC();
         if(skillUI == null)
         {
            skillUI = new SkillUI();
            stageMC.addChild(skillUI);
            skillUI.visible = false;
         }
         if(action != GameEngine.ACTION_DUEL && action != GameEngine.ACTION_ADVENTURE)
         {
            if(battleIntroBar == null)
            {
               battleIntroBar = new BattleIntroBar();
               battleIntroBar.scaleX = StatsManager.stageScale;
               battleIntroBar.scaleY = StatsManager.stageScale;
               battleIntroBar.x = StatsManager.stageOffsetX;
               battleIntroBar.y = (480 - 80) / 2 * StatsManager.stageScale + StatsManager.stageOffsetY;
               stageMC.addChild(battleIntroBar);
            }
            battleIntroBar.init(action);
            actionState = STATE_FROZEN;
         }
         redFreezeCounter = -1;
         timeCounter = 0;
         secCounter = 0;
      }
      
      public static function initDuel(playerOnLeft:Boolean) : *
      {
         duelIntroBar = new DuelIntroBar();
         duelIntroBar.scaleX = StatsManager.stageScale;
         duelIntroBar.scaleY = StatsManager.stageScale;
         duelIntroBar.x = StatsManager.stageOffsetX;
         duelIntroBar.y = (480 - 80) / 2 * StatsManager.stageScale + StatsManager.stageOffsetY;
         duelIntroBar.init(playerOnLeft);
         var stageMC:Stage = GameEngine.getStageMC();
         resetStagePosition();
         stageMC.addChild(duelIntroBar);
         stageMC.setChildIndex(skillUI,stageMC.numChildren - 1);
         actionState = STATE_PEACEFUL;
         redFreezeCounter = -1;
         timeCounter = 0;
         secCounter = 0;
         action = 6;
         overworldHUD.initForBattleMode();
         battleUI.visible = true;
         battleUI.init();
         if(playerOnLeft)
         {
            battleUI.setLatency(0);
         }
      }
      
      public static function initRooms(rmData:Array, roomid:int, playerNewXPos:int) : *
      {
         roomData = rmData;
         currentRoom = roomid;
         roomDeadList.length = 0;
         StatsManager.removeAllKey();
         StatsManager.removeAllLever();
         if(roomData[0].getName() != "")
         {
            NodeUI.instance.setNodeName(roomData[0].getName());
         }
         else
         {
            NodeUI.instance.setNodeName(getRoomName(0,currentNode));
         }
         if(playerNewXPos < StatsManager.stageWidth / 2)
         {
            gameStage.setStagePosition(0);
         }
         else if(playerNewXPos >= roomData[roomid].getWidth() - StatsManager.stageWidth / 2)
         {
            gameStage.setStagePosition(roomData[roomid].getWidth() - StatsManager.stageWidth);
         }
         else if(playerNewXPos > gameStage.getGameStageWidth() - StatsManager.stageWidth / 2)
         {
            gameStage.setStagePosition(StatsManager.stageWidth - gameStage.getGameStageWidth());
         }
         gameStage.createRoomObjects(roomData[roomid].getObjectList(),roomDeadList);
         createRoomQuestObjects(currentNode,currentRoom);
         gameStage.showInteractAction(player.getMCS());
         SoundManager.instance.pickMusic(roomData[roomid].getBG(),gameStage.hasHostile,roomData[roomid].isPvPRoom());
         initPlayerRoomPosition(playerNewXPos,false);
         NetworkManager.getInstance().connectToRoom(currentNode,roomid,roomData[roomid].isPrivate,playerNewXPos);
      }
      
      public static function changedTerritoryButNoData(nodeid:int) : Boolean
      {
         var territoryId:int = 0;
         var territoryData:TerritoryData = null;
         var territory:Point = NodeGenerator.instance.getTerritory(nodeid);
         if(currentTerritory == null || !currentTerritory.equals(territory))
         {
            territoryId = territory.x << 12 | territory.y;
            territoryData = NodeGenerator.instance.findTerritoryData(territoryId);
            if(territoryData == null || !territoryData.hasDataFromServer())
            {
               QueryManager.instance.getTerritoryData(territory.x,territory.y);
               return true;
            }
         }
         return false;
      }
      
      public static function gotoRoom(roomNum:int, playerNewXPos:int = 150, nodeNum:int = -1, compassDir:int = -1, isReturnToRoom:Boolean = false) : *
      {
         var room:XMLRoomData = null;
         var nodeXML:XMLWorldNode = null;
         var territory:Point = null;
         var rmData:Array = null;
         var markedQuest:int = 0;
         var max:int = 0;
         var obj:InteractiveStageObject = null;
         var dirSign:Obj_DirectionSign = null;
         var dirDoorLocked:Obj_DoorDungeonLocked = null;
         var i:int = 0;
         var oldterritory:Point = null;
         var newterritory:Point = null;
         var lvldiff:int = 0;
         if(GameEngine.isPvPRoomMode() && StatsManager.getPlayer().getHP() <= 0)
         {
            return;
         }
         var prevNode:int = currentNode;
         if(roomNum == -1)
         {
            roomNum = 0;
         }
         else if(roomNum == -2)
         {
            roomNum = 0;
            nodeNum = StatsManager.getStat(30021);
            if(nodeNum == 0)
            {
               nodeNum = currentNode;
            }
            StatsManager.setStat(30021,0);
            playerNewXPos = 150;
            if(nodeNum <= 0)
            {
               nodeNum = 8382465;
            }
            StatsManager.saveLocation(nodeNum);
         }
         if(roomNum == 0 && StatsManager.getStat(StatsManager.STAT_LOCATION_ROOM) != 0)
         {
            StatsManager.setStat(StatsManager.STAT_LOCATION_ROOM,0);
         }
         if(nodeNum != -1)
         {
            nodeXML = QuestEngine.getNodeData(nodeNum);
            if(nodeXML != null)
            {
               rmData = nodeXML.getRoomData();
               if(rmData != null)
               {
                  roomData = rmData;
                  if(roomData[roomNum].getName() != "")
                  {
                     NodeUI.instance.setNodeName(roomData[roomNum].getName());
                  }
                  else
                  {
                     NodeUI.instance.setNodeName(getRoomName(roomNum,currentNode));
                  }
               }
            }
            room = roomData[roomNum];
            if(roomData.length > 1 && (room.isPrivate != 9 && room.isPrivate != 10))
            {
               StatsManager.saveLocation(nodeNum);
            }
            roomDeadList.length = 0;
            StatsManager.removeAllKey();
            StatsManager.removeAllLever();
            Overworld.setCurrentNode(nodeNum);
            currentNode = nodeNum;
            QuestEngine.refreshNodeQuests(nodeNum);
            territory = NodeGenerator.instance.getTerritory(nodeNum);
            if(currentTerritory == null || !currentTerritory.equals(territory))
            {
               currentTerritory = territory;
               NodeGenerator.instance.initSurroundingTerrCache(nodeNum);
            }
         }
         if(room == null)
         {
            room = roomData[roomNum];
         }
         currentRoom = roomNum;
         if(room.getName() != "")
         {
            NodeUI.instance.setNodeName(room.getName());
         }
         else
         {
            NodeUI.instance.setNodeName(getRoomName(roomNum,currentNode));
         }
         NPCManager.refreshRoom(true);
         ProjectileManager.refreshRoom();
         gameStage.clearRoomObjects();
         disposeStage();
         var leavingPvPRoomMode:Boolean = false;
         if(room.isPvPRoom())
         {
            if(!GameEngine.isPvPRoomMode())
            {
               trace("entering pvp room mode");
               StatsManager.autoSlash = false;
               GameEngine.setPvPRoomMode();
               initStage(GameEngine.ACTION_PVPROOM,GameEngine.getStageMC(),room.getBG(),room.getWidth(),0,room.getBGParam(),room.getBGParam2());
               battleIntroBar = new BattleIntroBar();
               battleIntroBar.scaleX = StatsManager.stageScale;
               battleIntroBar.scaleY = StatsManager.stageScale;
               battleIntroBar.x = StatsManager.stageOffsetX;
               battleIntroBar.y = (480 - 80) / 2 * StatsManager.stageScale + StatsManager.stageOffsetY;
               GameEngine.stageMC.addChild(battleIntroBar);
               battleIntroBar.init(1000);
               OverworldHUD.instance.setActiveQuestText("");
            }
            else
            {
               initStage(GameEngine.ACTION_PVPROOM,GameEngine.getStageMC(),room.getBG(),room.getWidth(),0,room.getBGParam(),room.getBGParam2());
               StatsManager.saveHealthAfterBattleNoRegen();
            }
         }
         else
         {
            initStage(GameEngine.ACTION_ADVENTURE,GameEngine.getStageMC(),room.getBG(),room.getWidth(),0,room.getBGParam(),room.getBGParam2());
            if(GameEngine.isPvPRoomMode())
            {
               trace("leaving pvp room mode");
               leavingPvPRoomMode = true;
               GameEngine.setAdventureMode();
               if(room.isPrivate == XMLRoomData.ROOMTYPE_DOJO)
               {
                  StatsManager.initPlayer();
               }
               else
               {
                  StatsManager.saveHealthAfterBattle();
               }
               battleIntroBar = new BattleIntroBar();
               battleIntroBar.scaleX = StatsManager.stageScale;
               battleIntroBar.scaleY = StatsManager.stageScale;
               battleIntroBar.x = StatsManager.stageOffsetX;
               battleIntroBar.y = (480 - 80) / 2 * StatsManager.stageScale + StatsManager.stageOffsetY;
               GameEngine.stageMC.addChild(battleIntroBar);
               battleIntroBar.init(1001);
               markedQuest = StatsManager.getStat(StatsManager.STAT_MARKEDNODE);
               if(markedQuest != -1)
               {
                  StatsManager.activeQuestList[markedQuest].displayQuestTitleInNodeUI();
               }
            }
         }
         gameStage.resetStagePosition();
         gameStage.createRoomObjects(room.getObjectList(),roomDeadList);
         createRoomQuestObjects(currentNode,currentRoom);
         SoundManager.instance.pickMusic(room.getBG(),gameStage.hasHostile,room.isPvPRoom());
         if(compassDir != -1)
         {
            max = int(gameStage.roomInteractiveObjectList.length);
            for(i = 0; i < max; i++)
            {
               obj = gameStage.roomInteractiveObjectList[i];
               if(obj.typeid == 0)
               {
                  dirSign = obj as Obj_DirectionSign;
                  if(compassDir == NodeGenerator.EXIT_N && dirSign.compassDir == NodeGenerator.EXIT_S || compassDir == NodeGenerator.EXIT_S && dirSign.compassDir == NodeGenerator.EXIT_N || compassDir == NodeGenerator.EXIT_E && dirSign.compassDir == NodeGenerator.EXIT_W || compassDir == NodeGenerator.EXIT_W && dirSign.compassDir == NodeGenerator.EXIT_E)
                  {
                     playerNewXPos = dirSign.x;
                  }
               }
               else if(obj.typeid == 22)
               {
                  dirDoorLocked = obj as Obj_DoorDungeonLocked;
                  if(compassDir == NodeGenerator.EXIT_N && dirDoorLocked.compassDir == NodeGenerator.EXIT_S || compassDir == NodeGenerator.EXIT_S && dirDoorLocked.compassDir == NodeGenerator.EXIT_N || compassDir == NodeGenerator.EXIT_E && dirDoorLocked.compassDir == NodeGenerator.EXIT_W || compassDir == NodeGenerator.EXIT_W && dirDoorLocked.compassDir == NodeGenerator.EXIT_E)
                  {
                     playerNewXPos = dirDoorLocked.x;
                  }
               }
            }
         }
         if(playerNewXPos < StatsManager.stageWidth / 2)
         {
            gameStage.setStagePosition(0);
            StatsManager.getPlayer().getMCS().faceRight();
         }
         else if(playerNewXPos >= room.getWidth() - StatsManager.stageWidth / 2)
         {
            gameStage.setStagePosition(StatsManager.stageWidth - room.getWidth());
            NPCManager.doScroll(room.getWidth() - StatsManager.stageWidth);
            StatsManager.getPlayer().getMCS().faceLeft();
         }
         else
         {
            gameStage.setStagePosition(StatsManager.stageWidth / 2 - playerNewXPos);
            NPCManager.doScroll(playerNewXPos - StatsManager.stageWidth / 2);
         }
         initPlayerRoomPosition(playerNewXPos,isReturnToRoom);
         if(roomNum == 0)
         {
            OverworldHUD.instance.showBigMap(true);
            OverworldHUD.instance.territorymap.setNodeId(currentNode);
         }
         else
         {
            OverworldHUD.instance.showBigMap(false);
            Minimap.instance.setRoomId(currentNode,roomNum,roomData);
         }
         if(room.isPvPRoom())
         {
            Territorymap.instance.y = 9.9;
            Minimap.instance.y = 9.9;
            if(StatsManager.getChatShowing())
            {
               BattleUI.instance.keepChatOpen();
            }
            else
            {
               OverworldHUD.instance.showPVPNormalMode();
            }
         }
         else
         {
            Territorymap.instance.y = 69.9;
            Minimap.instance.y = 69.9;
         }
         NetworkManager.getInstance().connectToRoom(currentNode,roomNum,room.isPrivate,playerNewXPos);
         if(leavingPvPRoomMode)
         {
            StatsManager.saveHealthAfterBattleNoRegen();
            OverworldHUD.instance.updateHpChi(StatsManager.getPlayerStats(StatsManager.STAT_HP),StatsManager.getPlayerStats(StatsManager.STAT_MAXHP),StatsManager.getPlayerStats(StatsManager.STAT_CHI),StatsManager.getPlayerStats(StatsManager.STAT_MAXCHI));
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
            OverworldHUD.instance.lootDialog.show();
            OverworldHUD.instance.clearChatLog();
         }
         if(nodeNum != -1)
         {
            oldterritory = NodeGenerator.instance.getTerritory(prevNode);
            newterritory = NodeGenerator.instance.getTerritory(nodeNum);
            if(!oldterritory.equals(newterritory))
            {
               StatsManager.saveLocation(nodeNum);
               lvldiff = NodeGenerator.instance.getNodeLevel(nodeNum) - StatsManager.getLevel();
               if(lvldiff < -3)
               {
                  OverworldHUD.instance.showDialogBig(LangManager.getString(702),LangManager.getString(5));
               }
               else if(lvldiff > 3 && nodeNum != 666)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(703),LangManager.getString(5));
               }
            }
         }
      }
      
      public static function getRoomName(roomNum:int, nodeNum:int) : String
      {
         var node:XMLWorldNode = null;
         var room:XMLRoomData = null;
         if(nodeNum == -1)
         {
            if(roomNum != -1)
            {
               room = roomData[roomNum];
            }
            if(room != null && room.getName() != "")
            {
               return room.getName();
            }
            node = QuestEngine.getNodeData(currentNode);
            return node.name;
         }
         if(roomNum == 0)
         {
            node = QuestEngine.getNodeData(nodeNum);
            return node.name;
         }
         room = QuestEngine.getNodeData(nodeNum).getRoomData()[roomNum];
         if(room == null || room.getName() == "")
         {
            return QuestEngine.getNodeData(nodeNum).name;
         }
         return room.getName();
      }
      
      public static function getRoomPrivate() : int
      {
         return roomData[currentRoom].isPrivate;
      }
      
      internal static function initPlayerRoomPosition(playerNewXPos:int, isReturnToRoom:Boolean) : *
      {
         player.addToCanvas(gameStage.getPlayerCanvas());
         if(!isReturnToRoom && playerNewXPos <= 150)
         {
            player.setPosition(50,getGroundY());
            player.walkTo(150);
         }
         else if(!isReturnToRoom && playerNewXPos >= gameStage.getGameStageWidth() - 150)
         {
            player.setPosition(gameStage.getGameStageWidth() - 50,getGroundY());
            player.walkTo(gameStage.getGameStageWidth() - 150);
         }
         else
         {
            player.setPosition(playerNewXPos,getGroundY());
            player.stopMoving();
         }
      }
      
      public static function returnToRoom() : *
      {
         gameStageType = -1;
         gotoRoom(currentRoom,returnPosX,-1,-1,true);
         overworldHUD.showAdventureModeItem();
         overworldHUD.updateHUD();
         GameEngine.placeBlockers();
      }
      
      public static function saveReturnPosX() : *
      {
         returnPosX = player.posX;
      }
      
      public static function addToDeadList(objname:String) : *
      {
         if(objname != "")
         {
            roomDeadList.push(objname);
         }
      }
      
      public static function removeDeadListLatest() : *
      {
         roomDeadList.pop();
      }
      
      public static function isInDeadList(objname:String) : *
      {
         return roomDeadList.indexOf(objname) != -1;
      }
      
      public static function isInDeadList_door(roomid:int) : Boolean
      {
         var str:String = null;
         var strArray:Array = null;
         var max:int = int(roomDeadList.length);
         for(var i:int = 0; i < max; i++)
         {
            str = roomDeadList[i];
            strArray = str.split("_");
            if(strArray.length == 3 && strArray[0] == "door" && strArray[1] == roomid.toString())
            {
               return true;
            }
         }
         return false;
      }
      
      public static function createRoomQuestObjects(nodeID:int, roomID:int) : *
      {
         var questAction:QuestAction = null;
         var roomObj:XMLList = null;
         var ypos:int = 0;
         var j:int = 0;
         var activeQuest:ActiveQuest = null;
         var data:XMLQuest = null;
         var bossxml:XMLNpc = null;
         var npcxml:XMLNpc = null;
         var questActions:Vector.<QuestAction> = QuestEngine.getCachedQuestActions();
         var max:int = int(questActions.length);
         var deadmax:int = int(roomDeadList.length);
         for(var i:int = 0; i < max; i++)
         {
            questAction = questActions[i];
            roomObj = questAction.getRoomObj();
            if(roomObj != null && roomObj.room == roomID)
            {
               for(j = 0; j < deadmax; j++)
               {
                  if(roomObj.name == roomDeadList[j])
                  {
                     return;
                  }
               }
               if(roomObj.y.toString() == "")
               {
                  ypos = getGroundY();
               }
               else
               {
                  ypos = int(roomObj.y);
               }
               if(roomObj.x == -1)
               {
                  roomObj.x = Math.random() * gameStage.getGameStageWidth();
               }
               gameStage.createRoomObject(roomObj.id,roomObj.x,ypos,roomObj.property,roomObj.name,questAction);
            }
         }
         max = int(StatsManager.activeQuestList.length);
         var date:int = QueryManager.instance.getServerDate();
         for(i = 0; i < max; i++)
         {
            activeQuest = StatsManager.activeQuestList[i];
            if(activeQuest.hasProcGenQuestAtLocation(nodeID,roomID,date))
            {
               if(activeQuest.hasStageObject())
               {
                  data = QuestGenerator.instance.generateQuest(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.questType,activeQuest.questReason,activeQuest.questGiver,activeQuest.questTargetLocation);
                  questAction = new QuestAction(data,activeQuest.step,3);
                  questAction.setProcGen(activeQuest);
                  roomObj = questAction.getRoomObj();
                  if(roomObj != null)
                  {
                     for(j = 0; j < deadmax; j++)
                     {
                        if(roomObj.name == roomDeadList[j])
                        {
                           return;
                        }
                     }
                     if(roomObj.y.toString() == "")
                     {
                        ypos = getGroundY();
                     }
                     else
                     {
                        ypos = int(roomObj.y);
                     }
                     if(roomObj.x == -1)
                     {
                        roomObj.x = Math.random() * gameStage.getGameStageWidth();
                     }
                     if(activeQuest.questType == QuestItem.QUEST_BOUNTYBOARD || activeQuest.questType == QuestItem.QUEST_KILLBANDIT)
                     {
                        bossxml = QuestGenerator.instance.getBountyTarget(activeQuest.nodeid,activeQuest.roomid,activeQuest.date);
                        QuestEngine.insertNPCData(bossxml);
                     }
                     else if(activeQuest.questType == QuestItem.QUEST_GUIDE)
                     {
                        npcxml = new XMLNpc(null);
                        npcxml.initProcGenNPC(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,true);
                        QuestEngine.insertNPCData(npcxml);
                        npcxml.id = XMLNpc.INDEX_NPCHOLDER;
                        QuestEngine.insertNPCData(npcxml);
                     }
                     gameStage.createRoomObject(roomObj.id,roomObj.x,ypos,roomObj.property,roomObj.name,questAction);
                  }
                  else
                  {
                     trace("createRoomQuestObjects error: roomObj is null");
                  }
               }
            }
         }
      }
      
      public static function refreshRoomQuestObjects() : *
      {
         NPCManager.refreshRoom(false);
         ProjectileManager.refreshRoom();
         gameStage.clearRoomObjects();
         gameStage.createRoomObjects(roomData[currentRoom].getObjectList(),roomDeadList);
         createRoomQuestObjects(currentNode,currentRoom);
         showInteractAction(StatsManager.getPlayer().getMCS());
         gameStage.getPlayerCanvas().addChild(StatsManager.getPlayer().getMCS());
         SoundManager.instance.pickMusic(roomData[currentRoom].getBG(),gameStage.hasHostile,roomData[currentRoom].isPvPRoom());
      }
      
      public static function clearRoom() : *
      {
         NPCManager.refreshRoom(true);
         ProjectileManager.refreshRoom();
         if(gameStage != null)
         {
            gameStage.clearRoomObjects();
         }
      }
      
      public static function getCurrentNode() : int
      {
         return currentNode;
      }
      
      public static function getCurrentNodeLevel() : int
      {
         return NodeGenerator.instance.getNodeLevel(currentNode);
      }
      
      public static function getCurrentRoom() : int
      {
         return currentRoom;
      }
      
      public static function disposeStage() : *
      {
         clearRoom();
         var stageMC:Stage = GameEngine.getStageMC();
         stageMC.removeChild(gameStage);
         gameStage = null;
         stageMC.removeChild(battleUI);
         stageMC.removeChild(skillUI);
         skillUI = null;
         if(duelIntroBar != null)
         {
            stageMC.removeChild(duelIntroBar);
         }
         duelIntroBar = null;
         if(battleIntroBar != null)
         {
            stageMC.removeChild(battleIntroBar);
         }
         battleIntroBar = null;
         if(overworldHUD != null)
         {
            stageMC.removeChild(overworldHUD);
         }
         overworldHUD = null;
      }
      
      public static function returnPlayerMCSToCanvas(mcs:MCSCharacter, posX:int) : *
      {
         gameStage.getPlayerCanvas().addChild(mcs);
         player.setPosition(posX + getStagePosition(),getGroundY());
      }
      
      public static function update() : *
      {
         if(screenShake)
         {
            doShake();
         }
         if(actionState != STATE_FROZEN)
         {
            InputManager.update();
            player.update();
            NPCManager.update();
            ProjectileManager.update();
            ParticleSystemManager.getInstance().update();
            if(battleUI != null)
            {
               battleUI.update();
            }
            if((action == 7 || GameEngine.isPvPRoomMode()) && !OverworldHUD.instance.screenTransition.isTransitioning())
            {
               ++interactActionCounter;
               if(interactActionCounter >= 3)
               {
                  gameStage.showInteractAction(player.getMCS());
                  interactActionCounter = 0;
               }
               gameStage.doUpdateObjectList();
            }
         }
         ++secCounter;
         if(secCounter == 24)
         {
            secCounter = 0;
            ++timeCounter;
            if(timing > 0)
            {
               battleUI.setTimerNumber(timing - timeCounter);
            }
            if(action != GameEngine.ACTION_DUEL && action != GameEngine.ACTION_ADVENTURE && timeCounter == 1)
            {
               actionState = STATE_BATTLE;
            }
            else if(action == GameEngine.ACTION_DUEL)
            {
               if(timeCounter == 1)
               {
                  NetworkManager.instance.setStance(StatsManager.stance);
               }
               else if(timeCounter == 3 && BattleUI.instance.hasLatency())
               {
                  actionState = STATE_BATTLE;
               }
            }
         }
         if(gameStage != null)
         {
            gameStage.update();
         }
         if(timing > 0 && timeCounter >= timing)
         {
            if(action == GameEngine.ACTION_ESCORT || action == GameEngine.ACTION_SURVIVE)
            {
               redFreeze();
               GameEngine.endBattleMode(true);
            }
            else if(action == GameEngine.ACTION_FIGHT || action == GameEngine.ACTION_ASSASSINATE || action == GameEngine.ACTION_REACHMARKER)
            {
               redFreeze();
               GameEngine.endBattleMode(false);
            }
            else if(action == GameEngine.ACTION_DUEL)
            {
               trace("duel time out");
            }
         }
         if(redFreezeCounter > 0)
         {
            --redFreezeCounter;
            if(!StatsManager.getPlayer().isDead())
            {
               if(redFreezeCounter == 24 * 5)
               {
                  unRedFreeze();
                  if(!GameEngine.isPlayBack())
                  {
                     battleUI.showWin();
                  }
                  else
                  {
                     battleUI.showPlaybackEnd();
                     InputManager.clearCanvas();
                  }
               }
               else if(redFreezeCounter == 24 && StatsManager.getPlayer().getMCS().getAnim() != MCSActor.SHEATHESWORDCHIBURI || redFreezeCounter == 0)
               {
                  redFreezeCounter = -2;
                  if(NetworkManager.instance.isRecording())
                  {
                     battleUI.showWinButtons();
                  }
                  GameEngine.endBattleMode(true);
               }
            }
            else if(redFreezeCounter == 24 * 3)
            {
               redFreezeCounter = -2;
               if(GameEngine.isAdventureMode())
               {
                  Stage(gameStage.parent).addChild(battleUI);
                  battleUI.visible = true;
               }
               battleUI.showLose();
               GameEngine.endBattleMode(false);
            }
         }
      }
      
      public static function isSurviveCleanUp() : Boolean
      {
         return timing > 0 && timeCounter >= timing && action == GameEngine.ACTION_SURVIVECLEANUP;
      }
      
      public static function getGameStage() : GameStage
      {
         return gameStage;
      }
      
      public static function getBattleUI() : BattleUI
      {
         return battleUI;
      }
      
      public static function getGameStageCanvas() : MovieClip
      {
         return gameStage.getPlayerCanvas();
      }
      
      public static function clearStage() : *
      {
         gameStage = null;
      }
      
      public static function getGameStageWidth() : int
      {
         return gameStage.getGameStageWidth();
      }
      
      public static function getGroundY() : int
      {
         return gameStage.groundY;
      }
      
      public static function isFlatGround() : Boolean
      {
         return gameStage.flatGround;
      }
      
      public static function setStagePosition(num:int) : *
      {
         gameStage.setStagePosition(num);
      }
      
      public static function getStagePosition() : int
      {
         return gameStage.getStagePosition();
      }
      
      public static function resetStagePosition() : *
      {
         gameStage.resetStagePosition();
      }
      
      public static function getPlayer() : MCSPlayer
      {
         return player;
      }
      
      public static function setPlayer(mcsPlayer:MCSPlayer) : *
      {
         player = mcsPlayer;
      }
      
      public static function getTiming() : int
      {
         return timing;
      }
      
      public static function getAction() : int
      {
         return action;
      }
      
      public static function setActionState(num:int) : *
      {
         actionState = num;
      }
      
      public static function isPeaceful() : Boolean
      {
         return actionState == STATE_PEACEFUL;
      }
      
      public static function isBattle() : Boolean
      {
         return actionState == STATE_BATTLE;
      }
      
      public static function scrollStage(dist:int) : *
      {
         gameStage.scrollStage(dist);
         NPCManager.doScroll(-dist);
         ProjectileManager.doScroll(-dist);
         ParticleSystemManager.getInstance().doScroll(-dist);
         gameStage.scrollRoomObjects(dist);
      }
      
      public static function keepPlayerInView() : *
      {
         var diff:int = 0;
         var newStagePos:int = 0;
         var playerMCS:MCSCharacter = StatsManager.getPlayer().mcs;
         var posX:int = StatsManager.getPlayer().getMapPosition();
         var stagePos:int = gameStage.stagePosition;
         if(posX < playerMinBounds)
         {
            newStagePos = 0;
            playerMCS.x = posX;
         }
         else if(posX > gameStage.gameStageWidth - playerMaxBounds)
         {
            newStagePos = -(gameStage.gameStageWidth - 800);
            playerMCS.x = 800 - (gameStage.gameStageWidth - posX);
         }
         else
         {
            newStagePos = 400 - posX;
            playerMCS.x = 400;
         }
         diff = newStagePos - stagePos;
         scrollStage(diff);
      }
      
      public static function isRedFreeze() : Boolean
      {
         return redFreezeCounter != -1;
      }
      
      public static function isRedFreezeWaiting() : Boolean
      {
         return redFreezeCounter > 0;
      }
      
      public static function redFreeze() : *
      {
         if(isRedFreeze())
         {
            return;
         }
         gameStage.redFreeze();
         NPCManager.redFreeze();
         if(GameEngine.isPlayBack())
         {
            StatsManager.getPlayer().getMCS().visible = false;
            InputManager.clearCanvas();
         }
         else
         {
            StatsManager.getPlayer().redFreeze();
         }
         battleUI.hideAll();
         skillUI.visible = false;
         if(action == GameEngine.ACTION_HARVEST)
         {
            redFreezeCounter = 24 * 3 + 6;
            unRedFreeze();
         }
         else
         {
            redFreezeCounter = 24 * 6;
         }
         InputManager.disableInput();
         InputManager.clearCanvas();
         ProjectileManager.redFreeze();
         ParticleSystemManager.getInstance().redFreeze();
         TutorialUI.instance.setState(0);
         StatsManager.resetCombo();
         if(GameEngine.isPvPRoomMode() || GameEngine.isAdventureMode())
         {
            gameStage.clearRoomObjects();
            OverworldHUD.instance.info.visible = false;
            OverworldHUD.instance.nodeUI.visible = false;
            Territorymap.instance.visible = false;
            Minimap.instance.visible = false;
            OverworldHUD.instance.info.mask = null;
            OverworldHUD.instance.bufftext.visible = false;
            OverworldHUD.instance.overworldHUD_ap.visible = false;
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.instance.closeOpenDialogs();
               OverworldHUD.instance.initForCutscene();
            }
         }
      }
      
      public static function initUIForPlayback() : *
      {
         battleUI.hideAll();
         skillUI.visible = false;
         battleUI.logo.visible = true;
         battleUI.logo.cacheAsBitmap = true;
      }
      
      public static function unRedFreeze() : *
      {
         NPCManager.unRedFreeze();
         player.unRedFreeze();
      }
      
      public static function clearFilter() : *
      {
         NPCManager.clearFilter();
         player.clearFilter();
      }
      
      public static function showLootDialog() : *
      {
         var lootDialog:LootDialog = overworldHUD.lootDialog;
         lootDialog.visible = true;
         var oldLevel:int = StatsManager.getLevel();
         lootDialog.show();
         var newLevel:* = StatsManager.getLevel();
         if(oldLevel < newLevel)
         {
            showLevelUpDialog(newLevel - oldLevel);
         }
      }
      
      public static function showLevelUpDialog(levelIncrease:int) : *
      {
         var levelUpDialog:LevelUpDialog = overworldHUD.levelUpDialog;
         levelUpDialog.visible = true;
         var newLevel:* = StatsManager.getLevel();
         var requiredXP:int = StatsManager.getXPLevelThreshhold(newLevel) - StatsManager.getXP();
         levelUpDialog.show(newLevel,requiredXP,levelIncrease);
         var lootDialog:LootDialog = overworldHUD.lootDialog;
         levelUpDialog.setNextDialog(lootDialog);
         lootDialog.visible = false;
      }
      
      public static function showInteractAction(mc:MovieClip) : *
      {
         gameStage.showInteractAction(mc);
      }
      
      public static function checkClickOnInteractiveObject(mouseX:int, mouseY:int) : *
      {
         gameStage.checkClickOnInteractiveObject(mouseX,mouseY);
      }
      
      public static function clearInteractTarget() : *
      {
         if(gameStage != null)
         {
            gameStage.clearInteractTarget();
         }
      }
      
      public static function hideForeground() : *
      {
         gameStage.hideForeground();
      }
      
      public static function checkMouseOver(mouseX:int, mouseY:int) : *
      {
         gameStage.checkMouseOver(mouseX,mouseY);
      }
      
      public static function startShake(shakeDuration:int, shakeAmt:int = 30) : *
      {
         screenShake = true;
         screenShakeCounter = shakeDuration;
         screenShakeAmt = shakeAmt;
         screenShakeStartPos = new Point(gameStage.x,gameStage.y);
      }
      
      internal static function doShake() : *
      {
         var shakeAmount:Number = NaN;
         --screenShakeCounter;
         if(gameStage == null)
         {
            screenShake = false;
            return;
         }
         if(screenShakeCounter == 0)
         {
            screenShake = false;
            gameStage.x = screenShakeStartPos.x;
            gameStage.y = screenShakeStartPos.y;
         }
         else
         {
            shakeAmount = Math.min(screenShakeAmt,screenShakeCounter);
            gameStage.x = screenShakeStartPos.x + (-shakeAmount / 2 + Math.random() * shakeAmount);
            gameStage.y = screenShakeStartPos.y + (-shakeAmount / 2 + Math.random() * shakeAmount);
         }
      }
   }
}

