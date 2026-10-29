package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2609")]
   public class Minimap extends MovieClip
   {
      
      public static var instance:Minimap;
      
      public var southlabel:TextField;
      
      public var sectorlabel:TextField;
      
      public var minimapPlayer:MovieClip;
      
      public var northlabel:TextField;
      
      public var eastlabel:TextField;
      
      public var canvas:Canvas;
      
      public var westlabel:TextField;
      
      internal var minimapRoomList:Array = new Array();
      
      internal var isNSOrientation:Boolean;
      
      internal var roomWidth:int;
      
      internal var mcWidth:int;
      
      public function Minimap()
      {
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
         for(var i:int = 0; i < 5; i++)
         {
            this.minimapRoomList[i] = new MinimapRoom();
            this.minimapRoomList[i].visible = false;
            this.canvas.addChild(this.minimapRoomList[i]);
         }
      }
      
      public static function getInstance() : Minimap
      {
         if(instance == null)
         {
            new Minimap();
         }
         return instance;
      }
      
      public static function isRoomNSOrientation(exitarray:Array, enterFrom:int) : Boolean
      {
         if(enterFrom == -2)
         {
            return true;
         }
         if(enterFrom == -3)
         {
            return false;
         }
         var ns:int = exitarray[NodeGenerator.EXIT_N] + exitarray[NodeGenerator.EXIT_S];
         var ew:int = exitarray[NodeGenerator.EXIT_E] + exitarray[NodeGenerator.EXIT_W];
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
            return enterFrom == NodeGenerator.EXIT_N || enterFrom == NodeGenerator.EXIT_S;
         }
         return false;
      }
      
      public function setRoomId(nodeid:int, roomid:int, roomDataArray:Array) : *
      {
         var destId:int = 0;
         var destExits:Array = null;
         var enterFrom:int = 0;
         var roomData:XMLRoomData = null;
         var roomObjects:XMLList = null;
         var centerRoom:MinimapRoom = null;
         var territory:Point = NodeGenerator.instance.getTerritory(nodeid);
         var sector:Point = NodeGenerator.instance.getTerritorySector(nodeid);
         this.sectorlabel.text = LangManager.getString(557) + "(" + (territory.x - 341 + WarSelectUI.DTERRSHIFTX) + "," + (territory.y - 341 + WarSelectUI.DTERRSHIFTY) + ")\nInside " + LangManager.getString(319) + "(" + sector.x + "," + sector.y + ")";
         var nodeGenerator:NodeGenerator = NodeGenerator.getInstance();
         var destArray:Array = this.getExitArrayFromObjectList(roomDataArray[roomid].getObjectList(),true);
         for(var i:int = 0; i < 5; i++)
         {
            if(i == 4)
            {
               destId = roomid;
            }
            else
            {
               destId = int(destArray[i]);
            }
            roomData = roomDataArray[destId];
            if(roomData != null)
            {
               this.roomWidth = roomData.getWidth();
               roomObjects = roomData.getObjectList();
               destExits = this.getExitArrayFromObjectList(roomObjects,false);
               enterFrom = roomData.getEnterFrom();
               this.isNSOrientation = isRoomNSOrientation(destExits,enterFrom);
               this.minimapRoomList[i].initNode(this.roomWidth,this.isNSOrientation,roomData.getIcon(),roomData.roomid);
               this.minimapRoomList[i].initNodeExits(destExits);
               this.minimapRoomList[i].initNodeExitsFromXML(roomObjects);
            }
            else
            {
               this.minimapRoomList[i].setIsNullRoom(true);
            }
         }
         centerRoom = this.minimapRoomList[4];
         centerRoom.x = 0;
         centerRoom.y = 0;
         centerRoom.visible = true;
         this.isNSOrientation = centerRoom.isNSOrientation;
         this.roomWidth = centerRoom.roomWidth;
         this.mcWidth = centerRoom.mcWidth;
         for(i = 0; i < 4; i++)
         {
            centerRoom.setAdjRoomXY(this.minimapRoomList[i],i);
         }
         this.gotUpdateFromPlayer(StatsManager.getPlayer().getMapPosition(),StatsManager.getPlayer().getMCS().isFacingRight());
      }
      
      public function clearCurrentRoomIcon() : *
      {
         var centerRoom:MinimapRoom = this.minimapRoomList[4];
         if(centerRoom != null)
         {
            centerRoom.clearIcon();
         }
      }
      
      public function showCurrentRoomUnlockIcon() : *
      {
         var centerRoom:MinimapRoom = this.minimapRoomList[4];
         if(centerRoom != null)
         {
            centerRoom.showUnlockIcon();
         }
      }
      
      internal function getExitArrayFromObjectList(list:XMLList, getDest:Boolean) : Array
      {
         var strArray:Array = null;
         var exitArray:Array = [0,0,0,0];
         var destArray:Array = [0,0,0,0];
         if(list == null)
         {
            return exitArray;
         }
         var max:int = list.length();
         for(var i:int = 0; i < max; i++)
         {
            if(list[i].id == 0 || list[i].id == 22)
            {
               strArray = String(list[i].property).split(",");
               if(strArray.length >= 5)
               {
                  exitArray[int(strArray[4])] = 1;
                  destArray[int(strArray[4])] = int(strArray[0]);
               }
            }
         }
         if(!getDest)
         {
            return exitArray;
         }
         return destArray;
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
            this.canvas.y = 77 + (posX / this.roomWidth * this.mcWidth - this.mcWidth / 2);
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
            this.canvas.x = 77 - (posX / this.roomWidth * this.mcWidth - this.mcWidth / 2);
            this.canvas.y = 77;
         }
      }
   }
}

