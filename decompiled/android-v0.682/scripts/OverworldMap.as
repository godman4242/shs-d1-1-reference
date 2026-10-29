package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class OverworldMap extends MovieClip
   {
      
      public static var moveSpeed:Number = 7;
      
      public var playerMCS:MCSCharacter;
      
      public var playerMCSX:Number;
      
      public var playerMCSY:Number;
      
      public var mapBGVector:Vector.<MapBG> = new Vector.<MapBG>();
      
      private var dragFlag:Boolean = false;
      
      private var moveFlag:Boolean = false;
      
      private var dragBoundary:Rectangle;
      
      public var nodeList:Vector.<GenericNode> = new Vector.<GenericNode>();
      
      public var currentID:int = -1;
      
      public var connectList:Vector.<int>;
      
      public var time:int;
      
      public var xSpeed:Number;
      
      public var ySpeed:Number;
      
      public var animating:Boolean;
      
      public var mapEnabled:Boolean = true;
      
      public var nodeSelected:int;
      
      internal var stageWidth:int;
      
      internal var stageHeight:int;
      
      public function OverworldMap()
      {
         super();
         this.mapBGVector.length = 9;
         this.mapBGVector.fixed = true;
         this.playerMCS = StatsManager.getPlayerMCS();
         this.playerMCS.showDisplayName(false);
         addChild(this.playerMCS);
         this.playerMCS.startAnim(MCSActor.IDLE_SHEATHED);
         this.playerMCS.scaleX = 0.5;
         this.playerMCS.scaleY = 0.5;
         this.playerMCS.mouseEnabled = false;
         this.animating = false;
         this.stageWidth = StatsManager.stageWidth;
         this.stageHeight = StatsManager.stageHeight;
         var mapBGWidth:int = 400;
         var mapBGHeight:int = 400;
         this.dragBoundary = new Rectangle(this.stageWidth - 3 * mapBGWidth,this.stageHeight - 3 * mapBGHeight,3 * mapBGWidth - this.stageWidth,3 * mapBGHeight - this.stageHeight);
      }
      
      public function init(currentID:int) : *
      {
         this.setCenterNode(currentID);
         this.showConnected();
         this.putSelectedArrowOn(currentID);
      }
      
      public function refreshMap() : *
      {
         this.playerMCS = StatsManager.getPlayerMCS();
         this.playerMCS.scaleX = 0.5;
         this.playerMCS.scaleY = 0.5;
         addChild(this.playerMCS);
         this.setCenterNode(this.currentID);
      }
      
      public function setCenterNode(nodeID:int) : *
      {
         var isNodeChange:Boolean = false;
         var nodeData:XMLWorldNode = null;
         isNodeChange = false;
         if(this.currentID != nodeID)
         {
            isNodeChange = true;
            this.currentID = nodeID;
         }
         nodeData = QuestEngine.getNodeData(nodeID);
         this.connectList = nodeData.connectsList;
         this.setCenterMap(nodeData.map);
         this.x = -nodeData.x;
         this.y = -nodeData.y - 160;
         this.playerMCSX = this.stageWidth / 2;
         this.playerMCSY = this.stageHeight / 2;
         this.updateSamurai();
         if(isNodeChange)
         {
            Overworld.updateNodeData(this.currentID);
            this.putSelectedArrowOn(this.currentID);
         }
      }
      
      public function setCenterMap(mapID:int) : void
      {
         this.removeEventListeners();
         var mapData:XMLWorldMap = QuestEngine.getMapSquareData(mapID);
         var mapX:int = mapData.x;
         var mapY:int = mapData.y;
         this.releaseNodeList();
         this.releaseMapVector();
         this.setMap(0,QuestEngine.getMapSquareID(mapX - 1,mapY - 1),0,0);
         this.setMap(1,QuestEngine.getMapSquareID(mapX,mapY - 1),400,0);
         this.setMap(2,QuestEngine.getMapSquareID(mapX + 1,mapY - 1),800,0);
         this.setMap(3,QuestEngine.getMapSquareID(mapX - 1,mapY),0,400);
         this.setMap(4,mapID,400,400);
         this.setMap(5,QuestEngine.getMapSquareID(mapX + 1,mapY),800,400);
         this.setMap(6,QuestEngine.getMapSquareID(mapX - 1,mapY + 1),0,800);
         this.setMap(7,QuestEngine.getMapSquareID(mapX,mapY + 1),400,800);
         this.setMap(8,QuestEngine.getMapSquareID(mapX + 1,mapY + 1),800,800);
         this.addEventListeners();
         setChildIndex(this.playerMCS,numChildren - 1);
      }
      
      private function setMap(index:int, mapID:int, mapX:int, mapY:int) : void
      {
         var newNode:GenericNode = null;
         var nodeData:XMLWorldNode = null;
         this.mapBGVector[index] = MapPool.getMap(mapID);
         this.mapBGVector[index].x = mapX;
         this.mapBGVector[index].y = mapY;
         addChild(this.mapBGVector[index]);
         if(mapID != -1)
         {
            setChildIndex(this.mapBGVector[index],0);
         }
         var mapData:Vector.<XMLWorldNode> = QuestEngine.getMapNodeData(mapID);
         var length:int = int(mapData.length);
         for(var i:int = 0; i < length; i++)
         {
            nodeData = mapData[i];
            if(nodeData.type == 0 || nodeData.type == 6)
            {
               newNode = NodePool.createTownNode();
            }
            else
            {
               newNode = NodePool.createMapNode();
            }
            newNode.buttonMode = true;
            newNode.x = mapX + nodeData.x;
            newNode.y = mapY + nodeData.y;
            newNode.ID = nodeData.id;
            addChild(newNode);
            this.nodeList.push(newNode);
            newNode.addEventListener(MouseEvent.CLICK,this.onClickButton);
         }
      }
      
      private function updateSamurai() : void
      {
         this.playerMCS.x = -this.x + this.playerMCSX;
         this.playerMCS.y = -this.y + this.playerMCSY;
      }
      
      private function releaseNodeList() : *
      {
         var node:GenericNode = null;
         var max:int = int(this.nodeList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            node = this.nodeList.pop();
            removeChild(node);
            node.showSelectedArrow(false);
            if(node.nodeTypeID == 0)
            {
               NodePool.deleteMapNode(node);
            }
            else
            {
               NodePool.deleteTownNode(node);
            }
         }
      }
      
      internal function releaseMapVector() : *
      {
         var max:int = int(this.mapBGVector.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.mapBGVector[i] != null)
            {
               removeChild(this.mapBGVector[i]);
               MapPool.returnMap(this.mapBGVector[i]);
            }
         }
      }
      
      public function putSelectedArrowOn(id:int) : *
      {
         var node:GenericNode = null;
         var max:int = int(this.nodeList.length);
         this.nodeSelected = id;
         for(var i:* = 0; i < max; i++)
         {
            node = this.nodeList[i];
            node.showSelectedArrow(node.ID == id);
         }
      }
      
      private function onClickButton(mouseEvent:MouseEvent) : void
      {
         var nextID:int = 0;
         var connectedflag:Boolean = false;
         var connectlength:int = 0;
         var i:int = 0;
         if(!this.mapEnabled)
         {
            return;
         }
         if(!this.animating)
         {
            OverworldHUD.instance.showNodeUI(false);
            nextID = int(mouseEvent.target.ID);
            connectedflag = false;
            this.putSelectedArrowOn(nextID);
            if(nextID == this.currentID)
            {
               Overworld.updateNodeData(this.currentID);
               Overworld.showNodeUI();
            }
            else
            {
               connectlength = int(this.connectList.length);
               for(i = 0; i < connectlength; i++)
               {
                  if(this.connectList[i] == nextID)
                  {
                     connectedflag = true;
                     break;
                  }
               }
               Overworld.displayNodeContents(nextID,connectedflag);
               Overworld.showNodeUI();
            }
         }
      }
      
      internal function clearConnected() : *
      {
         var max:int = int(this.nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            this.nodeList[i].setConnected(true);
         }
      }
      
      internal function showConnected() : *
      {
         var i:int = 0;
         var node:GenericNode = null;
         var connected:Boolean = false;
         var q:int = 0;
         var max:int = int(this.nodeList.length);
         var connectlength:int = int(this.connectList.length);
         var playerlocation:* = StatsManager.getLocation();
         for(i = 0; i < max; i++)
         {
            connected = false;
            node = this.nodeList[i];
            q = 0;
            while(q < connectlength && !connected)
            {
               if(this.connectList[q] == node.ID)
               {
                  connected = true;
               }
               q++;
            }
            if(node.ID == playerlocation)
            {
               connected = true;
            }
            node.setConnected(connected);
         }
      }
      
      public function enableNodes(flag:Boolean) : *
      {
         var max:int = int(this.nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            this.nodeList[i].mouseEnabled = flag;
         }
      }
      
      public function clearArrows() : *
      {
         var max:int = int(this.nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            this.nodeList[i].showSelectedArrow(false);
         }
      }
      
      public function setAnimation(nextID:int) : void
      {
         var currentNode:GenericNode = null;
         var nextNode:GenericNode = null;
         OverworldHUD.instance.visible = false;
         NodeUI.instance.visible = false;
         this.setCenterNode(this.currentID);
         var length:int = int(this.nodeList.length);
         for(var i:int = 0; i < length; i++)
         {
            if(this.nodeList[i].ID == this.currentID)
            {
               currentNode = this.nodeList[i];
            }
            else if(this.nodeList[i].ID == nextID)
            {
               nextNode = this.nodeList[i];
            }
         }
         var xDistance:Number = currentNode.x - nextNode.x;
         var yDistance:Number = currentNode.y - nextNode.y;
         var distance:Number = Math.sqrt(xDistance * xDistance + yDistance * yDistance);
         this.time = distance / moveSpeed;
         this.xSpeed = xDistance / this.time;
         if(this.xSpeed > 0)
         {
            this.playerMCS.scaleX = -0.5;
         }
         else
         {
            this.playerMCS.scaleX = 0.5;
         }
         this.playerMCS.startAnim(MCSActor.WALK_SHEATHED);
         this.ySpeed = yDistance / this.time;
         this.currentID = nextID;
         this.removeEventListeners();
         this.putSelectedArrowOn(this.nodeSelected);
         this.animating = true;
      }
      
      public function update() : void
      {
         if(this.animating)
         {
            this.x += this.xSpeed;
            this.y += this.ySpeed;
            --this.time;
            this.updateMap();
            this.updateSamurai();
            this.playerMCS.updateAnimation();
            if(this.time == 0)
            {
               this.animating = false;
               this.setCenterNode(this.currentID);
               this.addEventListeners();
               OverworldHUD.instance.visible = true;
               Overworld.updateNodeData(this.currentID);
               this.playerMCS.startAnim(MCSActor.IDLE_SHEATHED);
               StatsManager.saveLocation(this.currentID);
               this.showConnected();
               this.putSelectedArrowOn(this.currentID);
            }
         }
      }
      
      public function setMapEnabled(flag:Boolean) : *
      {
         this.mapEnabled = flag;
         this.enableNodes(flag);
         if(flag)
         {
            this.addEventListeners();
         }
         else
         {
            this.removeEventListeners();
         }
      }
      
      public function getMapEnabled() : Boolean
      {
         return this.mapEnabled;
      }
      
      public function addEventListeners() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseUp);
         var max:int = int(this.nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            this.nodeList[i].addEventListener(MouseEvent.CLICK,this.onClickButton);
         }
      }
      
      public function removeEventListeners() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseUp);
         var max:int = int(this.nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            this.nodeList[i].removeEventListener(MouseEvent.CLICK,this.onClickButton);
         }
      }
      
      public function onMouseDown(mouseEvent:MouseEvent) : void
      {
         if(!this.animating)
         {
            this.dragFlag = true;
            this.startDrag(false,this.dragBoundary);
         }
      }
      
      public function onMouseUp(mouseEvent:MouseEvent) : void
      {
         if(!this.animating)
         {
            this.dragFlag = false;
            this.stopDrag();
            this.moveFlag = false;
         }
      }
      
      public function onMouseOver(mouseEvent:MouseEvent) : void
      {
         if(this.dragFlag)
         {
            this.startDrag(false,this.dragBoundary);
         }
      }
      
      public function onMouseMove(mouseEvent:MouseEvent) : void
      {
         if(this.dragFlag)
         {
            this.moveFlag = true;
            this.updateMap();
         }
      }
      
      private function updateMap() : void
      {
         var newPos:Boolean = false;
         var currentMapIndex:int = 4;
         if(this.x >= 0)
         {
            if(this.mapBGVector[3].mapID >= 0)
            {
               newPos = true;
               currentMapIndex = 3;
            }
         }
         else if(this.x <= -400)
         {
            if(this.mapBGVector[5].mapID >= 0)
            {
               newPos = true;
               currentMapIndex = 5;
            }
         }
         if(this.y >= 0)
         {
            if(this.mapBGVector[currentMapIndex - 3].mapID >= 0)
            {
               newPos = true;
               currentMapIndex -= 3;
            }
         }
         else if(this.y <= -720)
         {
            if(this.mapBGVector[currentMapIndex + 3].mapID >= 0)
            {
               newPos = true;
               currentMapIndex += 3;
            }
         }
         if(newPos)
         {
            this.setCenterMap(this.mapBGVector[currentMapIndex].mapID);
            switch(int(currentMapIndex / 3))
            {
               case 0:
                  this.y -= 400;
                  if(this.dragFlag)
                  {
                     this.playerMCS.y += 400;
                  }
                  break;
               case 2:
                  this.y += 400;
                  if(this.dragFlag)
                  {
                     this.playerMCS.y -= 400;
                  }
            }
            switch(int(currentMapIndex % 3))
            {
               case 0:
                  this.x -= 400;
                  if(this.dragFlag)
                  {
                     this.playerMCS.x += 400;
                  }
                  break;
               case 2:
                  this.x += 400;
                  if(this.dragFlag)
                  {
                     this.playerMCS.x -= 400;
                  }
            }
            if(!this.dragFlag)
            {
               this.updateSamurai();
            }
            this.putSelectedArrowOn(this.nodeSelected);
            if(this.animating)
            {
               this.showConnected();
            }
            else
            {
               this.showConnected();
            }
         }
      }
   }
}

