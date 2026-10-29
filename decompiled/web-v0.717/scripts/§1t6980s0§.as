package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3555")]
   public class §1t6980s0§ extends MovieClip
   {
      
      public static var instance:§1t6980s0§;
      
      public var clearButton:SimpleButton;
      
      public var §1t5698s0§:SimpleButton;
      
      public var doSkillButton:MovieClip;
      
      public var greenCircle:MovieClip;
      
      public var node0:MovieClip;
      
      public var node1:MovieClip;
      
      public var node2:MovieClip;
      
      public var node3:MovieClip;
      
      public var node4:MovieClip;
      
      public var node5:MovieClip;
      
      public var node6:MovieClip;
      
      public var node7:MovieClip;
      
      public var redCircle:MovieClip;
      
      internal var §1t6983s0§:Vector.<int> = new Vector.<int>();
      
      internal var prev:int = -1;
      
      internal var nodeList:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var skillStr:String = "";
      
      public function §1t6980s0§()
      {
         super();
         instance = this;
         this.nodeList.push(this.node0);
         this.nodeList.push(this.node1);
         this.nodeList.push(this.node2);
         this.nodeList.push(this.node3);
         this.nodeList.push(this.node4);
         this.nodeList.push(this.node5);
         this.nodeList.push(this.node6);
         this.nodeList.push(this.node7);
         this.nodeList.fixed = true;
      }
      
      public function reset() : *
      {
         this.prev = -1;
         this.skillStr = "";
         this.§1t6983s0§.length = 0;
         var _loc1_:* = 7;
         while(_loc1_ > -1)
         {
            this.nodeList[_loc1_].gotoAndStop(1);
            _loc1_--;
         }
         this.greenCircle.visible = true;
         this.redCircle.visible = false;
         §1t1541s0§.§1t10111s0§();
         §1t1541s0§.§1t10101s0§();
         scaleX = §1t1523s0§.§1t9358s0§;
         scaleY = §1t1523s0§.§1t9358s0§;
         x = §1t1523s0§.§1t9359s0§;
         y = §1t1523s0§.§1t9360s0§;
      }
      
      public function §1t5206s0§(param1:int, param2:int) : Boolean
      {
         if(this.clearButton.hitTestPoint(param1,param2))
         {
            this.§1t6985s0§();
            return true;
         }
         if(this.§1t5698s0§.hitTestPoint(param1,param2))
         {
            this.§1t6986s0§();
            return true;
         }
         if(this.doSkillButton.hitTestPoint(param1,param2))
         {
            this.§1t6987s0§();
            return true;
         }
         return false;
      }
      
      internal function §1t6985s0§() : *
      {
         §1t1541s0§.§1t10111s0§();
         this.reset();
      }
      
      internal function §1t6986s0§() : *
      {
         if(visible)
         {
            visible = false;
            §1t1541s0§.§1t10097s0§();
         }
      }
      
      internal function §1t6987s0§() : *
      {
         var _loc1_:int = int(this.§1t6983s0§.length);
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_)
         {
            this.skillStr += this.§1t6983s0§[_loc2_].toString();
            _loc2_++;
         }
         if(this.skillStr == "012")
         {
            this.redCircle.visible = true;
            _loc2_ = 7;
            while(_loc2_ > -1)
            {
               this.nodeList[_loc2_].gotoAndStop(4);
               _loc2_--;
            }
            §1t1541s0§.§1t10111s0§();
            §1t1541s0§.§1t10102s0§();
         }
         else
         {
            this.§1t6989s0§();
            this.§1t6986s0§();
         }
      }
      
      public function §1t6988s0§(param1:int, param2:int) : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = int(this.nodeList.length);
         var _loc5_:* = int(_loc4_ - 1);
         while(_loc5_ > -1)
         {
            _loc3_ = this.nodeList[_loc5_];
            if(_loc5_ != this.prev && _loc3_.hitTestPoint(param1,param2))
            {
               this.§1t6983s0§.push(_loc5_);
               this.prev = _loc5_;
               if(_loc3_.currentFrame == 1 || _loc3_.currentFrame == 4)
               {
                  _loc3_.gotoAndStop(2);
               }
               else if(_loc3_.currentFrame == 2)
               {
                  _loc3_.gotoAndStop(3);
               }
               §1t1523s0§.§1t9586s0§().§1t4480s0§(_loc5_);
               return;
            }
            _loc5_--;
         }
      }
      
      internal function §1t6989s0§() : *
      {
         if(§1t1525s0§.§1t9947s0§())
         {
            return;
         }
         switch(this.skillStr)
         {
            case "345":
               §1t113s0§.instance.§1t5209s0§();
               break;
            case "543":
         }
      }
      
      public function §1t6990s0§(param1:§1t68s0§) : *
      {
         var _loc2_:String = this.skillStr;
         switch(0)
         {
         }
      }
   }
}

