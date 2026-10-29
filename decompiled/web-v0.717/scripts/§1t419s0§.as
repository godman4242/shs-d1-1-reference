package
{
   import flash.display.MovieClip;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol504")]
   public class §1t419s0§ extends MovieClip
   {
      
      public var base:MovieClip;
      
      public var flag:MovieClip;
      
      public function §1t419s0§()
      {
         super();
         stop();
      }
      
      public function §1t8033s0§(param1:int, param2:int, param3:int) : *
      {
         var _loc5_:§1t23s0§ = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc4_:Boolean = §1t1523s0§.§1t9663s0§(param3);
         if(_loc4_)
         {
            gotoAndStop(param1 * 10 + 7);
         }
         else
         {
            gotoAndStop(param1 * 10 + param3);
         }
         this.base.gotoAndStop(param2 + 1);
         if(this.flag != null)
         {
            this.flag.stop();
         }
         if(_loc4_)
         {
            _loc5_ = §1t3318s0§.instance.§1t3435s0§(param3);
            if(_loc5_ != null)
            {
               if(this.flag != null)
               {
                  §1t1643s0§.§1t11214s0§(this.flag.flag,_loc5_.color);
                  this.flag.logo.gotoAndStop(_loc5_.logo);
                  §1t1643s0§.§1t11214s0§(this.flag.logo,_loc5_.logocolor);
                  this.flag.flag.stop();
               }
            }
            else
            {
               gotoAndStop(param1 * 10 + 5);
            }
         }
         cacheAsBitmap = param1 != 0;
      }
   }
}

