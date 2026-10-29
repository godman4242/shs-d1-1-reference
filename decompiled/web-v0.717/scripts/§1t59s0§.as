package
{
   import flash.display.MovieClip;
   
   public class §1t59s0§
   {
      
      public var reorder:Boolean = false;
      
      public var nodeList:Vector.<§1t1360s0§> = new Vector.<§1t1360s0§>();
      
      public function §1t59s0§(param1:XML)
      {
         super();
         if(param1.@r.toString() != "")
         {
            this.reorder = param1.@r == 1;
         }
         var _loc2_:int = param1.n.length();
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            this.nodeList.push(new §1t1360s0§(param1.n[_loc3_]));
            _loc3_--;
         }
         this.nodeList.fixed = true;
      }
      
      public function setPosition(param1:§1t75s0§) : *
      {
         var _loc3_:§1t1360s0§ = null;
         var _loc4_:int = 0;
         var _loc2_:int = int(this.nodeList.length);
         var _loc5_:* = int(_loc2_ - 1);
         while(_loc5_ >= 0)
         {
            _loc3_ = this.nodeList[_loc5_];
            _loc4_ = _loc3_.id;
            _loc3_.setPosition(param1.§1t6258s0§(_loc4_));
            if(_loc4_ == §1t75s0§.§1t12391s0§)
            {
               _loc3_.setPosition(param1.§1t6258s0§(§1t75s0§.§1t12385s0§));
            }
            else if(_loc4_ == §1t75s0§.§1t12393s0§)
            {
               _loc3_.setPosition(param1.§1t6258s0§(§1t75s0§.§1t12394s0§));
            }
            _loc5_--;
         }
         if(this.reorder)
         {
            this.reorderLayers(param1);
         }
      }
      
      public function reorderLayers(param1:§1t75s0§) : *
      {
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc2_:int = int(this.nodeList.length);
         var _loc3_:* = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            _loc4_ = this.nodeList[_loc6_].id;
            _loc5_ = param1.§1t6258s0§(_loc4_);
            param1.setChildIndex(_loc5_,_loc3_++);
            if(_loc4_ == §1t75s0§.§1t12393s0§)
            {
               param1.setChildIndex(param1.§1t6231s0§[§1t75s0§.§1t12394s0§],_loc3_++);
            }
            else if(_loc4_ == §1t75s0§.§1t12384s0§)
            {
               param1.setChildIndex(param1.§1t6231s0§[§1t75s0§.§1t12385s0§],_loc3_++);
            }
            _loc6_++;
         }
      }
      
      public function setVisible(param1:§1t75s0§) : *
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.§1t6260s0§();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            param1.§1t6258s0§(_loc3_).visible = false;
            _loc3_++;
         }
         var _loc4_:int = int(this.nodeList.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            param1.§1t6258s0§(this.nodeList[_loc3_].id).visible = true;
            _loc3_++;
         }
         param1.§1t6231s0§[§1t75s0§.§1t12394s0§].visible = true;
         param1.§1t6231s0§[§1t75s0§.§1t12385s0§].visible = true;
      }
   }
}

