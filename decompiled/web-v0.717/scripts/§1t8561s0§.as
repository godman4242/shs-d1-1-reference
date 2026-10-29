package
{
   import flash.display.MovieClip;
   
   public class §1t8561s0§ extends §1t8327s0§
   {
      
      public static var §1t12621s0§:* = 21;
      
      public static var §1t12622s0§:* = 22;
      
      public static var §1t12623s0§:* = 23;
      
      public static var §1t12624s0§:* = 24;
      
      public static var §1t12625s0§:* = 12;
      
      public static var §1t12626s0§:* = 10;
      
      public static var §1t12627s0§:* = 6;
      
      public static var §1t12628s0§:* = 4;
      
      public function §1t8561s0§()
      {
         var _loc2_:MovieClip = null;
         super();
         §1t6256s0§ = 25;
         animalName = "spider";
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
      
      override public function setBody(param1:int) : *
      {
         var _loc4_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12392s0§];
         var _loc3_:MovieClip = §1t6231s0§[§1t12380s0§];
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
            _loc3_.removeChildAt(0);
         }
         _loc4_ = §1t6238s0§("torso_" + animalName + "_",param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc4_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc4_ = §1t6238s0§("weapon_" + animalName + "_",param1);
         _loc3_.addChild(_loc4_);
         _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
      }
      
      override public function setLegs(param1:int) : *
      {
         var _loc20_:MovieClip = null;
         var _loc2_:MovieClip = §1t6231s0§[§1t12396s0§];
         var _loc3_:MovieClip = §1t6231s0§[§1t12397s0§];
         var _loc4_:MovieClip = §1t6231s0§[§1t12395s0§];
         var _loc5_:MovieClip = §1t6231s0§[§1t12378s0§];
         var _loc6_:MovieClip = §1t6231s0§[§1t12379s0§];
         var _loc7_:MovieClip = §1t6231s0§[§1t12377s0§];
         var _loc8_:MovieClip = §1t6231s0§[§1t12388s0§];
         var _loc9_:MovieClip = §1t6231s0§[§1t12386s0§];
         var _loc10_:MovieClip = §1t6231s0§[§1t12384s0§];
         var _loc11_:MovieClip = §1t6231s0§[§1t12382s0§];
         var _loc12_:MovieClip = §1t6231s0§[§1t12622s0§];
         var _loc13_:MovieClip = §1t6231s0§[§1t12621s0§];
         var _loc14_:MovieClip = §1t6231s0§[§1t12624s0§];
         var _loc15_:MovieClip = §1t6231s0§[§1t12623s0§];
         var _loc16_:MovieClip = §1t6231s0§[§1t12626s0§];
         var _loc17_:MovieClip = §1t6231s0§[§1t12625s0§];
         var _loc18_:MovieClip = §1t6231s0§[§1t12628s0§];
         var _loc19_:MovieClip = §1t6231s0§[§1t12627s0§];
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
            _loc18_.removeChildAt(0);
            _loc19_.removeChildAt(0);
         }
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         if(_loc20_ == null)
         {
            return;
         }
         _loc2_.addChild(_loc20_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc5_.addChild(_loc20_);
         _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc5_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc8_.addChild(_loc20_);
         _loc8_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc8_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc10_.addChild(_loc20_);
         _loc10_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc10_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc12_.addChild(_loc20_);
         _loc12_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc12_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc14_.addChild(_loc20_);
         _loc14_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc14_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc16_.addChild(_loc20_);
         _loc16_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc16_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("upleg_spider_",param1);
         _loc18_.addChild(_loc20_);
         _loc18_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
         _loc18_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("midleg_spider_",param1);
         if(_loc20_ == null)
         {
            return;
         }
         _loc3_.addChild(_loc20_);
         _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
         _loc3_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("midleg_spider_",param1);
         _loc6_.addChild(_loc20_);
         _loc6_.cacheAsBitmapMatrix = _loc6_.transform.concatenatedMatrix;
         _loc6_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("longlowleg_spider_",param1);
         if(_loc20_ == null)
         {
            return;
         }
         _loc4_.addChild(_loc20_);
         _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc4_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("longlowleg_spider_",param1);
         _loc7_.addChild(_loc20_);
         _loc7_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc7_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("lowleg_spider_",param1);
         _loc9_.addChild(_loc20_);
         _loc9_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc9_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("lowleg_spider_",param1);
         _loc11_.addChild(_loc20_);
         _loc11_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc11_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("lowleg_spider_",param1);
         _loc13_.addChild(_loc20_);
         _loc13_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc13_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("lowleg_spider_",param1);
         _loc15_.addChild(_loc20_);
         _loc15_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc15_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("lowleg_spider_",param1);
         _loc17_.addChild(_loc20_);
         _loc17_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc17_.cacheAsBitmap = true;
         _loc20_ = §1t6238s0§("lowleg_spider_",param1);
         _loc19_.addChild(_loc20_);
         _loc19_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc19_.cacheAsBitmap = true;
      }
      
      override public function setTail(param1:int) : *
      {
      }
   }
}

