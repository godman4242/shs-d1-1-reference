package
{
   import flash.display.MovieClip;
   
   public class §1t8563s0§ extends §1t8327s0§
   {
      
      public function §1t8563s0§()
      {
         var _loc2_:MovieClip = null;
         super();
         animalName = "horse";
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
      
      override public function setLegs(param1:int) : *
      {
         var _loc14_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12396s0§];
         var _loc3_:MovieClip = §1t6231s0§[§1t12397s0§];
         var _loc4_:MovieClip = §1t6231s0§[§1t12395s0§];
         var _loc5_:MovieClip = §1t6231s0§[§1t12378s0§];
         var _loc6_:MovieClip = §1t6231s0§[§1t12379s0§];
         var _loc7_:MovieClip = §1t6231s0§[§1t12377s0§];
         var _loc8_:MovieClip = §1t6231s0§[§1t12387s0§];
         var _loc9_:MovieClip = §1t6231s0§[§1t12388s0§];
         var _loc10_:MovieClip = §1t6231s0§[§1t12386s0§];
         var _loc11_:MovieClip = §1t6231s0§[§1t12383s0§];
         var _loc12_:MovieClip = §1t6231s0§[§1t12384s0§];
         var _loc13_:MovieClip = §1t6231s0§[§1t12382s0§];
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
         }
         _loc14_ = §1t6238s0§("frontlegup_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc14_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("legdown_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc14_);
         _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("frontfoot_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc4_.addChild(_loc14_);
         _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc4_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("frontlegup_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc5_.addChild(_loc14_);
         _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc5_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("legdown_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc6_.addChild(_loc14_);
         _loc6_.cacheAsBitmapMatrix = _loc6_.transform.concatenatedMatrix;
         _loc6_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("frontfoot_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc7_.addChild(_loc14_);
         _loc7_.cacheAsBitmapMatrix = _loc7_.transform.concatenatedMatrix;
         _loc7_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("backlegup_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc8_.addChild(_loc14_);
         _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
         _loc8_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("legdown_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc9_.addChild(_loc14_);
         _loc9_.cacheAsBitmapMatrix = _loc9_.transform.concatenatedMatrix;
         _loc9_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("backfoot_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc10_.addChild(_loc14_);
         _loc10_.cacheAsBitmapMatrix = _loc10_.transform.concatenatedMatrix;
         _loc10_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("backlegup_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc11_.addChild(_loc14_);
         _loc11_.cacheAsBitmapMatrix = _loc11_.transform.concatenatedMatrix;
         _loc11_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("legdown_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc12_.addChild(_loc14_);
         _loc12_.cacheAsBitmapMatrix = _loc12_.transform.concatenatedMatrix;
         _loc12_.cacheAsBitmap = true;
         _loc14_ = §1t6238s0§("backfoot_horse_",param1);
         if(_loc14_ == null)
         {
            return;
         }
         _loc13_.addChild(_loc14_);
         _loc13_.cacheAsBitmapMatrix = _loc13_.transform.concatenatedMatrix;
         _loc13_.cacheAsBitmap = true;
      }
   }
}

