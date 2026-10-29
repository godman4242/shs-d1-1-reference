package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class §1t1643s0§
   {
      
      internal static var §1t2257s0§:ColorTransform = new ColorTransform(0,0,0,1,0,0,0,0);
      
      internal static var §1t11213s0§:ColorTransform = new ColorTransform();
      
      public function §1t1643s0§()
      {
         super();
      }
      
      public static function §1t11214s0§(param1:MovieClip, param2:uint) : *
      {
         var _loc3_:ColorTransform = param1.transform.colorTransform;
         _loc3_.color = param2;
         param1.transform.colorTransform = _loc3_;
      }
      
      public static function §1t11215s0§(param1:DisplayObject) : *
      {
         param1.transform.colorTransform = §1t2257s0§;
      }
      
      public static function §1t11216s0§(param1:MovieClip, param2:int) : *
      {
         §1t11215s0§(param1);
      }
      
      public static function §1t11217s0§(param1:MovieClip, param2:int, param3:int) : *
      {
         §1t11215s0§(param1);
         forceBlur(param1,param3);
      }
      
      public static function desaturate(param1:MovieClip) : *
      {
         var _loc2_:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         var _loc3_:ColorMatrixFilter = new ColorMatrixFilter(_loc2_);
         param1.filters = [_loc3_];
      }
      
      public static function blur(param1:MovieClip, param2:int) : *
      {
         var _loc3_:BlurFilter = new BlurFilter(param2,param2,BitmapFilterQuality.LOW);
         param1.filters = [_loc3_];
      }
      
      public static function forceBlur(param1:MovieClip, param2:int) : *
      {
         var _loc4_:BitmapData = null;
         var _loc5_:Matrix = null;
         var _loc6_:Bitmap = null;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc3_:BlurFilter = new BlurFilter(param2,param2,BitmapFilterQuality.LOW);
         param1.filters = [_loc3_];
         if(§1t1523s0§.§1t9528s0§)
         {
            _loc4_ = new BitmapData(param1.width + param2,param1.height + param2,true,0);
            _loc5_ = new Matrix(1,0,0,1,param2 / 2,param2 / 2);
            _loc4_.draw(param1,_loc5_);
            _loc6_ = new Bitmap(_loc4_,"auto",true);
            _loc7_ = param1.numChildren;
            _loc8_ = int(_loc7_ - 1);
            while(_loc8_ >= 0)
            {
               param1.removeChildAt(_loc8_);
               _loc8_--;
            }
            _loc6_.x -= param2 / 2;
            _loc6_.y -= param2 / 2;
            param1.filters = null;
            param1.addChild(_loc6_);
         }
      }
      
      public static function §1t11221s0§(param1:MovieClip, param2:int) : *
      {
         var _loc3_:BlurFilter = new BlurFilter(param2,param2,BitmapFilterQuality.HIGH);
         param1.filters = [_loc3_];
      }
      
      public static function §1t11222s0§(param1:MovieClip, param2:int) : *
      {
         var _loc3_:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         var _loc4_:ColorMatrixFilter = new ColorMatrixFilter(_loc3_);
         var _loc5_:BlurFilter = new BlurFilter(param2,param2,BitmapFilterQuality.LOW);
         param1.filters = [_loc4_,_loc5_];
      }
      
      public static function §1t11223s0§(param1:MovieClip, param2:int) : *
      {
         var _loc3_:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         var _loc4_:ColorMatrixFilter = new ColorMatrixFilter(_loc3_);
         var _loc5_:BlurFilter = new BlurFilter(param2,param2,BitmapFilterQuality.HIGH);
         param1.filters = [_loc4_,_loc5_];
      }
      
      public static function §1t3311s0§(param1:DisplayObject) : *
      {
         param1.filters = null;
         param1.transform.colorTransform = §1t11213s0§;
      }
      
      public static function §1t11224s0§(param1:int) : uint
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc3_:int = 225 + _loc2_.rand(30);
         var _loc4_:int = 225 + _loc2_.rand(30);
         var _loc5_:int = 225 + _loc2_.rand(30);
         _loc2_.destroy();
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function §1t11225s0§(param1:int) : uint
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc3_:int = _loc2_.rand(128);
         var _loc4_:int = _loc2_.rand(128);
         var _loc5_:int = _loc2_.rand(128);
         _loc2_.destroy();
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function §1t11226s0§(param1:int) : uint
      {
         return §1t58s0§.random(16777215,param1);
      }
      
      public static function §1t11227s0§(param1:MovieClip, param2:Number, param3:uint) : *
      {
         var _loc4_:uint = uint(param3 >> 16 & 0xFF);
         var _loc5_:uint = uint(param3 >> 8 & 0xFF);
         var _loc6_:uint = uint(param3 & 0xFF);
         var _loc7_:Number = 1 - param2;
         var _loc8_:Number = Math.round(param2 * _loc4_);
         var _loc9_:Number = Math.round(param2 * _loc5_);
         var _loc10_:Number = Math.round(param2 * _loc6_);
         var _loc11_:* = new ColorTransform(_loc7_,_loc7_,_loc7_,1,_loc8_,_loc9_,_loc10_,0);
         param1.transform.colorTransform = _loc11_;
      }
      
      public static function §1t11228s0§(param1:int) : Boolean
      {
         var _loc2_:uint = uint(param1 >> 16 & 0xFF);
         var _loc3_:uint = uint(param1 >> 8 & 0xFF);
         var _loc4_:uint = uint(param1 & 0xFF);
         return _loc2_ < 102 && _loc3_ < 102 && _loc4_ < 102;
      }
   }
}

