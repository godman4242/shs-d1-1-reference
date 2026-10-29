package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class §1t8165s0§ extends MovieClip
   {
      
      public static var §1t12607s0§:Number = 7;
      
      public var playerMCS:§1t75s0§;
      
      public var playerMCSX:Number;
      
      public var playerMCSY:Number;
      
      public var mapBGVector:Vector.<§1t173s0§> = new Vector.<§1t173s0§>();
      
      private var dragFlag:Boolean = false;
      
      private var moveFlag:Boolean = false;
      
      private var dragBoundary:Rectangle;
      
      public var nodeList:Vector.<§1t172s0§> = new Vector.<§1t172s0§>();
      
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
      
      public function §1t8165s0§()
      {
         super();
         this.mapBGVector.length = 9;
         this.mapBGVector.fixed = true;
         this.playerMCS = §1t1523s0§.§1t7360s0§();
         this.playerMCS.§1t6286s0§(false);
         addChild(this.playerMCS);
         this.playerMCS.§1t1557s0§(§1t1544s0§.§1t10259s0§);
         this.playerMCS.scaleX = 0.5;
         this.playerMCS.scaleY = 0.5;
         this.playerMCS.mouseEnabled = false;
         this.animating = false;
         this.stageWidth = §1t1523s0§.stageWidth;
         this.stageHeight = §1t1523s0§.stageHeight;
         var _loc1_:int = 400;
         var _loc2_:int = 400;
         this.dragBoundary = new Rectangle(this.stageWidth - 3 * _loc1_,this.stageHeight - 3 * _loc2_,3 * _loc1_ - this.stageWidth,3 * _loc2_ - this.stageHeight);
      }
      
      public function init(param1:int) : *
      {
         this.setCenterNode(param1);
         this.showConnected();
         this.putSelectedArrowOn(param1);
      }
      
      public function refreshMap() : *
      {
         this.playerMCS = §1t1523s0§.§1t7360s0§();
         this.playerMCS.scaleX = 0.5;
         this.playerMCS.scaleY = 0.5;
         addChild(this.playerMCS);
         this.setCenterNode(this.currentID);
      }
      
      public function setCenterNode(param1:int) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:§1t72s0§ = null;
         _loc2_ = false;
         if(this.currentID != param1)
         {
            _loc2_ = true;
            this.currentID = param1;
         }
         _loc3_ = §1t1524s0§.§1t9886s0§(param1);
         this.connectList = _loc3_.§1t1179s0§;
         this.setCenterMap(_loc3_.map);
         this.x = -_loc3_.x;
         this.y = -_loc3_.y - 160;
         this.playerMCSX = this.stageWidth / 2;
         this.playerMCSY = this.stageHeight / 2;
         this.updateSamurai();
         if(_loc2_)
         {
            §1t6427s0§.§1t12468s0§(this.currentID);
            this.putSelectedArrowOn(this.currentID);
         }
      }
      
      public function setCenterMap(param1:int) : void
      {
         this.removeEventListeners();
         var _loc2_:§1t108s0§ = §1t1524s0§.§1t9888s0§(param1);
         var _loc3_:int = _loc2_.x;
         var _loc4_:int = _loc2_.y;
         this.releaseNodeList();
         this.releaseMapVector();
         this.setMap(0,§1t1524s0§.§1t9887s0§(_loc3_ - 1,_loc4_ - 1),0,0);
         this.setMap(1,§1t1524s0§.§1t9887s0§(_loc3_,_loc4_ - 1),400,0);
         this.setMap(2,§1t1524s0§.§1t9887s0§(_loc3_ + 1,_loc4_ - 1),800,0);
         this.setMap(3,§1t1524s0§.§1t9887s0§(_loc3_ - 1,_loc4_),0,400);
         this.setMap(4,param1,400,400);
         this.setMap(5,§1t1524s0§.§1t9887s0§(_loc3_ + 1,_loc4_),800,400);
         this.setMap(6,§1t1524s0§.§1t9887s0§(_loc3_ - 1,_loc4_ + 1),0,800);
         this.setMap(7,§1t1524s0§.§1t9887s0§(_loc3_,_loc4_ + 1),400,800);
         this.setMap(8,§1t1524s0§.§1t9887s0§(_loc3_ + 1,_loc4_ + 1),800,800);
         this.§1t5004s0§();
         setChildIndex(this.playerMCS,numChildren - 1);
      }
      
      private function setMap(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:§1t172s0§ = null;
         var _loc8_:§1t72s0§ = null;
         this.mapBGVector[param1] = §1t2300s0§.§1t9318s0§(param2);
         this.mapBGVector[param1].x = param3;
         this.mapBGVector[param1].y = param4;
         addChild(this.mapBGVector[param1]);
         if(param2 != -1)
         {
            setChildIndex(this.mapBGVector[param1],0);
         }
         var _loc5_:Vector.<§1t72s0§> = §1t1524s0§.§1t9884s0§(param2);
         var _loc6_:int = int(_loc5_.length);
         var _loc9_:int = 0;
         while(_loc9_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc9_];
            if(_loc8_.type == 0 || _loc8_.type == 6)
            {
               _loc7_ = §1t2299s0§.createTownNode();
            }
            else
            {
               _loc7_ = §1t2299s0§.createMapNode();
            }
            _loc7_.buttonMode = true;
            _loc7_.x = param3 + _loc8_.x;
            _loc7_.y = param4 + _loc8_.y;
            _loc7_.ID = _loc8_.id;
            addChild(_loc7_);
            this.nodeList.push(_loc7_);
            _loc7_.addEventListener(MouseEvent.CLICK,this.onClickButton);
            _loc9_++;
         }
      }
      
      private function updateSamurai() : void
      {
         this.playerMCS.x = -this.x + this.playerMCSX;
         this.playerMCS.y = -this.y + this.playerMCSY;
      }
      
      private function releaseNodeList() : *
      {
         var _loc2_:§1t172s0§ = null;
         var _loc1_:int = int(this.nodeList.length);
         var _loc3_:* = int(_loc1_ - 1);
         while(_loc3_ >= 0)
         {
            _loc2_ = this.nodeList.pop();
            removeChild(_loc2_);
            _loc2_.§1t8154s0§(false);
            if(_loc2_.§1t8152s0§ == 0)
            {
               §1t2299s0§.deleteMapNode(_loc2_);
            }
            else
            {
               §1t2299s0§.deleteTownNode(_loc2_);
            }
            _loc3_--;
         }
      }
      
      internal function releaseMapVector() : *
      {
         var _loc1_:int = int(this.mapBGVector.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this.mapBGVector[_loc2_] != null)
            {
               removeChild(this.mapBGVector[_loc2_]);
               §1t2300s0§.returnMap(this.mapBGVector[_loc2_]);
            }
            _loc2_++;
         }
      }
      
      public function putSelectedArrowOn(param1:int) : *
      {
         var _loc3_:§1t172s0§ = null;
         var _loc2_:int = int(this.nodeList.length);
         this.nodeSelected = param1;
         var _loc4_:* = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.nodeList[_loc4_];
            _loc3_.§1t8154s0§(_loc3_.ID == param1);
            _loc4_++;
         }
      }
      
      private function onClickButton(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!this.mapEnabled)
         {
            return;
         }
         if(!this.animating)
         {
            §1t406s0§.instance.§1t6575s0§(false);
            _loc2_ = int(param1.target.ID);
            _loc3_ = false;
            this.putSelectedArrowOn(_loc2_);
            if(_loc2_ == this.currentID)
            {
               §1t6427s0§.§1t12468s0§(this.currentID);
               §1t6427s0§.§1t6575s0§();
            }
            else
            {
               _loc4_ = int(this.connectList.length);
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  if(this.connectList[_loc5_] == _loc2_)
                  {
                     _loc3_ = true;
                     break;
                  }
                  _loc5_++;
               }
               §1t6427s0§.§1t12469s0§(_loc2_,_loc3_);
               §1t6427s0§.§1t6575s0§();
            }
         }
      }
      
      internal function clearConnected() : *
      {
         var _loc1_:int = int(this.nodeList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.nodeList[_loc2_].§1t8155s0§(true);
            _loc2_++;
         }
      }
      
      internal function showConnected() : *
      {
         var _loc2_:int = 0;
         var _loc4_:§1t172s0§ = null;
         var _loc5_:Boolean = false;
         var _loc7_:int = 0;
         var _loc1_:int = int(this.nodeList.length);
         var _loc3_:int = int(this.connectList.length);
         var _loc6_:* = §1t1523s0§.§1t2218s0§();
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc5_ = false;
            _loc4_ = this.nodeList[_loc2_];
            _loc7_ = 0;
            while(_loc7_ < _loc3_ && !_loc5_)
            {
               if(this.connectList[_loc7_] == _loc4_.ID)
               {
                  _loc5_ = true;
               }
               _loc7_++;
            }
            if(_loc4_.ID == _loc6_)
            {
               _loc5_ = true;
            }
            _loc4_.§1t8155s0§(_loc5_);
            _loc2_++;
         }
      }
      
      public function enableNodes(param1:Boolean) : *
      {
         var _loc2_:int = int(this.nodeList.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.nodeList[_loc3_].mouseEnabled = param1;
            _loc3_++;
         }
      }
      
      public function clearArrows() : *
      {
         var _loc1_:int = int(this.nodeList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.nodeList[_loc2_].§1t8154s0§(false);
            _loc2_++;
         }
      }
      
      public function setAnimation(param1:int) : void
      {
         var _loc2_:§1t172s0§ = null;
         var _loc3_:§1t172s0§ = null;
         §1t406s0§.instance.visible = false;
         §1t407s0§.instance.visible = false;
         this.setCenterNode(this.currentID);
         var _loc4_:int = int(this.nodeList.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(this.nodeList[_loc5_].ID == this.currentID)
            {
               _loc2_ = this.nodeList[_loc5_];
            }
            else if(this.nodeList[_loc5_].ID == param1)
            {
               _loc3_ = this.nodeList[_loc5_];
            }
            _loc5_++;
         }
         var _loc6_:Number = _loc2_.x - _loc3_.x;
         var _loc7_:Number = _loc2_.y - _loc3_.y;
         var _loc8_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_);
         this.time = _loc8_ / §1t12607s0§;
         this.xSpeed = _loc6_ / this.time;
         if(this.xSpeed > 0)
         {
            this.playerMCS.scaleX = -0.5;
         }
         else
         {
            this.playerMCS.scaleX = 0.5;
         }
         this.playerMCS.§1t1557s0§(§1t1544s0§.§1t10269s0§);
         this.ySpeed = _loc7_ / this.time;
         this.currentID = param1;
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
            this.playerMCS.§1t3268s0§();
            if(this.time == 0)
            {
               this.animating = false;
               this.setCenterNode(this.currentID);
               this.§1t5004s0§();
               §1t406s0§.instance.visible = true;
               §1t6427s0§.§1t12468s0§(this.currentID);
               this.playerMCS.§1t1557s0§(§1t1544s0§.§1t10259s0§);
               §1t1523s0§.§1t9763s0§(this.currentID);
               this.showConnected();
               this.putSelectedArrowOn(this.currentID);
            }
         }
      }
      
      public function §1t8196s0§(param1:Boolean) : *
      {
         this.mapEnabled = param1;
         this.enableNodes(param1);
         if(param1)
         {
            this.§1t5004s0§();
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
      
      public function §1t5004s0§() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.MOUSE_OVER,this.§1t5853s0§);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseUp);
         var _loc1_:int = int(this.nodeList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.nodeList[_loc2_].addEventListener(MouseEvent.CLICK,this.onClickButton);
            _loc2_++;
         }
      }
      
      public function removeEventListeners() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         removeEventListener(MouseEvent.MOUSE_OVER,this.§1t5853s0§);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseUp);
         var _loc1_:int = int(this.nodeList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.nodeList[_loc2_].removeEventListener(MouseEvent.CLICK,this.onClickButton);
            _loc2_++;
         }
      }
      
      public function onMouseDown(param1:MouseEvent) : void
      {
         if(!this.animating)
         {
            this.dragFlag = true;
            this.startDrag(false,this.dragBoundary);
         }
      }
      
      public function onMouseUp(param1:MouseEvent) : void
      {
         if(!this.animating)
         {
            this.dragFlag = false;
            this.stopDrag();
            this.moveFlag = false;
         }
      }
      
      public function §1t5853s0§(param1:MouseEvent) : void
      {
         if(this.dragFlag)
         {
            this.startDrag(false,this.dragBoundary);
         }
      }
      
      public function onMouseMove(param1:MouseEvent) : void
      {
         if(this.dragFlag)
         {
            this.moveFlag = true;
            this.updateMap();
         }
      }
      
      private function updateMap() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 4;
         if(this.x >= 0)
         {
            if(this.mapBGVector[3].mapID >= 0)
            {
               _loc1_ = true;
               _loc2_ = 3;
            }
         }
         else if(this.x <= -400)
         {
            if(this.mapBGVector[5].mapID >= 0)
            {
               _loc1_ = true;
               _loc2_ = 5;
            }
         }
         if(this.y >= 0)
         {
            if(this.mapBGVector[_loc2_ - 3].mapID >= 0)
            {
               _loc1_ = true;
               _loc2_ -= 3;
            }
         }
         else if(this.y <= -720)
         {
            if(this.mapBGVector[_loc2_ + 3].mapID >= 0)
            {
               _loc1_ = true;
               _loc2_ += 3;
            }
         }
         if(_loc1_)
         {
            this.setCenterMap(this.mapBGVector[_loc2_].mapID);
            switch(int(_loc2_ / 3))
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
            switch(int(_loc2_ % 3))
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

