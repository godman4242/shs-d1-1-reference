package
{
   import flash.display.MovieClip;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   
   public class ColorCode
   {
      
      internal static var blackColorTransform:ColorTransform = new ColorTransform(0,0,0,1,0,0,0,0);
      
      internal static var defaultColorTransform:ColorTransform = new ColorTransform();
      
      public function ColorCode()
      {
         super();
      }
      
      public static function changeColor(obj:MovieClip, color:uint) : *
      {
         var colorTransform:ColorTransform = obj.transform.colorTransform;
         colorTransform.color = color;
         obj.transform.colorTransform = colorTransform;
      }
      
      public static function makeBlack(obj:MovieClip) : *
      {
         obj.transform.colorTransform = blackColorTransform;
      }
      
      public static function makeDark(obj:MovieClip, num:int) : *
      {
         makeBlack(obj);
      }
      
      public static function makeDark_blur(obj:MovieClip, num:int, blur:int) : *
      {
         makeBlack(obj);
         var blurFilter:BlurFilter = new BlurFilter(blur,blur,BitmapFilterQuality.LOW);
         obj.filters = [blurFilter];
      }
      
      public static function desaturate(obj:MovieClip) : *
      {
         var myElements_array:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         var myColorMatrix_filter:ColorMatrixFilter = new ColorMatrixFilter(myElements_array);
         obj.filters = [myColorMatrix_filter];
      }
      
      public static function blur(obj:MovieClip, blur:int) : *
      {
         var blurFilter:BlurFilter = new BlurFilter(blur,blur,BitmapFilterQuality.LOW);
         obj.filters = [blurFilter];
      }
      
      public static function blurHIGH(obj:MovieClip, blur:int) : *
      {
         var blurFilter:BlurFilter = new BlurFilter(blur,blur,BitmapFilterQuality.HIGH);
         obj.filters = [blurFilter];
      }
      
      public static function desaturate_blur(obj:MovieClip, blur:int) : *
      {
         var myElements_array:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         var myColorMatrix_filter:ColorMatrixFilter = new ColorMatrixFilter(myElements_array);
         var blurFilter:BlurFilter = new BlurFilter(blur,blur,BitmapFilterQuality.LOW);
         obj.filters = [myColorMatrix_filter,blurFilter];
      }
      
      public static function desaturate_blurHIGH(obj:MovieClip, blur:int) : *
      {
         var myElements_array:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         var myColorMatrix_filter:ColorMatrixFilter = new ColorMatrixFilter(myElements_array);
         var blurFilter:BlurFilter = new BlurFilter(blur,blur,BitmapFilterQuality.HIGH);
         obj.filters = [myColorMatrix_filter,blurFilter];
      }
      
      public static function clearFilter(obj:MovieClip) : *
      {
         obj.filters = null;
         obj.transform.colorTransform = defaultColorTransform;
      }
      
      public static function generateLightColor(seed:int) : uint
      {
         var rng:RNG = new RNG(seed);
         var r:int = 225 + rng.rand(30);
         var g:int = 225 + rng.rand(30);
         var b:int = 225 + rng.rand(30);
         return r << 16 | g << 8 | b;
      }
      
      public static function generateDarkColor(seed:int) : uint
      {
         var rng:RNG = new RNG(seed);
         var r:int = rng.rand(128);
         var g:int = rng.rand(128);
         var b:int = rng.rand(128);
         return r << 16 | g << 8 | b;
      }
      
      public static function generateColor(seed:int) : uint
      {
         var rng:RNG = new RNG(seed);
         return rng.rand(16777215);
      }
      
      public static function setMCTint(mc:MovieClip, mul:Number, col:uint) : *
      {
         var r:uint = uint(col >> 16 & 0xFF);
         var g:uint = uint(col >> 8 & 0xFF);
         var b:uint = uint(col & 0xFF);
         var ctMul:Number = 1 - mul;
         var ctRedOff:Number = Math.round(mul * r);
         var ctGreenOff:Number = Math.round(mul * g);
         var ctBlueOff:Number = Math.round(mul * b);
         var ct:* = new ColorTransform(ctMul,ctMul,ctMul,1,ctRedOff,ctGreenOff,ctBlueOff,0);
         mc.transform.colorTransform = ct;
      }
   }
}

