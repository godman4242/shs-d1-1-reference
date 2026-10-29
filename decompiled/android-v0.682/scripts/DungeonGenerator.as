package
{
   public class DungeonGenerator
   {
      
      public function DungeonGenerator()
      {
         super();
      }
      
      internal function createDungeon(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1, useReturnExit:Boolean = false) : *
      {
         var chunkCount:int = 0;
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         var rng:RNG = new RNG(nodeid);
         if(nodelevel <= 10)
         {
            chunkCount = 1;
         }
         else if(nodelevel < 20)
         {
            chunkCount = 2;
         }
         else if(nodelevel < 40)
         {
            chunkCount = 3;
         }
         else if(nodelevel < 60)
         {
            chunkCount = 4;
         }
         else
         {
            chunkCount = 5;
         }
         var roomArray:Array = new Array();
         var colorArray:Array = new Array();
         for(var i:int = 0; i < chunkCount; i++)
         {
            colorArray.push(rng.rand(16777215));
         }
         var bgArray:Array = new Array();
         for(i = 0; i < chunkCount; i++)
         {
            if(theme == NodeGenerator.THEME_UNDEAD || theme == NodeGenerator.THEME_CULTIST_UNDEAD)
            {
               bgArray.push(GameStage.BG_DUNGEON_FOG);
            }
            else
            {
               bgArray.push(GameStage.BG_DUNGEON);
            }
         }
         var bg:int = int(bgArray[0]);
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,colorArray[0]);
         var exitRoom:String = "-1";
         if(useReturnExit)
         {
            exitRoom = "-2";
            startDir = NodeGenerator.EXIT_E;
         }
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,exitRoom + "," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,exitRoom + "," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,colorArray[0]);
         var prevdice:int = -1;
         var hasGate:Boolean = false;
         for(i = 0; i < chunkCount; i++)
         {
            if(i == 0 || nodelevel > StatsManager.levelCap - 5)
            {
               dice = rng.rand(3);
            }
            else
            {
               dice = rng.rand(4);
            }
            if(prevdice == dice)
            {
               dice = rng.rand(4);
            }
            prevdice = dice;
            if(hasGate)
            {
               dice = rng.rand(3);
               if(dice == 2)
               {
                  dice = 3;
               }
            }
            if(dice == 2)
            {
               hasGate = true;
            }
            bg = int(bgArray[i]);
            if(dice == 0)
            {
               index = this.createRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 1)
            {
               index = this.createDungeonParallelChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 2)
            {
               index = this.createDungeonBackTrackChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 3)
            {
               index = this.createDungeonForkChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
         }
         roomArray[index].setRoomType(RoomGenNode.ROOM_BOSS,colorArray[chunkCount - 1]);
         if(useReturnExit)
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_RETURNEXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         }
         else
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         }
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createTempleDungeon(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1, useReturnExit:Boolean = false) : *
      {
         var chunkCount:int = 0;
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         var rng:RNG = new RNG(nodeid);
         if(nodelevel <= 10)
         {
            chunkCount = 1;
         }
         else if(nodelevel <= 20)
         {
            chunkCount = 2;
         }
         else if(nodelevel <= 40)
         {
            chunkCount = 3;
         }
         else if(nodelevel <= 60)
         {
            chunkCount = 4;
         }
         else
         {
            chunkCount = 5;
         }
         var roomArray:Array = new Array();
         var colorArray:Array = new Array();
         for(var i:int = 0; i < chunkCount; i++)
         {
            colorArray.push(rng.rand(16777215));
         }
         var bgArray:Array = new Array();
         bgArray.push(GameStage.BG_TEMPLEINTERIOR2);
         for(i = 1; i < chunkCount; i++)
         {
            bgArray.push(GameStage.BG_DUNGEON);
         }
         var bg:int = int(bgArray[0]);
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,colorArray[0]);
         var exitRoom:String = "-1";
         if(useReturnExit)
         {
            exitRoom = "-2";
            startDir = NodeGenerator.EXIT_E;
         }
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,exitRoom + "," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,exitRoom + "," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,colorArray[0]);
         for(i = 0; i < chunkCount; i++)
         {
            dice = rng.rand(4);
            bg = int(bgArray[i]);
            if(i == 0)
            {
               index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel);
            }
            else if(dice == 0)
            {
               index = this.createRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 1)
            {
               index = this.createDungeonParallelChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 2)
            {
               index = this.createDungeonBackTrackChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 3)
            {
               index = this.createDungeonForkChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
         }
         roomArray[index].setRoomType(RoomGenNode.ROOM_BOSS,colorArray[chunkCount - 1]);
         if(useReturnExit)
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_RETURNEXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         }
         else
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         }
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createMine(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var chunkCount:int = 0;
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         var rng:RNG = new RNG(nodeid);
         if(nodelevel <= 10)
         {
            chunkCount = 1 + rng.rand(2);
         }
         else if(nodelevel <= 20)
         {
            chunkCount = 2;
         }
         else if(nodelevel <= 40)
         {
            chunkCount = 3;
         }
         else if(nodelevel <= 60)
         {
            chunkCount = 4;
         }
         else
         {
            chunkCount = 5;
         }
         var roomArray:Array = new Array();
         var colorArray:Array = new Array();
         for(var i:int = 0; i < chunkCount; i++)
         {
            colorArray.push(0);
         }
         var bgArray:Array = new Array();
         for(i = 0; i < chunkCount; i++)
         {
            if(i == 0 || i == chunkCount - 1)
            {
               bgArray.push(GameStage.BG_MINE);
            }
            else
            {
               dice = rng.rand(7);
               if(dice == 0)
               {
                  bgArray.push(GameStage.BG_MINE);
               }
               else if(dice == 1)
               {
                  bgArray.push(GameStage.BG_CAVE);
               }
               else if(dice == 2)
               {
                  bgArray.push(GameStage.BG_CAVELAKE);
               }
               else if(dice == 3)
               {
                  bgArray.push(GameStage.BG_CAVELAVA);
               }
               else
               {
                  bgArray.push(GameStage.BG_MINE);
               }
            }
         }
         var bg:int = int(bgArray[0]);
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,colorArray[0]);
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,colorArray[0]);
         for(i = 0; i < chunkCount; i++)
         {
            bg = int(bgArray[i]);
            if(bg == GameStage.BG_MINE)
            {
               if(i == 0 || nodelevel > StatsManager.levelCap - 5)
               {
                  dice = rng.rand(3);
               }
               else
               {
                  dice = rng.rand(4);
               }
               if(dice == 0)
               {
                  index = this.createRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
               else if(dice == 1)
               {
                  index = this.createDungeonParallelChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
               else if(dice == 2)
               {
                  index = this.createDungeonBackTrackChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
               else if(dice == 3)
               {
                  index = this.createDungeonForkChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
            }
            else if(bg == GameStage.BG_CAVE || bg == GameStage.BG_CAVELAKE || bg == GameStage.BG_CAVELAVA)
            {
               index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
         }
         roomArray[index].setRoomType(RoomGenNode.ROOM_BOSS,colorArray[chunkCount - 1]);
         this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createRuins(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var chunkCount:int = 0;
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         var rng:RNG = new RNG(nodeid);
         if(nodelevel <= 10)
         {
            chunkCount = 1 + rng.rand(2);
         }
         else if(nodelevel <= 20)
         {
            chunkCount = 2;
         }
         else if(nodelevel <= 40)
         {
            chunkCount = 3;
         }
         else if(nodelevel <= 60)
         {
            chunkCount = 4;
         }
         else
         {
            chunkCount = 5;
         }
         var roomArray:Array = new Array();
         var colorArray:Array = new Array();
         for(var i:int = 0; i < chunkCount; i++)
         {
            colorArray.push(0);
         }
         var bgArray:Array = new Array();
         for(i = 0; i < chunkCount; i++)
         {
            if(i == 0 || i == chunkCount - 1)
            {
               bgArray.push(GameStage.BG_ANCIENTRUINS);
            }
            else
            {
               dice = rng.rand(7);
               if(dice == 0)
               {
                  bgArray.push(GameStage.BG_ANCIENTRUINS);
               }
               else if(dice == 1)
               {
                  bgArray.push(GameStage.BG_CAVE);
               }
               else if(dice == 2)
               {
                  bgArray.push(GameStage.BG_CAVELAKE);
               }
               else if(dice == 3)
               {
                  bgArray.push(GameStage.BG_CAVELAVA);
               }
               else
               {
                  bgArray.push(GameStage.BG_ANCIENTRUINS);
               }
            }
         }
         var bg:int = int(bgArray[0]);
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,colorArray[0]);
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,colorArray[0]);
         for(i = 0; i < chunkCount; i++)
         {
            bg = int(bgArray[i]);
            if(bg == GameStage.BG_ANCIENTRUINS)
            {
               if(i == 0 || nodelevel > StatsManager.levelCap - 5)
               {
                  dice = rng.rand(3);
               }
               else
               {
                  dice = rng.rand(4);
               }
               if(dice == 0)
               {
                  index = this.createRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
               else if(dice == 1)
               {
                  index = this.createDungeonParallelChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
               else if(dice == 2)
               {
                  index = this.createDungeonBackTrackChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
               else if(dice == 3)
               {
                  index = this.createDungeonForkChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
               }
            }
            else if(bg == GameStage.BG_CAVE || bg == GameStage.BG_CAVELAKE || bg == GameStage.BG_CAVELAVA)
            {
               index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
         }
         roomArray[index].setRoomType(RoomGenNode.ROOM_BOSS,colorArray[chunkCount - 1]);
         this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createCave(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var chunkCount:int = 0;
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         var rng:RNG = new RNG(nodeid);
         if(nodelevel <= 10)
         {
            chunkCount = 1 + rng.rand(2);
         }
         else if(nodelevel <= 20)
         {
            chunkCount = 2;
         }
         else if(nodelevel <= 40)
         {
            chunkCount = 3;
         }
         else if(nodelevel <= 60)
         {
            chunkCount = 4;
         }
         else
         {
            chunkCount = 5;
         }
         var roomArray:Array = new Array();
         var colorArray:Array = new Array();
         for(var i:int = 0; i < chunkCount; i++)
         {
            colorArray.push(0);
         }
         var bgArray:Array = [GameStage.BG_CAVE,GameStage.BG_CAVE,GameStage.BG_CAVELAKE,GameStage.BG_CAVELAKE,GameStage.BG_CAVELAVA,GameStage.BG_CAVELAVA];
         var bg:int = int(bgArray[0]);
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,colorArray[0]);
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,colorArray[0]);
         for(i = 0; i < chunkCount; i++)
         {
            index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
         }
         roomArray[index].setRoomType(RoomGenNode.ROOM_BOSS,colorArray[chunkCount - 1]);
         this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createOniDen(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         this.createCave(signXPos,nodeid,nodelevel,startDir,roomDataVector,NodeGenerator.THEME_ONI);
      }
      
      internal function createForestRoute(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1, useReturnExit:Boolean = false) : *
      {
         var chunkCount:int = 0;
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         startDir = NodeGenerator.EXIT_E;
         var rng:RNG = new RNG(nodeid);
         if(nodelevel <= 10)
         {
            chunkCount = 2 + rng.rand(2);
         }
         else if(nodelevel < 20)
         {
            chunkCount = 3;
         }
         else if(nodelevel < 40)
         {
            chunkCount = 4;
         }
         else if(nodelevel < 60)
         {
            chunkCount = 5;
         }
         else
         {
            chunkCount = 6;
         }
         var roomArray:Array = new Array();
         var bgArray:Array = [GameStage.BG_FOREST,GameStage.BG_FOREST2,GameStage.BG_FOREST3,GameStage.BG_FOREST4];
         if(theme == NodeGenerator.THEME_UNDEAD)
         {
            bgArray = [GameStage.BG_FORESTSPOOKY];
         }
         var bg:int = int(bgArray[0]);
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE);
         var exitRoom:String = "-1";
         if(useReturnExit)
         {
            exitRoom = "-2";
         }
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,exitRoom + "," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,exitRoom + "," + signXPos,"signpost");
         }
         bg = int(bgArray[rng.rand(bgArray.length)]);
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true);
         for(var i:int = 0; i < chunkCount; i++)
         {
            index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel);
         }
         if(useReturnExit)
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_RETURNEXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true);
         }
         else
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true);
         }
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createAnimalCave(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var roomGenNode:RoomGenNode = null;
         var roomArray:Array = new Array();
         var rng:RNG = new RNG(nodeid);
         var bg:int = GameStage.BG_CAVE;
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,0);
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,0);
         this.createRoute(index,nodeid,bg,2,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,false,0);
         if(theme == -1)
         {
            theme = rng.rand(3);
            if(theme == 0)
            {
               theme = NodeGenerator.THEME_BANDIT;
            }
            else if(theme == 1)
            {
               theme = NodeGenerator.THEME_WOLF;
            }
            else if(theme == 2)
            {
               theme = NodeGenerator.THEME_BEAR;
            }
         }
         var max:int = int(roomArray.length);
         for(var i:int = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createJinmaku(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1, useReturnExit:Boolean = false) : *
      {
         var dice:int = 0;
         var roomGenNode:RoomGenNode = null;
         var rng:RNG = new RNG(nodeid);
         var chunkCount:int = 4;
         var roomArray:Array = new Array();
         var colorArray:Array = new Array();
         for(var i:int = 0; i < chunkCount; i++)
         {
            colorArray.push(0);
         }
         var bg:int = GameStage.BG_JINMAKU;
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,colorArray[0]);
         var exitRoom:String = "-1";
         if(useReturnExit)
         {
            exitRoom = "-2";
            startDir = NodeGenerator.EXIT_E;
         }
         if(useReturnExit || startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,exitRoom + "," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,exitRoom + "," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,null,null,startDir,true,colorArray[0]);
         for(i = 0; i < chunkCount; i++)
         {
            if(i == 0 || nodelevel > StatsManager.levelCap - 5)
            {
               dice = rng.rand(2);
            }
            else
            {
               dice = rng.rand(3);
            }
            if(dice == 0)
            {
               index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 1)
            {
               index = this.createDungeonParallelChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
            else if(dice == 2)
            {
               index = this.createDungeonForkChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
            }
         }
         roomArray[index].setRoomType(RoomGenNode.ROOM_BOSS,colorArray[chunkCount - 1]);
         if(theme == NodeGenerator.THEME_CLANPURPLE && nodeid == 8685589)
         {
            bg = GameStage.BG_JINMAKU_NIGHT;
         }
         index = this.createDungeonNoLockRouteChunk(index,nodeid,bg,rng,startDir,roomArray,nodelevel,colorArray[i],colorArray[i + 1]);
         if(useReturnExit)
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_RETURNEXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         }
         else
         {
            this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_EXIT,RoomGenNode.ROOM_MINION,roomArray,null,null,-1,false,colorArray[chunkCount - 1]);
         }
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_CLANPURPLE;
         }
         var max:int = int(roomArray.length);
         for(i = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            if(theme == NodeGenerator.THEME_CLANPURPLE)
            {
               roomGenNode.bgParam = 6;
            }
            else
            {
               roomGenNode.isPrivate = XMLRoomData.ROOMTYPE_PVPCLAN;
            }
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createNinjaVillage(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var lastDir:int = 0;
         var village:int = 0;
         var roomGenNode:RoomGenNode = null;
         startDir = NodeGenerator.EXIT_N;
         var roomArray:Array = new Array();
         var rng:RNG = new RNG(nodeid);
         var bg:int = GameStage.BG_DENSEFOREST;
         var route1:int = 5 + rng.rand(4);
         var route2:int = 4 + rng.rand(3);
         var villageRoute:int = 2;
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,0);
         roomArray[index].roomName = "Ninja Trail";
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"0," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"0," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_NINJATRAIL,RoomGenNode.ROOM_NINJATRAIL,roomArray,null,null,startDir,true);
         var villagePt:int = this.createRoute(index,nodeid,bg,route1,rng,RoomGenNode.ROOM_NINJAVILLAGEENTRANCE,RoomGenNode.ROOM_NINJATRAIL,roomArray,null,null,startDir);
         var enterFrom:int = int(roomArray[villagePt].getEnterFrom());
         if(enterFrom == NodeGenerator.EXIT_S)
         {
            lastDir = NodeGenerator.EXIT_N;
         }
         else if(enterFrom == NodeGenerator.EXIT_N)
         {
            lastDir = NodeGenerator.EXIT_S;
         }
         else if(enterFrom == NodeGenerator.EXIT_E)
         {
            lastDir = NodeGenerator.EXIT_W;
         }
         else if(enterFrom == NodeGenerator.EXIT_W)
         {
            lastDir = NodeGenerator.EXIT_E;
         }
         var pt:int = this.createRoute(villagePt,nodeid,bg,1,rng,RoomGenNode.ROOM_NINJATRAIL,RoomGenNode.ROOM_NINJATRAIL,roomArray,null,null,lastDir,true);
         pt = this.createRoute(pt,nodeid,bg,route2 - 1,rng,RoomGenNode.ROOM_NINJATRAILEXIT,RoomGenNode.ROOM_NINJATRAIL,roomArray,null,null,lastDir);
         roomArray[pt].roomName = "Ninja Trail";
         if(roomArray[villagePt].getIsNSOrientation())
         {
            this.createRoute(villagePt,nodeid,bg,villageRoute,rng,RoomGenNode.ROOM_NINJAVILLAGE,RoomGenNode.ROOM_NINJAVILLAGE,roomArray,null,null,NodeGenerator.EXIT_W,true);
         }
         else
         {
            this.createRoute(villagePt,nodeid,bg,villageRoute,rng,RoomGenNode.ROOM_NINJAVILLAGE,RoomGenNode.ROOM_NINJAVILLAGE,roomArray,null,null,NodeGenerator.EXIT_N,true);
         }
         var max:int = int(roomArray.length);
         for(var i:int = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            theme = rng.rand(2);
            if(theme == 0)
            {
               theme = NodeGenerator.THEME_ONI;
            }
            else if(theme == 1)
            {
               theme = NodeGenerator.THEME_WOLF;
            }
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createNinjaTrail(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var roomGenNode:RoomGenNode = null;
         startDir = NodeGenerator.EXIT_N;
         var roomArray:Array = new Array();
         var rng:RNG = new RNG(nodeid);
         var bg:int = GameStage.BG_DENSEFOREST;
         var route1:int = 5 + rng.rand(4);
         var route2:int = 4 + rng.rand(3);
         var villageRoute:int = 2;
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,0);
         roomArray[index].roomName = "Ninja Trail";
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"0," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"0," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_NINJATRAIL,RoomGenNode.ROOM_NINJATRAIL,roomArray,null,null,startDir,true);
         this.createRoute(index,nodeid,bg,route1,rng,RoomGenNode.ROOM_NINJATRAILEXIT,RoomGenNode.ROOM_NINJATRAIL,roomArray,null,null,startDir);
         var max:int = int(roomArray.length);
         for(var i:int = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            theme = rng.rand(2);
            if(theme == 0)
            {
               theme = NodeGenerator.THEME_ONI;
            }
            else if(theme == 1)
            {
               theme = NodeGenerator.THEME_WOLF;
            }
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createTemple(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var roomGenNode:RoomGenNode = null;
         startDir = NodeGenerator.EXIT_E;
         var roomArray:Array = new Array();
         var rng:RNG = new RNG(nodeid);
         var bg:int = GameStage.BG_TEMPLEINTERIOR;
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_ENTRANCE,0);
         roomArray[index].roomName = "Temple Entrance";
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_CORRIDOR,RoomGenNode.ROOM_CORRIDOR,roomArray,null,null,startDir,true,0);
         this.createRoute(index,nodeid,bg,2,rng,RoomGenNode.ROOM_CORRIDOR,RoomGenNode.ROOM_CORRIDOR,roomArray,null,null,startDir,true);
         theme = NodeGenerator.THEME_TEMPLE;
         var max:int = int(roomArray.length);
         for(var i:int = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createDojo(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, theme:int = -1) : *
      {
         var roomGenNode:RoomGenNode = null;
         startDir = NodeGenerator.EXIT_W;
         var roomArray:Array = new Array();
         var rng:RNG = new RNG(nodeid);
         var bg:int = GameStage.BG_DOJO;
         var index:int = 1;
         roomGenNode = new RoomGenNode(0,1,bg,nodeid);
         roomGenNode.setRoomType(RoomGenNode.ROOM_ENTRANCE,0);
         roomGenNode.roomName = LangManager.getString(3003);
         roomGenNode.roomWidth = 800;
         roomGenNode.isPrivate = XMLRoomData.ROOMTYPE_DOJO;
         roomGenNode.addObject(1,600,"1024","textsign");
         roomArray[index] = roomGenNode;
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         this.createRoute(index,nodeid,bg,3,rng,RoomGenNode.ROOM_CORRIDOR,RoomGenNode.ROOM_CORRIDOR,roomArray,null,null,startDir,true);
         roomGenNode = roomArray[++index];
         roomGenNode.roomName = LangManager.getString(3005);
         roomGenNode.isPrivate = XMLRoomData.ROOMTYPE_DOJO;
         roomGenNode.roomWidth = 1670;
         roomGenNode.addObject(7,850,"door1","switch1");
         roomGenNode.addObject(1,857,"3015","sign1");
         roomGenNode.addObject(8,857,"0,4,150","door1");
         roomGenNode = new RoomGenNode(0,4,bg,nodeid);
         roomArray[4] = roomGenNode;
         roomGenNode.roomWidth = 800;
         roomGenNode.bg = GameStage.BG_DOJO;
         roomGenNode.setRoomType(RoomGenNode.ROOM_TRAPEASY);
         roomGenNode.addObject(0,50,"2,1250","sexit");
         roomGenNode.addObject(1,150,"1036","textsign");
         var traproomIndex:int = this.createRoute(4,nodeid,bg,3,rng,RoomGenNode.ROOM_TRAP,RoomGenNode.ROOM_TRAPEASY,roomArray,null,null,NodeGenerator.EXIT_N,true);
         traproomIndex = this.createRoute(traproomIndex,nodeid,bg,2,rng,RoomGenNode.ROOM_TRAPMEDIUM,RoomGenNode.ROOM_TRAPMEDIUM,roomArray,null,null,NodeGenerator.EXIT_N,true);
         traproomIndex = this.createRoute(traproomIndex,nodeid,bg,3,rng,RoomGenNode.ROOM_TRAPHARD,RoomGenNode.ROOM_TRAPHARD,roomArray,null,null,NodeGenerator.EXIT_N,true);
         traproomIndex = this.createRoute(traproomIndex,nodeid,bg,6,rng,RoomGenNode.ROOM_TRAPVERYHARD,RoomGenNode.ROOM_TRAPVERYHARD,roomArray,null,null,NodeGenerator.EXIT_N,true);
         traproomIndex = this.createRoute(traproomIndex,nodeid,bg,2,rng,RoomGenNode.ROOM_CORRIDOR,RoomGenNode.ROOM_CORRIDOR,roomArray,null,null,NodeGenerator.EXIT_N,true);
         roomGenNode = roomArray[traproomIndex];
         roomGenNode.roomWidth = 800;
         roomGenNode.addObject(19,650,StatsManager.getLevel() + ",0,30020","goodlootchest");
         roomGenNode.addObject(0,750,"2,1250","sexit");
         roomGenNode = roomArray[++index];
         roomGenNode.bg = GameStage.BG_DOJO2;
         roomGenNode.roomName = LangManager.getString(3004);
         roomGenNode.isPrivate = XMLRoomData.ROOMTYPE_PVPDOJO;
         roomGenNode.roomWidth = 1670;
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_DOJO;
         }
         var max:int = int(roomArray.length);
         for(var i:int = 1; i < max; i++)
         {
            roomGenNode = roomArray[i];
            roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
            roomDataVector[i] = roomGenNode.output();
         }
      }
      
      internal function createHut(signXPos:int, nodeid:int, nodelevel:int, roomDataVector:Array, theme:int = -1) : *
      {
         var roomGenNode:RoomGenNode = new RoomGenNode(0,1,GameStage.BG_HUTINSIDE,nodeid);
         var rng:RNG = new RNG(nodeid);
         roomGenNode.setRoomType(RoomGenNode.ROOM_EMPTY);
         roomGenNode.roomWidth = 800;
         roomGenNode.roomName = "Hut";
         roomGenNode.addObject(0,400,"-1," + signXPos + ",-1,0","signpost");
         if(rng.rand(3) == 0)
         {
            roomGenNode.addObject(23,rng.rand(roomGenNode.roomWidth),"0","procgennpc");
         }
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
         roomDataVector[roomGenNode.roomid] = roomGenNode.output();
      }
      
      internal function createRoute(index:int, nodeid:int, bg:int, steps:int, rng:RNG, endRoomType:int, midRoomType:int, roomArray:Array, roomTypeList:Array, junctionList:Array, lastDir:int, fixedDirection:Boolean = false, color:int = 0) : int
      {
         var dir:int = 0;
         if(bg != GameStage.BG_DUNGEON && bg != GameStage.BG_DUNGEON_FOG)
         {
            color = 0;
         }
         if(fixedDirection && lastDir != -1)
         {
            dir = lastDir;
         }
         else
         {
            if(lastDir != -1)
            {
               dir = rng.rand(5);
            }
            else
            {
               dir = rng.rand(4);
            }
            if(dir == 4)
            {
               dir = lastDir;
            }
         }
         var roomGenNode:RoomGenNode = roomArray[index];
         if(Boolean(roomGenNode.hasExit(dir)) && roomGenNode.getTotalExits() == 4)
         {
            return -1;
         }
         while(roomGenNode.hasExit(dir))
         {
            if(++dir == 4)
            {
               dir = 0;
            }
         }
         var nextIndex:int = int(roomArray.length);
         roomGenNode.addExit(dir,nextIndex);
         var nextRoomGenNode:RoomGenNode = new RoomGenNode(0,nextIndex,bg,nodeid);
         roomArray[nextIndex] = nextRoomGenNode;
         nextRoomGenNode.addExitFrom(dir,index);
         steps--;
         if(steps <= 1)
         {
            nextRoomGenNode.setRoomType(endRoomType,color);
            if(roomTypeList != null)
            {
               roomTypeList[endRoomType].push(nextIndex);
            }
            if(junctionList != null && endRoomType == RoomGenNode.ROOM_MINION)
            {
               junctionList.push(nextIndex);
            }
            return nextIndex;
         }
         nextRoomGenNode.setRoomType(midRoomType,color);
         if(roomTypeList != null)
         {
            roomTypeList[midRoomType].push(nextIndex);
         }
         if(junctionList != null && midRoomType == RoomGenNode.ROOM_MINION)
         {
            junctionList.push(nextIndex);
         }
         return this.createRoute(nextIndex,nodeid,bg,steps,rng,endRoomType,midRoomType,roomArray,roomTypeList,junctionList,dir,fixedDirection,color);
      }
      
      internal function initRoomTypeList() : Array
      {
         var roomTypeList:* = new Array(RoomGenNode.TOTALROOMTYPES);
         for(var i:int = 0; i < RoomGenNode.TOTALROOMTYPES; i++)
         {
            roomTypeList[i] = new Array();
         }
         return roomTypeList;
      }
      
      internal function createRouteChunk(index:int, nodeid:int, bg:int, rng:RNG, startDir:int, roomArray:Array, level:int, color:int, color2:int) : int
      {
         var pt:int = 0;
         var output:int = 0;
         var i:int = 0;
         var enterFrom:int = int(roomArray[index].getEnterFrom());
         if(enterFrom == NodeGenerator.EXIT_N)
         {
            startDir = NodeGenerator.EXIT_S;
         }
         else if(enterFrom == NodeGenerator.EXIT_S)
         {
            startDir = NodeGenerator.EXIT_N;
         }
         else if(enterFrom == NodeGenerator.EXIT_E)
         {
            startDir = NodeGenerator.EXIT_W;
         }
         else if(enterFrom == NodeGenerator.EXIT_W)
         {
            startDir = NodeGenerator.EXIT_E;
         }
         var levelfactor:int = Math.ceil(level / 20);
         var bossRoute:int = 3 + rng.rand(levelfactor);
         var keyRoute:int = 2;
         var lootRoute:int = 2;
         var lootCount:int = 1 + rng.rand(levelfactor);
         var roomTypeList:Array = this.initRoomTypeList();
         var junctionList:Array = new Array();
         pt = this.createRoute(index,nodeid,bg,bossRoute,rng,RoomGenNode.ROOM_LOCK,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,false,color);
         var lock:int = pt;
         if(roomArray[pt].getIsNSOrientation())
         {
            output = this.createRoute(pt,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,NodeGenerator.EXIT_W,true,color2);
         }
         else
         {
            output = this.createRoute(pt,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,NodeGenerator.EXIT_N,true,color2);
         }
         if(roomTypeList[RoomGenNode.ROOM_MINION].length > 0)
         {
            pt = int(junctionList[rng.rand(junctionList.length)]);
            this.createRoute(pt,nodeid,bg,1 + rng.rand(keyRoute),rng,RoomGenNode.ROOM_KEY,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,-1,false,color);
         }
         else
         {
            roomArray[lock].setRoomType(RoomGenNode.ROOM_MINION);
         }
         if(junctionList.length > 0)
         {
            for(i = 0; i < lootCount; i++)
            {
               pt = int(junctionList[rng.rand(junctionList.length)]);
               this.createRoute(pt,nodeid,bg,1 + rng.rand(lootRoute),rng,RoomGenNode.ROOM_LOOT,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,-1,false,color);
            }
         }
         return output;
      }
      
      internal function createDungeonNoLockRouteChunk(index:int, nodeid:int, bg:int, rng:RNG, startDir:int, roomArray:Array, level:int, color:int = 0, color2:int = 0, noLoot:Boolean = false) : int
      {
         var pt:int = 0;
         var i:int = 0;
         var enterFrom:int = int(roomArray[index].getEnterFrom());
         if(enterFrom == NodeGenerator.EXIT_N)
         {
            startDir = NodeGenerator.EXIT_S;
         }
         else if(enterFrom == NodeGenerator.EXIT_S)
         {
            startDir = NodeGenerator.EXIT_N;
         }
         else if(enterFrom == NodeGenerator.EXIT_E)
         {
            startDir = NodeGenerator.EXIT_W;
         }
         else if(enterFrom == NodeGenerator.EXIT_W)
         {
            startDir = NodeGenerator.EXIT_E;
         }
         var levelfactor:int = Math.ceil(level / 20);
         var route:int = 3 + rng.rand(levelfactor);
         var lootRoute:int = 2;
         var lootCount:int = 1 + rng.rand(levelfactor);
         var roomTypeList:Array = this.initRoomTypeList();
         var junctionList:Array = new Array();
         var output:int = this.createRoute(index,nodeid,bg,route,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,false,color);
         if(junctionList.length > 0 && !noLoot)
         {
            for(i = 0; i < lootCount; i++)
            {
               pt = int(junctionList[rng.rand(junctionList.length)]);
               this.createRoute(pt,nodeid,bg,1 + rng.rand(lootRoute),rng,RoomGenNode.ROOM_LOOT,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,-1,false,color);
            }
         }
         return output;
      }
      
      internal function createDungeonParallelChunk(index:int, nodeid:int, bg:int, rng:RNG, startDir:int, roomArray:Array, level:int, color:int, color2:int) : int
      {
         var pt:int = 0;
         var loopstartpt:int = 0;
         var endPt:int = 0;
         var i:int = 0;
         var levelfactor:int = Math.ceil(level / 20);
         var route:int = 3;
         if(level >= 40)
         {
            route = 3 + rng.rand(2);
         }
         var lootRoute:int = 2;
         var lootCount:int = 1;
         var roomTypeList:Array = this.initRoomTypeList();
         var junctionList:Array = new Array();
         if(startDir == NodeGenerator.EXIT_E || startDir == NodeGenerator.EXIT_W)
         {
            loopstartpt = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
            pt = this.createRoute(loopstartpt,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,NodeGenerator.EXIT_N,true,color);
            pt = this.createRoute(pt,nodeid,bg,route,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
            endPt = this.createRoute(pt,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,NodeGenerator.EXIT_S,true,color);
            pt = this.createRoute(loopstartpt,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,NodeGenerator.EXIT_S,true,color);
            pt = this.createRoute(pt,nodeid,bg,route,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
            roomArray[pt].addExit(NodeGenerator.EXIT_N,endPt);
            roomArray[endPt].addExitFrom(NodeGenerator.EXIT_N,pt);
         }
         else
         {
            loopstartpt = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
            pt = this.createRoute(loopstartpt,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,NodeGenerator.EXIT_E,true,color);
            pt = this.createRoute(pt,nodeid,bg,route,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
            endPt = this.createRoute(pt,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,NodeGenerator.EXIT_W,true,color);
            pt = this.createRoute(loopstartpt,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,NodeGenerator.EXIT_W,true,color);
            pt = this.createRoute(pt,nodeid,bg,route,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
            roomArray[pt].addExit(NodeGenerator.EXIT_E,endPt);
            roomArray[endPt].addExitFrom(NodeGenerator.EXIT_E,pt);
         }
         endPt = this.createRoute(endPt,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,startDir,true,color);
         if(junctionList.length > 0)
         {
            for(i = 0; i < lootCount; i++)
            {
               pt = int(junctionList[rng.rand(junctionList.length)]);
               this.createRoute(pt,nodeid,bg,1 + rng.rand(lootRoute),rng,RoomGenNode.ROOM_LOOT,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,-1,false,color);
            }
         }
         return endPt;
      }
      
      internal function createDungeonForkChunk(index:int, nodeid:int, bg:int, rng:RNG, startDir:int, roomArray:Array, level:int, color:int, color2:int) : int
      {
         var pt:int = 0;
         var endPt1:int = 0;
         var endPt2:int = 0;
         var output:int = 0;
         var i:int = 0;
         var levelfactor:int = Math.ceil(level / 20);
         var route:int = 3;
         if(level >= 40)
         {
            route = 3 + rng.rand(2);
         }
         var lootRoute:int = 2;
         var lootCount:int = 1;
         var roomTypeList:Array = this.initRoomTypeList();
         var junctionList:Array = new Array();
         pt = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,true,color);
         endPt1 = this.createRoute(pt,nodeid,bg,route,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,-1,true,color);
         endPt2 = this.createRoute(pt,nodeid,bg,route,rng,RoomGenNode.ROOM_MINION,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,-1,true,color);
         if(rng.rand(2) == 0)
         {
            output = this.createRoute(endPt1,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,startDir,true,color);
            this.createRoute(endPt2,nodeid,bg,1,rng,RoomGenNode.ROOM_TREASURE,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,startDir,true,color);
         }
         else
         {
            output = this.createRoute(endPt2,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,startDir,true,color);
            this.createRoute(endPt1,nodeid,bg,1,rng,RoomGenNode.ROOM_TREASURE,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,startDir,true,color);
         }
         if(junctionList.length > 0)
         {
            for(i = 0; i < lootCount; i++)
            {
               pt = int(junctionList[rng.rand(junctionList.length)]);
               this.createRoute(pt,nodeid,bg,1 + rng.rand(lootRoute),rng,RoomGenNode.ROOM_LOOT,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,-1,false,color);
            }
         }
         return output;
      }
      
      internal function createDungeonBackTrackChunk(index:int, nodeid:int, bg:int, rng:RNG, startDir:int, roomArray:Array, level:int, color:int, color2:int) : int
      {
         var pt:int = 0;
         var output:int = 0;
         var leveroutput:int = 0;
         var levelfactor:int = Math.ceil(level / 20);
         var route:int = 5 + rng.rand(levelfactor);
         var subroute:int = 3;
         var subroutecount:int = 2;
         var lootRoute:int = 2;
         var lootCount:int = 1 + rng.rand(levelfactor);
         var roomTypeList:Array = this.initRoomTypeList();
         var junctionList:Array = new Array();
         this.createRoute(index,nodeid,bg,route,rng,RoomGenNode.ROOM_LEVER,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,startDir,false,color);
         pt = int(junctionList[rng.rand(junctionList.length)]);
         var lockpt:int = this.createRoute(pt,nodeid,bg,subroute,rng,RoomGenNode.ROOM_LOCKEDGATE,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,-1,false,color);
         if(roomArray[lockpt].getIsNSOrientation())
         {
            output = this.createRoute(lockpt,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,NodeGenerator.EXIT_W,true,color2);
         }
         else
         {
            output = this.createRoute(lockpt,nodeid,bg,1,rng,RoomGenNode.ROOM_SUBBOSS,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,NodeGenerator.EXIT_N,true,color2);
         }
         var loopcount:int = 0;
         var totalLevers:int = 1;
         for(var i:* = 0; i < subroutecount - 1; i++)
         {
            pt = int(junctionList[rng.rand(junctionList.length)]);
            leveroutput = this.createRoute(pt,nodeid,bg,subroute + rng.rand(2),rng,RoomGenNode.ROOM_LEVER,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,junctionList,-1,false,color);
            if(leveroutput == -1)
            {
               i--;
               if(++loopcount > junctionList.length)
               {
                  roomArray[pt].setRoomType(RoomGenNode.ROOM_LEVER);
                  totalLevers++;
                  break;
               }
            }
            else
            {
               totalLevers++;
            }
         }
         if(totalLevers < 2)
         {
            roomArray[lockpt].setRoomType(RoomGenNode.ROOM_MINION);
         }
         if(junctionList.length > 0)
         {
            for(i = 0; i < lootCount; i++)
            {
               pt = int(junctionList[rng.rand(junctionList.length)]);
               this.createRoute(pt,nodeid,bg,1 + rng.rand(lootRoute),rng,RoomGenNode.ROOM_LOOT,RoomGenNode.ROOM_MINION,roomArray,roomTypeList,null,-1,false,color);
            }
         }
         return output;
      }
      
      internal function shuffleArray(array:Array, rng:RNG) : Array
      {
         var output:Array = [];
         while(array.length > 0)
         {
            output.push(array.splice(rng.rand(array.length),1));
         }
         return output;
      }
      
      internal function createTown(signXPos:int, nodeid:int, nodelevel:int, startDir:int, roomDataVector:Array, territoryData:TerritoryData, townColor:uint, theme:int = -1) : *
      {
         var bg:int = 0;
         var k:int = 0;
         var roomName:String = null;
         var slotCount:int = 0;
         var roomGenNode:RoomGenNode = null;
         var buildPlacement:int = 0;
         if(startDir == NodeGenerator.EXIT_S || startDir == NodeGenerator.EXIT_W)
         {
            startDir = NodeGenerator.EXIT_E;
         }
         var roomArray:Array = new Array();
         var rng:RNG = new RNG(nodeid);
         var prosperity:int = territoryData.getTownLevel();
         var castleSide:int = territoryData.getTownSide();
         if(nodeid == 8906733)
         {
            prosperity = 5;
            if(StatsManager.checkCompletedQuest(44))
            {
               castleSide = 7;
            }
            else
            {
               castleSide = 6;
            }
         }
         switch(prosperity)
         {
            case 0:
               break;
            case 1:
               bg = GameStage.BG_DESTROYEDVILLAGE;
               break;
            case 2:
               bg = GameStage.BG_TOWNPROCGEN_VILLAGE;
               break;
            case 3:
               bg = GameStage.BG_TOWNPROCGEN_TOWN;
               break;
            case 4:
               bg = GameStage.BG_TOWNPROCGEN_CITY;
               break;
            case 5:
               bg = GameStage.BG_TOWNPROCGEN_CITY;
         }
         var index:int = 1;
         roomArray[index] = new RoomGenNode(0,1,bg,nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_TOWNENTRANCE);
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_E)
         {
            roomArray[index].addObject(0,50,"-1," + signXPos,"signpost");
         }
         else
         {
            roomArray[index].addObject(0,750,"-1," + signXPos,"signpost");
         }
         index = this.createRoute(index,nodeid,bg,1,rng,RoomGenNode.ROOM_TOWN,RoomGenNode.ROOM_TOWN,roomArray,null,null,startDir,true);
         var mainRouteEnd:int = this.createRoute(index,nodeid,bg,6,rng,RoomGenNode.ROOM_TOWNCASTLE,RoomGenNode.ROOM_TOWN,roomArray,null,null,startDir);
         var merchantJunctionIndex:int = 2;
         this.createRoute(merchantJunctionIndex,nodeid,bg,3,rng,RoomGenNode.ROOM_TOWNMERCHANT,RoomGenNode.ROOM_TOWNMERCHANT,roomArray,null,null,-1);
         var entJunctionIndex:int = rng.rand(2) + 3;
         this.createRoute(entJunctionIndex,nodeid,bg,3,rng,RoomGenNode.ROOM_TOWNENTERTAINMENT,RoomGenNode.ROOM_TOWNENTERTAINMENT,roomArray,null,null,-1);
         var housingJunctionIndex:int = 5;
         this.createRoute(housingJunctionIndex,nodeid,bg,3,rng,RoomGenNode.ROOM_TOWNHOUSING,RoomGenNode.ROOM_TOWNHOUSING,roomArray,null,null,-1);
         var mainStreetVillageBuildings:Array = [Obj_TownBuilding.TYPE_PEDDLER,Obj_TownBuilding.TYPE_INN,Obj_TownBuilding.TYPE_BOUNTYBOARD];
         var mainStreetTownBuildings:Array = [Obj_TownBuilding.TYPE_BLACKSMITH,Obj_TownBuilding.TYPE_STABLE,Obj_TownBuilding.TYPE_MARKET];
         var merchantCityBuildings:Array = [Obj_TownBuilding.TYPE_MERCHANT,Obj_TownBuilding.TYPE_BANK];
         var entCityBuildings:Array = [Obj_TownBuilding.TYPE_GAMBLINGDEN,Obj_TownBuilding.TYPE_BARBER];
         var buildings:Array = this.shuffleArray(mainStreetVillageBuildings,rng);
         buildings = buildings.concat(this.shuffleArray(mainStreetTownBuildings,rng));
         buildings = buildings.concat(15);
         buildings = buildings.concat(merchantCityBuildings);
         buildings = buildings.concat(this.shuffleArray(entCityBuildings,rng));
         buildings = buildings.concat([15,15]);
         if(theme == -1)
         {
            theme = NodeGenerator.THEME_TOWN;
         }
         if(prosperity == 1)
         {
            if(theme != NodeGenerator.THEME_CLANPURPLE)
            {
               theme = NodeGenerator.THEME_ABANDONED;
            }
            for(k = 1; k < 3; k++)
            {
               roomArray[k].setRoomType(RoomGenNode.ROOM_MINION);
            }
         }
         if(prosperity <= 2)
         {
            roomArray[3].removeExitTo();
            roomArray[merchantJunctionIndex].removeMainRouteJunction(roomArray[8].getEnterFrom());
            roomArray[entJunctionIndex].removeMainRouteJunction(roomArray[10].getEnterFrom());
            for(k = 4; k < roomArray.length; k++)
            {
               roomArray[k].setRoomType(RoomGenNode.ROOM_NOTHING);
            }
         }
         else if(prosperity == 3)
         {
            roomArray[4].removeExitTo();
            roomArray[entJunctionIndex].removeMainRouteJunction(roomArray[10].getEnterFrom());
            roomArray[8].removeExitTo();
            for(k = 5; k < roomArray.length; k++)
            {
               if(k != 8)
               {
                  roomArray[k].setRoomType(RoomGenNode.ROOM_NOTHING);
               }
            }
         }
         else if(prosperity == 4)
         {
            roomArray[5].removeExitTo();
            roomArray[housingJunctionIndex].removeMainRouteJunction(roomArray[12].getEnterFrom());
            roomArray[10].removeExitTo();
            for(k = 6; k < roomArray.length; k++)
            {
               if(k != 8 && k != 9 && k != 10)
               {
                  roomArray[k].setRoomType(RoomGenNode.ROOM_NOTHING);
               }
            }
         }
         else if(prosperity == 5)
         {
            this.createCastle(roomArray,mainRouteEnd,nodeid,nodelevel,rng,territoryData,castleSide);
            roomArray[7].roomWidth = 3 * 355;
            roomArray[7].initCastleRoomObjects(theme,nodelevel,castleSide,rng,territoryData.atWar);
         }
         for(var i:int = 1; i < 14; i++)
         {
            roomGenNode = roomArray[i];
            if(roomGenNode.getRoomType() != RoomGenNode.ROOM_NOTHING)
            {
               roomGenNode.setTownColor(townColor);
               if(i == 1)
               {
                  if(prosperity <= 2)
                  {
                     roomName = LangManager.getString(853);
                  }
                  else if(prosperity == 3)
                  {
                     roomName = LangManager.getString(854);
                  }
                  else if(prosperity == 4)
                  {
                     roomName = LangManager.getString(855);
                  }
                  else if(prosperity == 5)
                  {
                     roomName = LangManager.getString(856);
                  }
               }
               else if(i <= 7)
               {
                  roomName = LangManager.getString(1043);
               }
               else if(i <= 9)
               {
                  roomName = LangManager.getString(857);
               }
               else if(i <= 11)
               {
                  roomName = LangManager.getString(858);
               }
               else if(i <= 13)
               {
                  roomName = LangManager.getString(859);
               }
               if(i == 7)
               {
                  slotCount = 3;
               }
               else if(rng.rand(2) == 0)
               {
                  slotCount = 3;
               }
               else
               {
                  slotCount = 5;
               }
               if(prosperity > 1)
               {
                  buildPlacement = roomGenNode.initTownBuildings(slotCount,buildings[i - 1],roomName,rng);
                  if(buildings[i - 1] == Obj_TownBuilding.TYPE_INN)
                  {
                     this.createInn(roomArray,buildPlacement,roomGenNode,rng);
                  }
                  else if(buildings[i - 1] == Obj_TownBuilding.TYPE_GAMBLINGDEN)
                  {
                     this.createGamblingDen(roomArray,buildPlacement,roomGenNode,rng);
                  }
               }
               else
               {
                  roomGenNode.roomName = roomName;
               }
               roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
               roomDataVector[i] = roomGenNode.output(rng);
            }
         }
         if(prosperity == 5)
         {
            for(i = 14; i <= 40; i++)
            {
               roomGenNode = roomArray[i];
               if(roomGenNode == null)
               {
                  break;
               }
               roomGenNode.initCastleRoomObjects(theme,nodelevel,castleSide,rng,territoryData.atWar);
               roomDataVector[i] = roomGenNode.output(rng);
            }
         }
         var max:int = int(roomArray.length);
         for(i = 100; i < max; i++)
         {
            roomGenNode = roomArray[i];
            if(roomGenNode != null)
            {
               roomGenNode.initRoomObjects(theme,nodelevel,signXPos,rng,nodeid);
               roomDataVector[i] = roomGenNode.output(rng);
            }
         }
      }
      
      internal function createInn(roomArray:Array, buildPlacement:int, extRoomGenNode:RoomGenNode, rng:RNG) : *
      {
         var startDir:int = 0;
         if(extRoomGenNode.getIsNSOrientation())
         {
            startDir = NodeGenerator.EXIT_E;
         }
         else
         {
            startDir = NodeGenerator.EXIT_N;
         }
         var index:int = 100;
         var bg:int = GameStage.BG_INN;
         roomArray[index] = new RoomGenNode(0,index,bg,extRoomGenNode.nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_INN);
         roomArray[index].roomWidth = 1100;
         roomArray[index].roomName = "Inn";
         var signXPos:int = buildPlacement * 355 + 355 / 2;
         roomArray[index].addObject(0,50,extRoomGenNode.roomid + "," + signXPos,"signpost");
         if(rng.rand(3) == 0)
         {
            roomArray[index].setBGParam(1);
            index = this.createRoute(index,extRoomGenNode.nodeid,GameStage.BG_KITCHEN,1,rng,RoomGenNode.ROOM_CORRIDOR,RoomGenNode.ROOM_CORRIDOR,roomArray,null,null,startDir,true);
            roomArray[index].roomWidth = 1000;
            roomArray[index].roomName = "Inn";
         }
      }
      
      internal function createCastle(roomArray:Array, mainRouteEnd:int, nodeid:int, nodelevel:int, rng:RNG, territoryData:TerritoryData, castleSide:int) : *
      {
         var roomGenNode:RoomGenNode = null;
         var startDir:int = 0;
         var index:int = 0;
         var outerGateIndex:int = 0;
         var i:int = 0;
         var outerWallBreachOut:Array = null;
         var outerWallBreachIn:Array = null;
         var outerWallLadderBreachOut:Array = null;
         var outerWallLadderBreachIn:Array = null;
         var innerWallBreachOut:Array = null;
         var innerWallBreachIn:Array = null;
         var dice:int = 0;
         var ladderspacing:int = 0;
         var outerGateOutList:Array = null;
         var outerGateInList:Array = null;
         var bushmax:int = 0;
         var hiddenpath:int = 0;
         var j:int = 0;
         roomGenNode = roomArray[mainRouteEnd];
         if(roomGenNode.enterFrom == 0)
         {
            startDir = 1;
         }
         else if(roomGenNode.enterFrom == 1)
         {
            startDir = 0;
         }
         else if(roomGenNode.enterFrom == 2)
         {
            startDir = 3;
         }
         else if(roomGenNode.enterFrom == 3)
         {
            startDir = 2;
         }
         if(territoryData.territoryAtWar())
         {
            roomGenNode.removeExit(roomGenNode.enterFrom);
            if(roomGenNode.enterFrom == 0 || roomGenNode.enterFrom == 2)
            {
               roomArray[7].addObject(0,1015,"-2","leavesign");
            }
            else
            {
               roomArray[7].addObject(0,50,"-2","leavesign");
            }
         }
         var outerGateOut:int = 18;
         var outerGateIn:int = 21;
         var innerGateOut:int = 21;
         var innerGateIn:int = 27;
         roomArray[14] = new RoomGenNode(0,14,GameStage.BG_CASTLEWALLS,nodeid);
         roomArray[14].setRoomType(RoomGenNode.ROOM_CASTLEOUTERWALL);
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_S)
         {
            index = this.createRoute(14,nodeid,GameStage.BG_CASTLEWALLS,3,rng,RoomGenNode.ROOM_CASTLEOUTERWALL,RoomGenNode.ROOM_CASTLEOUTERWALL,roomArray,null,null,NodeGenerator.EXIT_N,true);
            index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALLS,1,rng,RoomGenNode.ROOM_CASTLEOUTERWALL,RoomGenNode.ROOM_CASTLEOUTERWALL,roomArray,null,null,NodeGenerator.EXIT_E,true);
            index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALLS,3,rng,RoomGenNode.ROOM_CASTLEOUTERWALL,RoomGenNode.ROOM_CASTLEOUTERWALL,roomArray,null,null,NodeGenerator.EXIT_S,true);
            roomArray[index].addExit(NodeGenerator.EXIT_W,14);
            roomArray[14].addExit(NodeGenerator.EXIT_E,index);
            roomArray[14].enterFrom = -2;
            roomArray[15].enterFrom = -2;
            roomArray[16].enterFrom = -3;
            roomArray[17].enterFrom = -2;
            roomArray[18].enterFrom = -2;
            roomArray[19].enterFrom = -3;
            roomArray[14].roomWidth = 1500;
            roomArray[14].setBGParam(1);
            roomArray[15].roomWidth = 2500;
            roomArray[15].setBGParam(1);
            roomArray[16].roomWidth = 3000;
            roomArray[16].setBGParam(1);
            roomArray[17].roomWidth = 1500;
            roomArray[18].roomWidth = 2500;
            roomArray[19].roomWidth = 3000;
            if(startDir == NodeGenerator.EXIT_N)
            {
               roomArray[mainRouteEnd].addExit(NodeGenerator.EXIT_N,14);
               roomArray[14].addExit(NodeGenerator.EXIT_S,mainRouteEnd);
               roomArray[14].setRoomType(RoomGenNode.ROOM_CASTLEOUTERWALLSTART);
            }
            else if(startDir == NodeGenerator.EXIT_S)
            {
               roomArray[mainRouteEnd].addExit(NodeGenerator.EXIT_S,17);
               roomArray[17].addExit(NodeGenerator.EXIT_N,mainRouteEnd);
               roomArray[17].setRoomType(RoomGenNode.ROOM_CASTLEOUTERWALLSTART);
            }
            outerGateOutList = [18,19];
            outerGateInList = [21,22];
            i = rng.rand(outerGateOutList.length);
            outerGateOut = int(outerGateOutList[i]);
            outerGateIn = int(outerGateInList[i]);
         }
         else
         {
            index = this.createRoute(14,nodeid,GameStage.BG_CASTLEWALLS,3,rng,RoomGenNode.ROOM_CASTLEOUTERWALL,RoomGenNode.ROOM_CASTLEOUTERWALL,roomArray,null,null,NodeGenerator.EXIT_E,true);
            index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALLS,1,rng,RoomGenNode.ROOM_CASTLEOUTERWALL,RoomGenNode.ROOM_CASTLEOUTERWALL,roomArray,null,null,NodeGenerator.EXIT_S,true);
            index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALLS,3,rng,RoomGenNode.ROOM_CASTLEOUTERWALL,RoomGenNode.ROOM_CASTLEOUTERWALL,roomArray,null,null,NodeGenerator.EXIT_W,true);
            roomArray[index].addExit(NodeGenerator.EXIT_N,14);
            roomArray[14].addExit(NodeGenerator.EXIT_S,index);
            roomArray[14].enterFrom = -3;
            roomArray[15].enterFrom = -3;
            roomArray[16].enterFrom = -2;
            roomArray[17].enterFrom = -3;
            roomArray[18].enterFrom = -3;
            roomArray[19].enterFrom = -2;
            roomArray[14].roomWidth = 1500;
            roomArray[14].setBGParam(1);
            roomArray[15].roomWidth = 3000;
            roomArray[15].setBGParam(1);
            roomArray[16].roomWidth = 3000;
            roomArray[17].roomWidth = 1500;
            roomArray[18].roomWidth = 3000;
            roomArray[19].roomWidth = 3000;
            roomArray[19].setBGParam(1);
            if(startDir == NodeGenerator.EXIT_E)
            {
               roomArray[mainRouteEnd].addExit(NodeGenerator.EXIT_E,14);
               roomArray[14].addExit(NodeGenerator.EXIT_W,mainRouteEnd);
               roomArray[14].setRoomType(RoomGenNode.ROOM_CASTLEOUTERWALLSTART);
            }
            else if(startDir == NodeGenerator.EXIT_W)
            {
               roomArray[mainRouteEnd].addExit(NodeGenerator.EXIT_W,17);
               roomArray[17].addExit(NodeGenerator.EXIT_E,mainRouteEnd);
               roomArray[17].setRoomType(RoomGenNode.ROOM_CASTLEOUTERWALLSTART);
            }
            outerGateOutList = [16,18];
            outerGateInList = [21,22];
            i = rng.rand(outerGateOutList.length);
            outerGateOut = int(outerGateOutList[i]);
            outerGateIn = int(outerGateInList[i]);
         }
         roomArray[20] = new RoomGenNode(0,20,GameStage.BG_CASTLEWALLS_INNER,nodeid);
         roomArray[20].setRoomType(RoomGenNode.ROOM_CASTLEINNERWALL);
         index = this.createRoute(20,nodeid,GameStage.BG_CASTLEWALLS_INNER,1,rng,RoomGenNode.ROOM_CASTLEINNERWALL,RoomGenNode.ROOM_CASTLEINNERWALL,roomArray,null,null,NodeGenerator.EXIT_E,true);
         index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALLS_INNER,1,rng,RoomGenNode.ROOM_CASTLEINNERWALL,RoomGenNode.ROOM_CASTLEINNERWALL,roomArray,null,null,NodeGenerator.EXIT_S,true);
         index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALLS_INNER,1,rng,RoomGenNode.ROOM_CASTLEINNERWALL,RoomGenNode.ROOM_CASTLEINNERWALL,roomArray,null,null,NodeGenerator.EXIT_W,true);
         roomArray[index].addExit(NodeGenerator.EXIT_N,20);
         roomArray[20].addExit(NodeGenerator.EXIT_S,index);
         roomArray[20].enterFrom = -3;
         roomArray[21].enterFrom = -2;
         roomArray[22].enterFrom = -3;
         roomArray[23].enterFrom = -2;
         roomArray[20].roomWidth = 3000;
         roomArray[20].setBGParam(1);
         roomArray[21].roomWidth = 3000;
         roomArray[22].roomWidth = 3000;
         roomArray[23].roomWidth = 3000;
         roomArray[23].setBGParam(1);
         var innerGateOutList:Array = [21,22];
         var innerGateInList:Array = [27,29];
         outerGateIndex = innerGateOutList.indexOf(outerGateIn);
         if(outerGateIndex != -1)
         {
            innerGateOutList.splice(outerGateIndex,1);
            innerGateInList.splice(outerGateIndex,1);
         }
         i = rng.rand(innerGateOutList.length);
         innerGateOut = int(innerGateOutList[i]);
         innerGateIn = int(innerGateInList[i]);
         roomArray[24] = new RoomGenNode(0,24,GameStage.BG_CASTLEWALKWAY,nodeid);
         roomArray[24].setRoomType(RoomGenNode.ROOM_CASTLECOURTYARD);
         index = this.createRoute(24,nodeid,GameStage.BG_CASTLEWALKWAY,3,rng,RoomGenNode.ROOM_CASTLECOURTYARD,RoomGenNode.ROOM_CASTLECOURTYARD,roomArray,null,null,NodeGenerator.EXIT_E,true);
         index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALKWAY,3,rng,RoomGenNode.ROOM_CASTLECOURTYARD,RoomGenNode.ROOM_CASTLECOURTYARD,roomArray,null,null,NodeGenerator.EXIT_S,true);
         index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALKWAY,3,rng,RoomGenNode.ROOM_CASTLECOURTYARD,RoomGenNode.ROOM_CASTLECOURTYARD,roomArray,null,null,NodeGenerator.EXIT_W,true);
         index = this.createRoute(index,nodeid,GameStage.BG_CASTLEWALKWAY,1,rng,RoomGenNode.ROOM_CASTLECOURTYARD,RoomGenNode.ROOM_CASTLECOURTYARD,roomArray,null,null,NodeGenerator.EXIT_N,true);
         roomArray[index].addExit(NodeGenerator.EXIT_N,24);
         roomArray[24].addExit(NodeGenerator.EXIT_S,index);
         roomArray[24].enterFrom = -3;
         roomArray[25].enterFrom = -3;
         roomArray[26].enterFrom = -2;
         roomArray[27].enterFrom = -2;
         roomArray[28].enterFrom = -3;
         roomArray[29].enterFrom = -3;
         roomArray[30].enterFrom = -2;
         roomArray[31].enterFrom = -2;
         roomArray[24].roomWidth = 2000;
         roomArray[25].roomWidth = 2000;
         roomArray[26].roomWidth = 2000;
         roomArray[27].roomWidth = 2000;
         roomArray[28].roomWidth = 2000;
         roomArray[29].roomWidth = 2000;
         roomArray[30].roomWidth = 2000;
         roomArray[31].roomWidth = 2000;
         if(innerGateIn != 27)
         {
            roomArray[27].setBGParam(3);
         }
         if(innerGateIn != 29)
         {
            roomArray[29].setBGParam(3);
         }
         index = this.createRoute(31,nodeid,GameStage.BG_CASTLEHALLWAY,4,rng,RoomGenNode.ROOM_CASTLECORRIDOR,RoomGenNode.ROOM_CASTLECORRIDOR,roomArray,null,null,NodeGenerator.EXIT_E,true);
         roomArray[35] = new RoomGenNode(0,24,GameStage.BG_CASTLEROOM,nodeid);
         roomArray[35].setRoomType(RoomGenNode.ROOM_CASTLEROOM);
         roomArray[35].roomWidth = 800;
         roomArray[35].setBGParam(5);
         roomArray[36] = new RoomGenNode(0,24,GameStage.BG_CASTLEROOM,nodeid);
         roomArray[36].setRoomType(RoomGenNode.ROOM_CASTLEROOM);
         roomArray[36].roomWidth = 800;
         roomArray[36].setBGParam(6);
         roomArray[32].addExit(NodeGenerator.EXIT_S,35);
         roomArray[34].addExit(NodeGenerator.EXIT_N,36);
         roomArray[36].addObject(0,100,"34," + roomArray[34].roomWidth / 2 + ",-1,0,1,3","sexit");
         roomArray[35].addObject(0,700,"32," + roomArray[32].roomWidth / 2 + ",-1,0,0,2","nexit");
         if(innerGateIn != 27)
         {
            roomArray[27].addExit(NodeGenerator.EXIT_W,34);
            roomArray[34].addExit(NodeGenerator.EXIT_E,27);
         }
         if(innerGateIn != 29)
         {
            roomArray[35].addObject(0,100,"29," + roomArray[29].roomWidth / 2 + ",-1,0,1,3","sexit");
            roomArray[29].addExit(NodeGenerator.EXIT_N,35);
            roomArray[35].setBGParam(6);
         }
         roomArray[36].addObject(0,700,"25," + roomArray[25].roomWidth / 2 + ",-1,0,0,2","nexit");
         roomArray[25].addExit(NodeGenerator.EXIT_S,36);
         if(innerGateIn != 27)
         {
            roomArray[34].roomWidth = 1420;
            roomArray[34].setBGParam(3);
         }
         else
         {
            roomArray[34].roomWidth = 1330;
            roomArray[34].setBGParam(5);
         }
         roomArray[outerGateOut].addObject(63,roomArray[outerGateOut].roomWidth / 4,outerGateIn + "," + roomArray[outerGateIn].roomWidth / 2 + "," + castleSide,"outergate");
         roomArray[outerGateIn].addObject(0,roomArray[outerGateIn].roomWidth / 2,outerGateOut + "," + roomArray[outerGateOut].roomWidth / 2,"outergate");
         roomArray[outerGateOut].setRoomType(RoomGenNode.ROOM_CASTLEWALLGATE);
         roomArray[innerGateOut].addObject(63,roomArray[innerGateOut].roomWidth / 4,innerGateIn + "," + roomArray[innerGateIn].roomWidth / 2 + "," + castleSide,"innergate");
         roomArray[innerGateIn].addObject(0,roomArray[innerGateIn].roomWidth / 2,innerGateOut + "," + roomArray[innerGateOut].roomWidth / 2,"outergate");
         roomArray[innerGateOut].setRoomType(RoomGenNode.ROOM_CASTLEWALLGATE);
         roomArray[33].setBG(GameStage.BG_DOJO3);
         roomArray[33].setRoomType(RoomGenNode.ROOM_CASTLESTAIRS);
         roomArray[33].roomWidth = 1610;
         roomArray[33].setBGParam(3);
         roomArray[33].addObject(0,800,"37,150","stairsupsign");
         roomArray[33].addObject(64,800,"1,1","stairs");
         roomArray[33].roomName = LangManager.getString(780) + " 1";
         roomArray[37] = new RoomGenNode(0,37,GameStage.BG_DOJO3,nodeid);
         roomArray[37].setRoomType(RoomGenNode.ROOM_CASTLESTAIRS);
         roomArray[37].roomWidth = 1610;
         roomArray[37].addObject(0,50,"33,800","stairsdownsign");
         roomArray[37].addObject(0,1550,"38,150","stairsupsign");
         roomArray[37].addObject(64,1550,"2,1","stairs");
         roomArray[37].roomName = LangManager.getString(780) + " 2";
         roomArray[38] = new RoomGenNode(0,38,GameStage.BG_DOJO3,nodeid);
         roomArray[38].setRoomType(RoomGenNode.ROOM_CASTLESTAIRS);
         roomArray[38].roomWidth = 1610;
         roomArray[38].addObject(0,50,"37,1550","stairsdownsign");
         roomArray[38].addObject(0,1550,"39,150","stairsupsign");
         roomArray[38].addObject(64,1550,"2,1","stairs");
         roomArray[38].roomName = LangManager.getString(780) + " 3";
         roomArray[39] = new RoomGenNode(0,39,GameStage.BG_CASTLEROOM,nodeid);
         roomArray[39].setRoomType(RoomGenNode.ROOM_CASTLEFLAGROOM);
         roomArray[39].roomWidth = 800;
         if(castleSide == StatsManager.getSide())
         {
            roomArray[39].setBGParam(3);
         }
         else
         {
            roomArray[39].setBGParam(1);
         }
         roomArray[39].addObject(0,100,"38,1550,-1,0","stairsdownsign");
         if(territoryData.territoryAtWar())
         {
            roomArray[39].addObject(66,550,castleSide,"castleflag");
         }
         else
         {
            roomArray[39].addObject(1,500,"823","textsign");
            roomArray[39].addObject(66,550,castleSide + ",1","castleflag");
         }
         if(castleSide == StatsManager.getSide())
         {
            roomArray[39].addObject(0,700,"40,100,-1,0","leavesign");
         }
         else if(territoryData.territoryAtWar())
         {
            roomArray[39].addObject(0,700,"-2","leavesign");
         }
         roomArray[39].roomName = LangManager.getString(781);
         roomArray[40] = new RoomGenNode(0,37,GameStage.BG_CASTLEROOM,nodeid);
         roomArray[40].setRoomType(RoomGenNode.ROOM_CASTLEDEFENDERSPAWN);
         roomArray[40].roomWidth = 800;
         roomArray[40].setBGParam(1);
         roomArray[40].addObject(0,100,"39,700,-1,0","sign");
         roomArray[40].roomName = LangManager.getString(782);
         if(territoryData.territoryAtWar())
         {
            roomArray[40].addObject(0,700,"-2","leavesign");
         }
         if(startDir == NodeGenerator.EXIT_N || startDir == NodeGenerator.EXIT_S)
         {
            outerWallBreachOut = [15,16,18,19];
            outerWallBreachIn = [23,20,21,22];
            outerWallLadderBreachOut = [18,19];
            outerWallLadderBreachIn = [21,22];
         }
         else
         {
            outerWallBreachOut = [15,16,18,19];
            outerWallBreachIn = [20,21,22,23];
            outerWallLadderBreachOut = [16,18];
            outerWallLadderBreachIn = [21,22];
         }
         innerWallBreachOut = [20,21,22,23];
         innerWallBreachIn = [24,25,27,26,29,28,30,31];
         outerGateIndex = outerWallBreachOut.indexOf(outerGateOut);
         if(outerGateIndex != -1)
         {
            outerWallBreachOut.splice(outerGateIndex,1);
            outerWallBreachIn.splice(outerGateIndex,1);
         }
         var max:int = int(outerWallBreachOut.length);
         for(i = 0; i < max; i++)
         {
            roomGenNode = roomArray[outerWallBreachOut[i]];
            bushmax = roomGenNode.roomWidth / 250;
            hiddenpath = rng.rand(bushmax - 2) + 1;
            for(j = 1; j < bushmax; j++)
            {
               if(j != hiddenpath)
               {
                  roomGenNode.addObject(2,j * 250,"1," + nodelevel.toString(),"bush" + j.toString());
               }
               else
               {
                  roomGenNode.addObject(53,j * 250,outerWallBreachIn[i] + "," + j * 250,"pathbush");
               }
            }
         }
         var ladderpos:Array = [0,0];
         max = int(outerWallLadderBreachOut.length);
         for(i = 0; i < max; i++)
         {
            roomGenNode = roomArray[outerWallLadderBreachOut[i]];
            dice = rng.rand(2);
            ladderpos[i] = dice;
            if(outerWallLadderBreachOut[i] == outerGateOut)
            {
               ladderspacing = roomGenNode.roomWidth / 4;
               if(dice == 0)
               {
                  roomGenNode.addObject(65,ladderspacing * 1 / 2,outerWallLadderBreachIn[i] + "," + roomArray[outerWallLadderBreachIn[i]].roomWidth / 4 + "," + castleSide,"ladderpoint");
               }
               else
               {
                  roomGenNode.addObject(65,ladderspacing * 3 / 2,outerWallLadderBreachIn[i] + "," + roomArray[outerWallLadderBreachIn[i]].roomWidth * 3 / 4 + "," + castleSide,"ladderpoint");
               }
            }
            else
            {
               ladderspacing = roomGenNode.roomWidth / 3;
               if(dice == 0)
               {
                  roomGenNode.addObject(65,ladderspacing * 1 / 2,outerWallLadderBreachIn[i] + "," + roomArray[outerWallLadderBreachIn[i]].roomWidth / 3 + "," + castleSide,"ladderpoint");
               }
               else
               {
                  roomGenNode.addObject(65,ladderspacing * 2 / 2,outerWallLadderBreachIn[i] + "," + roomArray[outerWallLadderBreachIn[i]].roomWidth * 2 / 3 + "," + castleSide,"ladderpoint");
               }
            }
         }
         max = int(innerWallBreachOut.length);
         for(i = 0; i < max; i++)
         {
            roomGenNode = roomArray[innerWallBreachOut[i]];
            if(innerWallBreachOut[i] == outerWallLadderBreachIn[0])
            {
               dice = int(ladderpos[0]);
            }
            else if(innerWallBreachOut[i] == outerWallLadderBreachIn[1])
            {
               dice = int(ladderpos[1]);
            }
            else
            {
               dice = rng.rand(2);
            }
            if(innerWallBreachOut[i] == innerGateOut)
            {
               ladderspacing = roomGenNode.roomWidth / 4;
               if(dice == 1)
               {
                  roomGenNode.addObject(65,ladderspacing * 1 / 2,innerWallBreachIn[i * 2] + "," + roomArray[innerWallBreachIn[i * 2]].roomWidth / 4 + "," + castleSide,"ladderpoint1");
               }
               else
               {
                  roomGenNode.addObject(65,ladderspacing * 3 / 2,innerWallBreachIn[i * 2 + 1] + "," + roomArray[innerWallBreachIn[i * 2 + 1]].roomWidth * 3 / 4 + "," + castleSide,"ladderpoint2");
               }
            }
            else
            {
               ladderspacing = roomGenNode.roomWidth / 3;
               if(dice == 1)
               {
                  roomGenNode.addObject(65,ladderspacing * 1 / 2 + rng.rand(200) - 100,innerWallBreachIn[i * 2] + "," + roomArray[innerWallBreachIn[i * 2]].roomWidth / 3 + "," + castleSide,"ladderpoint1");
               }
               else
               {
                  roomGenNode.addObject(65,ladderspacing * 2 / 2,innerWallBreachIn[i * 2 + 1] + "," + roomArray[innerWallBreachIn[i * 2 + 1]].roomWidth * 2 / 3 + "," + castleSide,"ladderpoint2");
               }
            }
         }
      }
      
      internal function createGamblingDen(roomArray:Array, buildPlacement:int, extRoomGenNode:RoomGenNode, rng:RNG) : *
      {
         var startDir:int = 0;
         var roomindex:int = 0;
         var roomType:int = 0;
         var roomDir:int = 0;
         var isOpen:String = null;
         var j:int = 0;
         var signpos:int = 0;
         if(extRoomGenNode.getIsNSOrientation())
         {
            startDir = NodeGenerator.EXIT_E;
         }
         else
         {
            startDir = NodeGenerator.EXIT_N;
         }
         var index:int = 110;
         var bg:int = GameStage.BG_CASTLEHALLWAY;
         roomArray[index] = new RoomGenNode(0,index,bg,extRoomGenNode.nodeid);
         roomArray[index].setRoomType(RoomGenNode.ROOM_TOWNCORRIDOR);
         roomArray[index].roomWidth = 1200;
         roomArray[index].roomName = "Gambling Den";
         var signXPos:int = buildPlacement * 355 + 355 / 2;
         roomArray[index].addObject(0,50,extRoomGenNode.roomid + "," + signXPos,"signpost");
         var totalRooms:int = rng.rand(2) + 1;
         this.createRoute(index,extRoomGenNode.nodeid,GameStage.BG_CASTLEHALLWAY,totalRooms,rng,RoomGenNode.ROOM_TOWNCORRIDOR,RoomGenNode.ROOM_TOWNCORRIDOR,roomArray,null,null,startDir,true);
         if(startDir == NodeGenerator.EXIT_E)
         {
            roomDir = NodeGenerator.EXIT_N;
         }
         else
         {
            roomDir = NodeGenerator.EXIT_E;
         }
         for(var i:int = 0; i < totalRooms; i++)
         {
            for(j = 0; j < 2; j++)
            {
               if(!(i == 0 && j == 0) && rng.rand(3) != 0 || i == 0 && j == 1 || i == 1 && j == 1)
               {
                  if(i == 0 && j == 1 || i == 1 && j == 1 || rng.rand(3) != 0)
                  {
                     isOpen = ",1";
                  }
                  else
                  {
                     isOpen = "";
                  }
                  roomType = RoomGenNode.ROOM_GAMBLINGDEN;
                  if(i == 1 && j == 1 || !(i == 0 && j == 1) && rng.rand(2) == 0)
                  {
                     roomType = RoomGenNode.ROOM_CORRIDOR;
                  }
                  roomindex = this.createRoute(index + i,extRoomGenNode.nodeid,GameStage.BG_CASTLEROOM,1,rng,roomType,roomType,roomArray,null,null,roomDir,true);
                  roomArray[index + i].addObject(8,298 + j * 600,"2," + roomindex + ",50,-1" + isOpen,"door" + i.toString());
                  roomArray[roomindex].roomName = "Gambling Den Room";
                  roomArray[roomindex].setBGParam(1);
                  roomArray[roomindex].roomWidth = 800;
                  roomArray[roomindex].removeExitFrom();
                  signpos = 298 + j * 600;
                  roomArray[roomindex].addObject(0,100,index + i + "," + signpos + ",-1,0","signpost");
               }
               roomArray[index + i].roomName = "Gambling Den Corridor";
               roomArray[index + i].roomWidth = 1200;
               roomArray[index + i].removeExit(roomDir);
            }
         }
      }
   }
}

