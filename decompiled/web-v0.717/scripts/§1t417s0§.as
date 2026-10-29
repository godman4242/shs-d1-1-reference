package
{
   import flash.display.MovieClip;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol824")]
   public class §1t417s0§ extends MovieClip
   {
      
      public var customhexbg:MovieClip;
      
      public var logo:MovieClip;
      
      public function §1t417s0§()
      {
         super();
         stop();
      }
      
      public function §1t7765s0§(param1:*) : *
      {
         var _loc2_:§1t23s0§ = null;
         if(param1 == -1)
         {
            param1 = 0;
         }
         if(§1t1523s0§.§1t9663s0§(param1))
         {
            gotoAndStop(7);
            if(param1 == §1t1523s0§.§1t7746s0§())
            {
               this.logo.gotoAndStop(§1t1523s0§.§1t9658s0§());
               §1t1643s0§.§1t11214s0§(this.logo,§1t1523s0§.§1t9659s0§());
               §1t1643s0§.§1t11214s0§(this.customhexbg,§1t1523s0§.§1t9655s0§());
            }
            else
            {
               _loc2_ = §1t3318s0§.instance.§1t3435s0§(param1);
               if(_loc2_ == null)
               {
                  this.logo.gotoAndStop(1);
                  §1t1643s0§.§1t11214s0§(this.logo,13421772);
                  §1t1643s0§.§1t11214s0§(this.customhexbg,3355443);
               }
               else
               {
                  this.logo.gotoAndStop(_loc2_.logo);
                  §1t1643s0§.§1t11214s0§(this.logo,_loc2_.logocolor);
                  §1t1643s0§.§1t11214s0§(this.customhexbg,_loc2_.color);
               }
            }
         }
         else
         {
            gotoAndStop(param1 + 1);
         }
         cacheAsBitmap = param1 != 0;
      }
   }
}

