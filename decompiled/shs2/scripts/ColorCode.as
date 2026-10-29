package
{
   import flash.display.MovieClip;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   
   public class ColorCode
   {
      
      public function ColorCode()
      {
         super();
      }
      
      public static function desaturate(param1:MovieClip) : *
      {
         var _loc2_:Array = null;
         var _loc3_:ColorMatrixFilter = null;
         _loc2_ = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         _loc3_ = new ColorMatrixFilter(_loc2_);
         param1.filters = [_loc3_];
      }
      
      public static function makeDark_blur(param1:MovieClip, param2:int, param3:int) : *
      {
         var _loc4_:Array = null;
         var _loc5_:ColorMatrixFilter = null;
         var _loc6_:BlurFilter = null;
         _loc4_ = [1,0,0,0,param2,0,1,0,0,param2,0,0,1,0,param2,0,0,0,1,0];
         _loc5_ = new ColorMatrixFilter(_loc4_);
         _loc6_ = new BlurFilter(param3,param3,BitmapFilterQuality.LOW);
         param1.filters = [_loc5_,_loc6_];
      }
      
      public static function changeColor(param1:MovieClip, param2:uint) : *
      {
         var _loc3_:ColorTransform = null;
         _loc3_ = param1.transform.colorTransform;
         _loc3_.color = param2;
         param1.transform.colorTransform = _loc3_;
      }
      
      public static function makeDark(param1:MovieClip, param2:int) : *
      {
         var _loc3_:Array = null;
         var _loc4_:ColorMatrixFilter = null;
         _loc3_ = [1,0,0,0,param2,0,1,0,0,param2,0,0,1,0,param2,0,0,0,1,0];
         _loc4_ = new ColorMatrixFilter(_loc3_);
         param1.filters = [_loc4_];
      }
      
      public static function clearFilter(param1:MovieClip) : *
      {
         param1.filters = null;
      }
      
      public static function desaturate_blur(param1:MovieClip, param2:int) : *
      {
         var _loc3_:Array = null;
         var _loc4_:ColorMatrixFilter = null;
         var _loc5_:BlurFilter = null;
         _loc3_ = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         _loc4_ = new ColorMatrixFilter(_loc3_);
         _loc5_ = new BlurFilter(param2,param2,BitmapFilterQuality.LOW);
         param1.filters = [_loc4_,_loc5_];
      }
      
      public static function blur(param1:MovieClip, param2:int) : *
      {
         var _loc3_:BlurFilter = null;
         _loc3_ = new BlurFilter(param2,param2,BitmapFilterQuality.LOW);
         param1.filters = [_loc3_];
      }
      
      public static function blurHIGH(param1:MovieClip, param2:int) : *
      {
         var _loc3_:BlurFilter = null;
         _loc3_ = new BlurFilter(param2,param2,BitmapFilterQuality.HIGH);
         param1.filters = [_loc3_];
      }
      
      public static function desaturate_blurHIGH(param1:MovieClip, param2:int) : *
      {
         var _loc3_:Array = null;
         var _loc4_:ColorMatrixFilter = null;
         var _loc5_:BlurFilter = null;
         _loc3_ = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         _loc4_ = new ColorMatrixFilter(_loc3_);
         _loc5_ = new BlurFilter(param2,param2,BitmapFilterQuality.HIGH);
         param1.filters = [_loc4_,_loc5_];
      }
   }
}

