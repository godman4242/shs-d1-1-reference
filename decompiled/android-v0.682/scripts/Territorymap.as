package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2630")]
   public class Territorymap extends MovieClip
   {
      
      public static var instance:Territorymap;
      
      public var southlabel:TextField;
      
      public var sectorlabel:TextField;
      
      public var nodemark:MovieClip;
      
      public var minimapPlayer:MovieClip;
      
      public var northlabel:TextField;
      
      public var eastlabel:TextField;
      
      public var canvas:Canvas;
      
      public var westlabel:TextField;
      
      internal var minimapRoomList:Array;
      
      internal var isNSOrientation:Boolean;
      
      internal var mcWidth:int = 10;
      
      internal var roomWidth:int;
      
      internal var nodeid:int;
      
      internal var startx:int;
      
      internal var starty:int;
      
      internal var aStarRoomList:Array;
      
      internal var destReached:Boolean;
      
      internal var stopSearching:Boolean;
      
      public function Territorymap()
      {
         var j:int = 0;
         this.minimapRoomList = new Array();
         super();
         instance = this;
         LangManager.initTextField(this.northlabel,true);
         LangManager.initTextField(this.southlabel,true);
         LangManager.initTextField(this.eastlabel,true);
         LangManager.initTextField(this.westlabel,true);
         this.northlabel.text = LangManager.getString(398);
         this.southlabel.text = LangManager.getString(399);
         this.eastlabel.text = LangManager.getString(400);
         this.westlabel.text = LangManager.getString(401);
         this.sectorlabel.mouseEnabled = false;
         buttonMode = true;
         for(var i:int = 0; i < 6; i++)
         {
            this.minimapRoomList[i] = new Array(6);
            for(j = 0; j < 6; j++)
            {
               this.minimapRoomList[i][j] = new BigmapRoom();
               this.canvas.addChild(this.minimapRoomList[i][j]);
               this.minimapRoomList[i][j].x = i * 20 - 77 + 28;
               this.minimapRoomList[i][j].y = j * 20 - 77 + 28;
            }
         }
      }
      
      public static function getInstance() : Territorymap
      {
         if(instance == null)
         {
            new Territorymap();
         }
         return instance;
      }
      
      public function refresh() : *
      {
         this.setNodeId(this.nodeid);
      }
      
      public function setNodeId(nodeid:int) : *
      {
         var destId:int = 0;
         var destExits:Array = null;
         var roomObjects:XMLList = null;
         var nodeXML:XMLWorldNode = null;
         var nodeGenerator:NodeGenerator = null;
         var markedNode:int = 0;
         var i:int = 0;
         var j:int = 0;
         var outside:Boolean = false;
         var markedNodeSector:Point = null;
         var xdiff:int = 0;
         var ydiff:int = 0;
         var pathEnd:Point = null;
         var territoryid:int = 0;
         var dir:int = 0;
         this.nodeid = nodeid;
         var territory:Point = NodeGenerator.instance.getTerritory(nodeid);
         var sector:Point = NodeGenerator.instance.getTerritorySector(nodeid);
         var topleftnodeid:int = territory.x * 6 << 12 | territory.y * 6;
         this.sectorlabel.text = LangManager.getString(557) + "(" + (territory.x - 341 + WarSelectUI.DTERRSHIFTX) + "," + (territory.y - 341 + WarSelectUI.DTERRSHIFTY) + ")\n" + LangManager.getString(319) + "(" + sector.x + "," + sector.y + ")";
         nodeGenerator = NodeGenerator.getInstance();
         markedNode = QuestGenerator.instance.getMarkedNode();
         for(i = 0; i < 6; i++)
         {
            for(j = 0; j < 6; j++)
            {
               destId = nodeGenerator.getShiftedNodeId(topleftnodeid,i,j);
               if(destId == -1)
               {
                  this.minimapRoomList[i][j].visible = false;
               }
               else
               {
                  this.minimapRoomList[i][j].visible = true;
                  nodeXML = QuestEngine.getNodeData(destId);
                  if(!nodeXML.isGenerated)
                  {
                     roomObjects = nodeXML.getRoomData(false)[0].getObjectList();
                     destExits = this.getExitArrayFromObjectList(roomObjects);
                  }
                  else
                  {
                     destExits = nodeGenerator.getNodeExits(destId);
                  }
                  this.minimapRoomList[i][j].initNodeExits(destExits);
                  this.minimapRoomList[i][j].initIcon(NodeGenerator.instance.getLocationType(destId));
                  if(destId == 8402942)
                  {
                     this.minimapRoomList[i][j].initIcon(NodeGenerator.ICON_MINE);
                  }
                  else if(destId == 8493074)
                  {
                     this.minimapRoomList[i][j].initIcon(NodeGenerator.ICON_CAVE);
                  }
                  else if(destId == 8656914 || destId == 8906733)
                  {
                     this.minimapRoomList[i][j].initIcon(NodeGenerator.ICON_TOWN);
                  }
                  if(destId == nodeid)
                  {
                     this.minimapPlayer.x = this.minimapRoomList[i][j].x + 77;
                     this.minimapPlayer.y = this.minimapRoomList[i][j].y + 77;
                     this.startx = this.minimapPlayer.x;
                     this.starty = this.minimapPlayer.y;
                     this.isNSOrientation = nodeGenerator.isNodeNSOrientation(destExits);
                     if(!nodeXML.isGenerated)
                     {
                        this.roomWidth = nodeXML.getRoomData(false)[0].getWidth();
                     }
                     else
                     {
                        this.roomWidth = nodeGenerator.getRoomWidth(destId);
                     }
                  }
               }
            }
         }
         this.canvas.graphics.clear();
         if(markedNode != -1)
         {
            markedNodeSector = NodeGenerator.instance.getSector(markedNode);
            xdiff = markedNodeSector.x - territory.x * 6;
            ydiff = markedNodeSector.y - territory.y * 6;
            this.nodemark.x = xdiff * 20 + 28;
            this.nodemark.y = ydiff * 20 + 28;
            this.nodemark.visible = true;
            this.nodemark.rotation = 0;
            territoryid = NodeGenerator.instance.getTerritoryId(nodeid);
            if(this.nodemark.x <= 8)
            {
               outside = true;
               dir = this.getOutsidePathEnd(territory,NodeGenerator.instance.getTerritory(markedNode),NodeGenerator.EXIT_W,territoryid);
            }
            else if(this.nodemark.x > 145)
            {
               outside = true;
               dir = this.getOutsidePathEnd(territory,NodeGenerator.instance.getTerritory(markedNode),NodeGenerator.EXIT_E,territoryid);
            }
            else if(this.nodemark.y < 13)
            {
               outside = true;
               dir = this.getOutsidePathEnd(territory,NodeGenerator.instance.getTerritory(markedNode),NodeGenerator.EXIT_N,territoryid);
            }
            else if(this.nodemark.y > 144)
            {
               outside = true;
               dir = this.getOutsidePathEnd(territory,NodeGenerator.instance.getTerritory(markedNode),NodeGenerator.EXIT_S,territoryid);
            }
            if(outside)
            {
               if(territoryid == 1438039 && dir == NodeGenerator.EXIT_E)
               {
                  dir = NodeGenerator.EXIT_S;
               }
               else if(territoryid == 1442135 && dir == NodeGenerator.EXIT_W)
               {
                  dir = NodeGenerator.EXIT_S;
               }
               this.nodemark.gotoAndStop(2);
               if(dir == NodeGenerator.EXIT_N)
               {
                  this.nodemark.y = 13;
                  this.nodemark.rotation = 0;
                  pathEnd = new Point(TerritoryData.getNorthExits(territoryid)[0],0);
                  this.nodemark.x = this.minimapRoomList[pathEnd.x][pathEnd.y].x + 77;
               }
               else if(dir == NodeGenerator.EXIT_S)
               {
                  this.nodemark.y = 144;
                  this.nodemark.rotation = 180;
                  pathEnd = new Point(TerritoryData.getSouthExits(territoryid)[0],5);
                  this.nodemark.x = this.minimapRoomList[pathEnd.x][pathEnd.y].x + 77;
               }
               else if(dir == NodeGenerator.EXIT_E)
               {
                  this.nodemark.x = 145;
                  this.nodemark.rotation = 90;
                  pathEnd = new Point(5,TerritoryData.getEastExits(territoryid)[0]);
                  this.nodemark.y = this.minimapRoomList[pathEnd.x][pathEnd.y].y + 77;
               }
               else if(dir == NodeGenerator.EXIT_W)
               {
                  this.nodemark.x = 8;
                  this.nodemark.rotation = -90;
                  pathEnd = new Point(0,TerritoryData.getWestExits(territoryid)[0]);
                  this.nodemark.y = this.minimapRoomList[pathEnd.x][pathEnd.y].y + 77;
               }
            }
            else
            {
               this.nodemark.gotoAndStop(1);
               this.nodemark.rotation = 0;
               pathEnd = NodeGenerator.instance.getTerritorySector(markedNode);
            }
            this.drawPath(sector,pathEnd,outside);
         }
         else
         {
            this.nodemark.visible = false;
         }
         this.gotUpdateFromPlayer(StatsManager.getPlayer().getMapPosition(),StatsManager.getPlayer().getMCS().isFacingRight());
      }
      
      internal function getOutsidePathEnd(startTerr:Point, endTerr:Point, dir:int, territoryid:int) : int
      {
         var aStarRoom:AStarRoom = null;
         var fromPoint:Point = null;
         var xdiff:int = 0;
         var ydiff:int = 0;
         var altList:Array = null;
         var max:int = 0;
         var altDir:int = 0;
         var i:int = 0;
         var startPoint:Point = new Point(startTerr.x - 341,startTerr.y - 341);
         endTerr.x -= 341;
         endTerr.y -= 341;
         this.destReached = false;
         this.stopSearching = false;
         this.aStarRoomList = new Array();
         this.nextOutsidePath(startPoint.x,startPoint.y,startPoint.x,startPoint.y,endTerr,0);
         if(this.destReached)
         {
            aStarRoom = this.aStarRoomList[endTerr.x][endTerr.y];
            fromPoint = aStarRoom.from;
            while(!aStarRoom.from.equals(startPoint))
            {
               fromPoint = aStarRoom.from;
               aStarRoom = this.aStarRoomList[fromPoint.x][fromPoint.y];
            }
            if(fromPoint.x > startPoint.x)
            {
               dir = NodeGenerator.EXIT_E;
            }
            else if(fromPoint.x < startPoint.x)
            {
               dir = NodeGenerator.EXIT_W;
            }
            else if(fromPoint.y > startPoint.y)
            {
               dir = NodeGenerator.EXIT_S;
            }
            else if(fromPoint.y < startPoint.y)
            {
               dir = NodeGenerator.EXIT_N;
            }
         }
         else
         {
            trace("getOutsidePathEnd:dest not reached but ok");
            xdiff = endTerr.x - startPoint.x;
            ydiff = endTerr.y - startPoint.y;
            altList = null;
            if(dir == NodeGenerator.EXIT_N && !QuestEngine.hasTerritory(startTerr.x,startTerr.y - 1))
            {
               if(xdiff > 0)
               {
                  altList = [NodeGenerator.EXIT_E,NodeGenerator.EXIT_W,NodeGenerator.EXIT_S];
               }
               else
               {
                  altList = [NodeGenerator.EXIT_W,NodeGenerator.EXIT_E,NodeGenerator.EXIT_S];
               }
            }
            else if(dir == NodeGenerator.EXIT_S && !QuestEngine.hasTerritory(startTerr.x,startTerr.y + 1))
            {
               if(xdiff > 0)
               {
                  altList = [NodeGenerator.EXIT_E,NodeGenerator.EXIT_W,NodeGenerator.EXIT_N];
               }
               else
               {
                  altList = [NodeGenerator.EXIT_W,NodeGenerator.EXIT_E,NodeGenerator.EXIT_N];
               }
            }
            else if(dir == NodeGenerator.EXIT_E && !QuestEngine.hasTerritory(startTerr.x + 1,startTerr.y))
            {
               if(ydiff > 0)
               {
                  altList = [NodeGenerator.EXIT_S,NodeGenerator.EXIT_N,NodeGenerator.EXIT_W];
               }
               else
               {
                  altList = [NodeGenerator.EXIT_N,NodeGenerator.EXIT_S,NodeGenerator.EXIT_W];
               }
            }
            else if(dir == NodeGenerator.EXIT_W && !QuestEngine.hasTerritory(startTerr.x - 1,startTerr.y))
            {
               if(ydiff > 0)
               {
                  altList = [NodeGenerator.EXIT_S,NodeGenerator.EXIT_N,NodeGenerator.EXIT_E];
               }
               else
               {
                  altList = [NodeGenerator.EXIT_N,NodeGenerator.EXIT_S,NodeGenerator.EXIT_E];
               }
            }
            if(altList != null)
            {
               max = int(altList.length);
               for(i = 0; i < max; i++)
               {
                  altDir = int(altList[i]);
                  if(Boolean(altDir == NodeGenerator.EXIT_N) && Boolean(QuestEngine.hasTerritory(startTerr.x,startTerr.y - 1)) || Boolean(altDir == NodeGenerator.EXIT_S) && Boolean(QuestEngine.hasTerritory(startTerr.x,startTerr.y + 1)) || Boolean(altDir == NodeGenerator.EXIT_E) && Boolean(QuestEngine.hasTerritory(startTerr.x + 1,startTerr.y)) || Boolean(altDir == NodeGenerator.EXIT_W) && Boolean(QuestEngine.hasTerritory(startTerr.x - 1,startTerr.y)))
                  {
                     dir = altDir;
                     break;
                  }
               }
            }
         }
         this.aStarRoomList.length = 0;
         return dir;
      }
      
      internal function nextOutsidePath(fromx:int, fromy:int, thisx:int, thisy:int, dest:Point, dist:int) : *
      {
         var searchOrder:Array = null;
         var searchDir:int = 0;
         var i:int = 0;
         if(this.stopSearching)
         {
            return false;
         }
         if(dist > 8)
         {
            return false;
         }
         if(!QuestEngine.hasTerritory(thisx + 341,thisy + 341))
         {
            return false;
         }
         if(this.aStarRoomList[thisx] == null)
         {
            this.aStarRoomList[thisx] = new Array();
         }
         if(this.aStarRoomList[thisx][thisy] == null)
         {
            this.aStarRoomList[thisx][thisy] = new AStarRoom();
         }
         var aStarRoom:AStarRoom = this.aStarRoomList[thisx][thisy];
         dist++;
         if(aStarRoom.dist > dist)
         {
            aStarRoom.dist = dist;
            aStarRoom.setFrom(fromx,fromy);
            if(thisx == dest.x && thisy == dest.y)
            {
               this.destReached = true;
               if(dist <= 3)
               {
                  this.stopSearching = true;
               }
               return;
            }
            searchOrder = new Array();
            if(dest.x > thisx)
            {
               searchOrder.push(NodeGenerator.EXIT_E);
               if(dest.y > thisy)
               {
                  searchOrder.push(NodeGenerator.EXIT_S);
                  searchOrder.push(NodeGenerator.EXIT_N);
               }
               else
               {
                  searchOrder.push(NodeGenerator.EXIT_N);
                  searchOrder.push(NodeGenerator.EXIT_S);
               }
               searchOrder.push(NodeGenerator.EXIT_W);
            }
            else if(dest.x < thisx)
            {
               searchOrder.push(NodeGenerator.EXIT_W);
               if(dest.y > thisy)
               {
                  searchOrder.push(NodeGenerator.EXIT_S);
                  searchOrder.push(NodeGenerator.EXIT_N);
               }
               else
               {
                  searchOrder.push(NodeGenerator.EXIT_N);
                  searchOrder.push(NodeGenerator.EXIT_S);
               }
               searchOrder.push(NodeGenerator.EXIT_E);
            }
            else if(dest.x == thisx)
            {
               if(dest.y > thisy)
               {
                  searchOrder.push(NodeGenerator.EXIT_S);
                  if(dest.x > thisx)
                  {
                     searchOrder.push(NodeGenerator.EXIT_E);
                     searchOrder.push(NodeGenerator.EXIT_W);
                  }
                  else
                  {
                     searchOrder.push(NodeGenerator.EXIT_W);
                     searchOrder.push(NodeGenerator.EXIT_E);
                  }
                  searchOrder.push(NodeGenerator.EXIT_N);
               }
               else
               {
                  searchOrder.push(NodeGenerator.EXIT_N);
                  if(dest.x > thisx)
                  {
                     searchOrder.push(NodeGenerator.EXIT_E);
                     searchOrder.push(NodeGenerator.EXIT_W);
                  }
                  else
                  {
                     searchOrder.push(NodeGenerator.EXIT_W);
                     searchOrder.push(NodeGenerator.EXIT_E);
                  }
                  searchOrder.push(NodeGenerator.EXIT_S);
               }
            }
            for(i = 0; i < 4; i++)
            {
               searchDir = int(searchOrder[i]);
               if(searchDir == NodeGenerator.EXIT_N)
               {
                  this.nextOutsidePath(thisx,thisy,thisx,thisy - 1,dest,dist);
               }
               else if(searchDir == NodeGenerator.EXIT_S)
               {
                  this.nextOutsidePath(thisx,thisy,thisx,thisy + 1,dest,dist);
               }
               else if(searchDir == NodeGenerator.EXIT_E)
               {
                  this.nextOutsidePath(thisx,thisy,thisx + 1,thisy,dest,dist);
               }
               else if(searchDir == NodeGenerator.EXIT_W)
               {
                  this.nextOutsidePath(thisx,thisy,thisx - 1,thisy,dest,dist);
               }
            }
         }
      }
      
      internal function drawPath(pathStart:Point, pathEnd:Point, outside:Boolean) : *
      {
         var current:Point = null;
         var j:int = 0;
         var minimapRoom2:BigmapRoom = null;
         this.aStarRoomList = new Array();
         for(var i:int = 0; i < 6; i++)
         {
            this.aStarRoomList[i] = new Array(6);
            for(j = 0; j < 6; j++)
            {
               this.aStarRoomList[i][j] = new AStarRoom();
            }
         }
         this.destReached = false;
         this.stopSearching = false;
         this.nextPath(pathStart.x,pathStart.y,pathStart.x,pathStart.y,pathEnd,0);
         var aStarRoom:AStarRoom = this.aStarRoomList[pathEnd.x][pathEnd.y];
         var route:Array = new Array();
         this.canvas.graphics.lineStyle(2,15658734);
         var minimapRoom:BigmapRoom = this.minimapRoomList[pathEnd.x][pathEnd.y];
         if(outside)
         {
            if(pathEnd.x == 0)
            {
               this.drawDottedLine(8 - 77,minimapRoom.y,minimapRoom.x,minimapRoom.y);
            }
            else if(pathEnd.x == 5)
            {
               this.drawDottedLine(145 - 77,minimapRoom.y,minimapRoom.x,minimapRoom.y);
            }
            else if(pathEnd.y == 0)
            {
               this.drawDottedLine(minimapRoom.x,13 - 77,minimapRoom.x,minimapRoom.y);
            }
            else if(pathEnd.y == 5)
            {
               this.drawDottedLine(minimapRoom.x,144 - 77,minimapRoom.x,minimapRoom.y);
            }
         }
         route.push(pathEnd);
         if(this.destReached)
         {
            do
            {
               current = aStarRoom.from;
               route.push(current);
               aStarRoom = this.aStarRoomList[current.x][current.y];
            }
            while(!current.equals(pathStart));
            for(i = 0; i < route.length - 1; i++)
            {
               minimapRoom = this.minimapRoomList[route[i].x][route[i].y];
               minimapRoom2 = this.minimapRoomList[route[i + 1].x][route[i + 1].y];
               this.drawDottedLine(minimapRoom.x,minimapRoom.y,minimapRoom2.x,minimapRoom2.y);
            }
         }
         else
         {
            trace("cannot reach");
         }
         this.aStarRoomList.length = 0;
      }
      
      internal function drawDottedLine(startx:*, starty:*, endx:*, endy:*) : *
      {
         var temp:int = 0;
         if(endx < startx)
         {
            temp = endx;
            endx = startx;
            startx = temp;
         }
         else if(endy < starty)
         {
            temp = endy;
            endy = starty;
            starty = temp;
         }
         this.canvas.graphics.moveTo(startx,starty);
         if(starty == endy)
         {
            do
            {
               startx += 2;
               this.canvas.graphics.lineTo(startx,starty);
               startx += 4;
               this.canvas.graphics.moveTo(startx,starty);
            }
            while(startx < endx);
         }
         else if(startx == endx)
         {
            do
            {
               starty += 2;
               this.canvas.graphics.lineTo(startx,starty);
               starty += 4;
               this.canvas.graphics.moveTo(startx,starty);
            }
            while(starty < endy);
         }
      }
      
      internal function nextPath(fromx:int, fromy:int, thisx:int, thisy:int, dest:Point, dist:int) : *
      {
         var searchOrder:Array = null;
         var searchDir:int = 0;
         var i:int = 0;
         var room:BigmapRoom = null;
         if(this.stopSearching)
         {
            return false;
         }
         if(thisx < 0 || thisx > 5 || thisy < 0 || thisy > 5)
         {
            return false;
         }
         var aStarRoom:AStarRoom = this.aStarRoomList[thisx][thisy];
         dist++;
         if(aStarRoom.dist > dist)
         {
            aStarRoom.dist = dist;
            aStarRoom.setFrom(fromx,fromy);
            if(thisx == dest.x && thisy == dest.y)
            {
               this.destReached = true;
               if(dist <= 3)
               {
                  this.stopSearching = true;
               }
               return;
            }
            searchOrder = new Array();
            if(dest.x > thisx)
            {
               searchOrder.push(NodeGenerator.EXIT_E);
               if(dest.y > thisy)
               {
                  searchOrder.push(NodeGenerator.EXIT_S);
                  searchOrder.push(NodeGenerator.EXIT_N);
               }
               else
               {
                  searchOrder.push(NodeGenerator.EXIT_N);
                  searchOrder.push(NodeGenerator.EXIT_S);
               }
               searchOrder.push(NodeGenerator.EXIT_W);
            }
            else if(dest.x < thisx)
            {
               searchOrder.push(NodeGenerator.EXIT_W);
               if(dest.y > thisy)
               {
                  searchOrder.push(NodeGenerator.EXIT_S);
                  searchOrder.push(NodeGenerator.EXIT_N);
               }
               else
               {
                  searchOrder.push(NodeGenerator.EXIT_N);
                  searchOrder.push(NodeGenerator.EXIT_S);
               }
               searchOrder.push(NodeGenerator.EXIT_E);
            }
            else if(dest.x == thisx)
            {
               if(dest.y > thisy)
               {
                  searchOrder.push(NodeGenerator.EXIT_S);
                  if(dest.x > thisx)
                  {
                     searchOrder.push(NodeGenerator.EXIT_E);
                     searchOrder.push(NodeGenerator.EXIT_W);
                  }
                  else
                  {
                     searchOrder.push(NodeGenerator.EXIT_W);
                     searchOrder.push(NodeGenerator.EXIT_E);
                  }
                  searchOrder.push(NodeGenerator.EXIT_N);
               }
               else
               {
                  searchOrder.push(NodeGenerator.EXIT_N);
                  if(dest.x > thisx)
                  {
                     searchOrder.push(NodeGenerator.EXIT_E);
                     searchOrder.push(NodeGenerator.EXIT_W);
                  }
                  else
                  {
                     searchOrder.push(NodeGenerator.EXIT_W);
                     searchOrder.push(NodeGenerator.EXIT_E);
                  }
                  searchOrder.push(NodeGenerator.EXIT_S);
               }
            }
            for(i = 0; i < 4; i++)
            {
               room = this.minimapRoomList[thisx][thisy];
               searchDir = int(searchOrder[i]);
               if(searchDir == NodeGenerator.EXIT_N && room.exits[0] == 1)
               {
                  this.nextPath(thisx,thisy,thisx,thisy - 1,dest,dist);
               }
               else if(searchDir == NodeGenerator.EXIT_S && room.exits[1] == 1)
               {
                  this.nextPath(thisx,thisy,thisx,thisy + 1,dest,dist);
               }
               else if(searchDir == NodeGenerator.EXIT_E && room.exits[2] == 1)
               {
                  this.nextPath(thisx,thisy,thisx + 1,thisy,dest,dist);
               }
               else if(searchDir == NodeGenerator.EXIT_W && room.exits[3] == 1)
               {
                  this.nextPath(thisx,thisy,thisx - 1,thisy,dest,dist);
               }
            }
         }
      }
      
      internal function getExitArrayFromObjectList(list:XMLList) : Array
      {
         var strArray:Array = null;
         var exitArray:Array = [0,0,0,0];
         if(list == null)
         {
            return exitArray;
         }
         var max:int = list.length();
         for(var i:int = 0; i < max; i++)
         {
            if(list[i].id == 0)
            {
               strArray = String(list[i].property).split(",");
               if(strArray.length >= 5)
               {
                  exitArray[int(strArray[4])] = 1;
               }
            }
         }
         return exitArray;
      }
      
      public function gotUpdateFromPlayer(posX:int, isFacingRight:Boolean) : *
      {
         if(this.isNSOrientation)
         {
            if(isFacingRight)
            {
               this.minimapPlayer.rotation = 0;
            }
            else
            {
               this.minimapPlayer.rotation = 180;
            }
            this.minimapPlayer.y = this.starty - (posX / this.roomWidth * this.mcWidth - this.mcWidth / 2);
         }
         else
         {
            if(isFacingRight)
            {
               this.minimapPlayer.rotation = 90;
            }
            else
            {
               this.minimapPlayer.rotation = -90;
            }
            this.minimapPlayer.x = this.startx + (posX / this.roomWidth * this.mcWidth - this.mcWidth / 2);
         }
      }
   }
}

