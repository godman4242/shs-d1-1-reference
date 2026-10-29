package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §1t8322s0§ extends §1t75s0§
   {
      
      public function §1t8322s0§()
      {
         var _loc2_:MovieClip = null;
         super();
         §1t6256s0§ = 25;
         var _loc1_:int = 0;
         while(_loc1_ <= §1t6256s0§)
         {
            _loc2_ = new MovieClip();
            addChild(_loc2_);
            §1t6231s0§.push(_loc2_);
            _loc1_++;
         }
         §1t5659s0§.y = -70;
         displayName.y = -70;
         speech.y = -70;
      }
      
      override public function §1t1549s0§(param1:§1t17s0§, param2:§1t17s0§, param3:§1t17s0§, param4:§1t17s0§, param5:§1t17s0§, param6:§1t17s0§, param7:§1t17s0§, param8:§1t17s0§, param9:§1t17s0§, param10:§1t17s0§, param11:int = 0, param12:int = 0) : *
      {
         var _loc13_:int = param5.§1t483s0§();
         var _loc14_:int = param1.§1t483s0§();
         var _loc15_:int = param8.§1t483s0§();
         if(_loc13_ > 0)
         {
            this.setWolfHead(_loc13_);
         }
         else
         {
            this.setWolfHead(0);
         }
         if(_loc14_ > 0)
         {
            this.setWolfBody(_loc14_);
         }
         else
         {
            this.setWolfBody(0);
         }
         if(_loc15_ > 0)
         {
            this.setWolfLegs(_loc15_);
         }
         else
         {
            this.setWolfLegs(0);
         }
         if(_loc15_ > 0)
         {
            this.setWolfTail(_loc15_);
         }
         else
         {
            this.setWolfTail(0);
         }
      }
      
      public function setWolfHead(param1:int) : *
      {
         var _loc4_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12393s0§];
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:MovieClip = §1t6231s0§[§1t12380s0§];
         if(_loc3_.numChildren > 0)
         {
            _loc3_.removeChildAt(0);
         }
         _loc4_ = §1t6238s0§("head_wolf_",param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc4_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc4_ = §1t6238s0§("jaw_wolf_",param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc4_);
         _loc3_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
      }
      
      public function setWolfBody(param1:int) : *
      {
         var _loc6_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12389s0§];
         var _loc3_:MovieClip = §1t6231s0§[§1t12392s0§];
         var _loc4_:MovieClip = §1t6231s0§[§1t12390s0§];
         var _loc5_:MovieClip = §1t6231s0§[§1t12391s0§];
         if(_loc3_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
            _loc3_.removeChildAt(0);
            _loc4_.removeChildAt(0);
            _loc5_.removeChildAt(0);
         }
         _loc6_ = §1t6238s0§("neck_wolf_",param1);
         if(_loc6_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc6_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc6_ = §1t6238s0§("torso_wolf_",param1);
         if(_loc6_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc6_);
         _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
         _loc6_ = §1t6238s0§("stomach_wolf_",param1);
         if(_loc6_ == null)
         {
            return;
         }
         _loc4_.addChild(_loc6_);
         _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc4_.cacheAsBitmap = true;
         _loc6_ = §1t6238s0§("pelvic_wolf_",param1);
         if(_loc6_ == null)
         {
            return;
         }
         _loc5_.addChild(_loc6_);
         _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc5_.cacheAsBitmap = true;
      }
      
      public function setWolfTail(param1:int) : *
      {
         var _loc5_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12381s0§];
         var _loc3_:MovieClip = §1t6231s0§[§1t12398s0§];
         var _loc4_:MovieClip = §1t6231s0§[§1t12399s0§];
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
            _loc3_.removeChildAt(0);
            _loc4_.removeChildAt(0);
         }
         _loc5_ = §1t6238s0§("tail1_wolf_",param1);
         if(_loc5_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc5_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc5_ = §1t6238s0§("tail2_wolf_",param1);
         if(_loc5_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc5_);
         _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
         _loc5_ = §1t6238s0§("tail3_wolf_",param1);
         if(_loc5_ == null)
         {
            return;
         }
         _loc4_.addChild(_loc5_);
         _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc4_.cacheAsBitmap = true;
      }
      
      public function setWolfLegs(param1:int) : *
      {
         var _loc18_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12401s0§];
         var _loc3_:MovieClip = §1t6231s0§[§1t12396s0§];
         var _loc4_:MovieClip = §1t6231s0§[§1t12397s0§];
         var _loc5_:MovieClip = §1t6231s0§[§1t12395s0§];
         var _loc6_:MovieClip = §1t6231s0§[§1t12400s0§];
         var _loc7_:MovieClip = §1t6231s0§[§1t12378s0§];
         var _loc8_:MovieClip = §1t6231s0§[§1t12379s0§];
         var _loc9_:MovieClip = §1t6231s0§[§1t12377s0§];
         var _loc10_:MovieClip = §1t6231s0§[§1t12387s0§];
         var _loc11_:MovieClip = §1t6231s0§[§1t12403s0§];
         var _loc12_:MovieClip = §1t6231s0§[§1t12388s0§];
         var _loc13_:MovieClip = §1t6231s0§[§1t12386s0§];
         var _loc14_:MovieClip = §1t6231s0§[§1t12383s0§];
         var _loc15_:MovieClip = §1t6231s0§[§1t12402s0§];
         var _loc16_:MovieClip = §1t6231s0§[§1t12384s0§];
         var _loc17_:MovieClip = §1t6231s0§[§1t12382s0§];
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
            _loc3_.removeChildAt(0);
            _loc4_.removeChildAt(0);
            _loc5_.removeChildAt(0);
            _loc6_.removeChildAt(0);
            _loc7_.removeChildAt(0);
            _loc8_.removeChildAt(0);
            _loc9_.removeChildAt(0);
            _loc10_.removeChildAt(0);
            _loc11_.removeChildAt(0);
            _loc12_.removeChildAt(0);
            _loc13_.removeChildAt(0);
            _loc14_.removeChildAt(0);
            _loc15_.removeChildAt(0);
            _loc16_.removeChildAt(0);
            _loc17_.removeChildAt(0);
         }
         _loc18_ = §1t6238s0§("frontleg1_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc18_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg2_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc18_);
         _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg3_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc4_.addChild(_loc18_);
         _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc4_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg4_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc5_.addChild(_loc18_);
         _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc5_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg1_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc6_.addChild(_loc18_);
         _loc6_.cacheAsBitmapMatrix = _loc6_.transform.concatenatedMatrix;
         _loc6_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg2_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc7_.addChild(_loc18_);
         _loc7_.cacheAsBitmapMatrix = _loc7_.transform.concatenatedMatrix;
         _loc7_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg3_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc8_.addChild(_loc18_);
         _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
         _loc8_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("frontleg4_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc9_.addChild(_loc18_);
         _loc9_.cacheAsBitmapMatrix = _loc9_.transform.concatenatedMatrix;
         _loc9_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg1_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc10_.addChild(_loc18_);
         _loc10_.cacheAsBitmapMatrix = _loc10_.transform.concatenatedMatrix;
         _loc10_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg2_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc11_.addChild(_loc18_);
         _loc11_.cacheAsBitmapMatrix = _loc11_.transform.concatenatedMatrix;
         _loc11_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg3_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc12_.addChild(_loc18_);
         _loc12_.cacheAsBitmapMatrix = _loc12_.transform.concatenatedMatrix;
         _loc12_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg4_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc13_.addChild(_loc18_);
         _loc13_.cacheAsBitmapMatrix = _loc13_.transform.concatenatedMatrix;
         _loc13_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg1_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc14_.addChild(_loc18_);
         _loc14_.cacheAsBitmapMatrix = _loc14_.transform.concatenatedMatrix;
         _loc14_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg2_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc15_.addChild(_loc18_);
         _loc15_.cacheAsBitmapMatrix = _loc15_.transform.concatenatedMatrix;
         _loc15_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg3_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc16_.addChild(_loc18_);
         _loc16_.cacheAsBitmapMatrix = _loc16_.transform.concatenatedMatrix;
         _loc16_.cacheAsBitmap = true;
         _loc18_ = §1t6238s0§("backleg4_wolf_",param1);
         if(_loc18_ == null)
         {
            return;
         }
         _loc17_.addChild(_loc18_);
         _loc17_.cacheAsBitmapMatrix = _loc17_.transform.concatenatedMatrix;
         _loc17_.cacheAsBitmap = true;
      }
      
      override internal function §1t6277s0§() : §1t130s0§
      {
         var _loc1_:MovieClip = §1t6231s0§[§1t12393s0§];
         §1t6231s0§[§1t12393s0§] = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12380s0§];
         §1t6231s0§[§1t12380s0§] = null;
         var _loc3_:Point = _loc2_.localToGlobal(new Point(_loc2_.x,_loc2_.y));
         var _loc4_:Point = _loc1_.globalToLocal(_loc3_);
         _loc1_.addChild(_loc2_);
         _loc2_.x = _loc4_.x;
         _loc2_.y = _loc4_.y;
         var _loc5_:int = Math.random() * 10 - 5;
         var _loc6_:int = 20;
         if(_loc5_ < 0)
         {
            _loc6_ = -20;
         }
         var _loc7_:int = -Math.random() * 16 - 8;
         return §1t1712s0§.§1t6277s0§(_loc1_,_loc5_,_loc7_,_loc6_);
      }
      
      override public function §1t3305s0§() : *
      {
      }
   }
}

