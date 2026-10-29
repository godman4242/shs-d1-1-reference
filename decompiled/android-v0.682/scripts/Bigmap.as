package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2638")]
   public class Bigmap extends MovieClip
   {
      
      public static var instance:Bigmap;
      
      public var nodemark:MovieClip;
      
      public var bg:MovieClip;
      
      public var minimapPlayer:MovieClip;
      
      public var canvas:Canvas;
      
      internal var minimapRoomList:Array;
      
      internal var isNSOrientation:Boolean;
      
      internal var mcWidth:int = 16;
      
      internal var roomWidth:int;
      
      internal var nodemarkxdiff:int;
      
      internal var nodemarkydiff:int;
      
      internal var nodeid:int;
      
      public function Bigmap()
      {
         var j:int = 0;
         this.minimapRoomList = new Array();
         super();
         instance = this;
         LangManager.initTextField(this.bg.northlabel,true);
         LangManager.initTextField(this.bg.southlabel,true);
         LangManager.initTextField(this.bg.eastlabel,true);
         LangManager.initTextField(this.bg.westlabel,true);
         this.bg.northlabel.text = LangManager.getString(398);
         this.bg.southlabel.text = LangManager.getString(399);
         this.bg.eastlabel.text = LangManager.getString(400);
         this.bg.westlabel.text = LangManager.getString(401);
         for(var i:int = 0; i < 7; i++)
         {
            this.minimapRoomList[i] = new Array(7);
            for(j = 0; j < 7; j++)
            {
               this.minimapRoomList[i][j] = new BigmapRoom();
               this.canvas.addChild(this.minimapRoomList[i][j]);
               this.minimapRoomList[i][j].x = i * 20 - 77 + 17;
               this.minimapRoomList[i][j].y = j * 20 - 77 + 17;
            }
         }
      }
      
      public static function getInstance() : Bigmap
      {
         if(instance == null)
         {
            new Bigmap();
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
         var markedNode:int = 0;
         var j:int = 0;
         var markedNodeSector:Point = null;
         var currentNodeSector:Point = null;
         var xdiff:int = 0;
         var ydiff:int = 0;
         var markedNodeTerritory:Point = null;
         var currentNodeTerritory:Point = null;
         var pathStart:Point = null;
         var pathEnd:Point = null;
         var terrid:int = 0;
         this.nodeid = nodeid;
         var territory:Point = NodeGenerator.instance.getTerritory(nodeid);
         var sector:Point = NodeGenerator.instance.getSector(nodeid);
         this.bg.sectorlabel.text = "sector (" + (sector.x - 2047) + "," + (sector.y - 2047) + ")\nterritory (" + (territory.x - 341) + "," + (territory.y - 341) + ")";
         if(StatsManager.consoleEnabled)
         {
            this.bg.sectorlabel.appendText("\nt(" + territory.x + "," + territory.y + ") s(" + sector.x + "," + sector.y + ")");
         }
         var nodeGenerator:NodeGenerator = NodeGenerator.getInstance();
         markedNode = QuestGenerator.instance.getMarkedNode();
         for(var i:int = 0; i < 7; i++)
         {
            for(j = 0; j < 7; j++)
            {
               destId = nodeGenerator.getShiftedNodeId(nodeid,i - 3,j - 3);
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
                  if(i == 3 && j == 3)
                  {
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
         if(markedNode != -1)
         {
            markedNodeSector = NodeGenerator.instance.getSector(markedNode);
            currentNodeSector = NodeGenerator.instance.getSector(nodeid);
            xdiff = markedNodeSector.x - currentNodeSector.x;
            ydiff = markedNodeSector.y - currentNodeSector.y;
            this.nodemarkxdiff = xdiff * 20;
            this.nodemarkydiff = ydiff * 20;
            this.nodemark.visible = true;
            markedNodeTerritory = NodeGenerator.instance.getTerritory(markedNode);
            currentNodeTerritory = NodeGenerator.instance.getTerritory(nodeid);
            pathStart = NodeGenerator.instance.getTerritorySector(nodeid);
            if(markedNodeTerritory != currentNodeTerritory)
            {
               terrid = currentNodeTerritory.x << 12 | currentNodeTerritory.y;
               if(markedNodeTerritory.x < currentNodeTerritory.x)
               {
                  pathEnd = new Point(0,TerritoryData.getWestExits(terrid)[0]);
               }
               else if(markedNodeTerritory.x > currentNodeTerritory.x)
               {
                  pathEnd = new Point(5,TerritoryData.getEastExits(terrid)[0]);
               }
               else if(markedNodeTerritory.y < currentNodeTerritory.y)
               {
                  pathEnd = new Point(TerritoryData.getNorthExits(terrid)[0],0);
               }
               else if(markedNodeTerritory.y > currentNodeTerritory.y)
               {
                  pathEnd = new Point(TerritoryData.getSouthExits(terrid)[0],5);
               }
            }
            else
            {
               pathEnd = NodeGenerator.instance.getTerritorySector(markedNode);
            }
            this.drawPath(pathStart,pathEnd);
         }
         else
         {
            this.nodemark.visible = false;
         }
         this.gotUpdateFromPlayer(StatsManager.getPlayer().getMapPosition(),StatsManager.getPlayer().getMCS().isFacingRight());
      }
      
      internal function drawPath(pathStart:Point, pathEnd:Point) : *
      {
         trace(pathStart + " to " + pathEnd);
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
         var outside:Boolean = false;
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
            this.canvas.y = 77 + (posX / this.roomWidth * this.mcWidth - this.mcWidth / 2 + 2);
            this.canvas.x = 77;
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
            this.canvas.x = 77 - (posX / this.roomWidth * this.mcWidth - this.mcWidth / 2 + 2);
            this.canvas.y = 77;
         }
         if(this.nodemark.visible)
         {
            this.nodemark.x = this.canvas.x + this.nodemarkxdiff;
            this.nodemark.y = this.canvas.y + this.nodemarkydiff;
            outside = false;
            this.nodemark.rotation = 0;
            if(this.nodemark.x < 7)
            {
               this.nodemark.x = 7;
               outside = true;
               this.nodemark.rotation = -90;
            }
            else if(this.nodemark.x > 145)
            {
               this.nodemark.x = 145;
               outside = true;
               this.nodemark.rotation = 90;
            }
            if(this.nodemark.y < 11)
            {
               this.nodemark.y = 11;
               outside = true;
               if(this.nodemark.rotation == -90)
               {
                  this.nodemark.rotation = -45;
               }
               else if(this.nodemark.rotation == 90)
               {
                  this.nodemark.rotation = 45;
               }
               else
               {
                  this.nodemark.rotation = 0;
               }
            }
            else if(this.nodemark.y > 142)
            {
               this.nodemark.y = 142;
               outside = true;
               if(this.nodemark.rotation == -90)
               {
                  this.nodemark.rotation = 225;
               }
               else if(this.nodemark.rotation == 90)
               {
                  this.nodemark.rotation = 135;
               }
               else
               {
                  this.nodemark.rotation = 180;
               }
            }
            if(outside)
            {
               this.nodemark.gotoAndStop(2);
            }
            else
            {
               this.nodemark.gotoAndStop(1);
            }
         }
      }
   }
}

