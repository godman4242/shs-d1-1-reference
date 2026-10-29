package
{
   import flash.display.MovieClip;
   
   public class §1t8560s0§ extends §1t8327s0§
   {
      
      public function §1t8560s0§()
      {
         var _loc2_:MovieClip = null;
         super();
         animalName = "bear";
         var _loc1_:int = 0;
         while(_loc1_ <= §1t6256s0§)
         {
            _loc2_ = new MovieClip();
            addChild(_loc2_);
            §1t6231s0§.push(_loc2_);
            _loc1_++;
         }
         §1t5659s0§.y = -120;
         displayName.y = -120;
      }
      
      override public function §1t1549s0§(param1:§1t17s0§, param2:§1t17s0§, param3:§1t17s0§, param4:§1t17s0§, param5:§1t17s0§, param6:§1t17s0§, param7:§1t17s0§, param8:§1t17s0§, param9:§1t17s0§, param10:§1t17s0§, param11:int = 0, param12:int = 0) : *
      {
         var _loc13_:int = param5.§1t483s0§();
         var _loc14_:int = param1.§1t483s0§();
         var _loc15_:int = param8.§1t483s0§();
         if(_loc13_ > 0)
         {
            this.§1t6239s0§(_loc13_);
         }
         else
         {
            this.§1t6239s0§(0);
         }
         if(_loc14_ > 0)
         {
            setBody(_loc14_);
         }
         else
         {
            setBody(0);
         }
         if(_loc15_ > 0)
         {
            setLegs(_loc15_);
         }
         else
         {
            setLegs(0);
         }
      }
      
      override public function §1t6239s0§(param1:int) : *
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
         _loc4_ = §1t6238s0§("head_" + animalName + "_",param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc4_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc4_ = §1t6238s0§("jaw_" + animalName + "_",param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc4_);
         _loc3_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
      }
   }
}

