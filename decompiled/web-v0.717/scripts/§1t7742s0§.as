package
{
   import flash.display.MovieClip;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol828")]
   public class §1t7742s0§ extends MovieClip
   {
      
      public var flag:MovieClip;
      
      internal var §1t7743s0§:int = 0;
      
      public function §1t7742s0§(param1:int, param2:int)
      {
         var _loc4_:§1t23s0§ = null;
         super();
         addFrameScript(0,this.frame1);
         if(param2 == -1)
         {
            param2 = 0;
         }
         var _loc3_:int = §1t1523s0§.§1t7746s0§();
         if(this.§1t7743s0§ == _loc3_)
         {
            return;
         }
         if(param2 == _loc3_)
         {
            this.§1t7743s0§ = _loc3_;
         }
         else
         {
            this.§1t7743s0§ = param1;
         }
         if(§1t1523s0§.§1t9663s0§(this.§1t7743s0§))
         {
            gotoAndStop(7);
            if(this.§1t7743s0§ == §1t1523s0§.§1t7746s0§())
            {
               this.flag.logo.gotoAndStop(§1t1523s0§.§1t9658s0§());
               §1t1643s0§.§1t11214s0§(this.flag.logo,§1t1523s0§.§1t9659s0§());
               §1t1643s0§.§1t11214s0§(this.flag.flag,§1t1523s0§.§1t9655s0§());
            }
            else
            {
               _loc4_ = §1t3318s0§.instance.§1t3435s0§(this.§1t7743s0§);
               if(_loc4_ == null)
               {
                  this.flag.logo.gotoAndStop(1);
                  §1t1643s0§.§1t11214s0§(this.flag.logo,13421772);
                  §1t1643s0§.§1t11214s0§(this.flag.flag,3355443);
               }
               else
               {
                  this.flag.logo.gotoAndStop(_loc4_.logo);
                  §1t1643s0§.§1t11214s0§(this.flag.logo,_loc4_.logocolor);
                  §1t1643s0§.§1t11214s0§(this.flag.flag,_loc4_.color);
               }
            }
         }
         else
         {
            gotoAndStop(this.§1t7743s0§);
         }
         if(§1t1523s0§.§1t9528s0§)
         {
            this.§1t7744s0§();
         }
      }
      
      public function §1t7744s0§() : *
      {
         if(§1t1523s0§.§1t9663s0§(this.§1t7743s0§))
         {
            this.flag.flag.stop();
         }
         this.flag.stop();
      }
      
      public function §1t7745s0§() : *
      {
         if(§1t1523s0§.§1t9528s0§)
         {
            return;
         }
         if(§1t1523s0§.§1t9663s0§(this.§1t7743s0§))
         {
            this.flag.flag.play();
         }
         this.flag.play();
      }
      
      public function §1t7746s0§() : *
      {
         return this.§1t7743s0§;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

