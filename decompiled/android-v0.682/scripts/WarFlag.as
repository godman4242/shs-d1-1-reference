package
{
   import flash.display.MovieClip;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol709")]
   public class WarFlag extends MovieClip
   {
      
      public var flag:MovieClip;
      
      internal var currentflag:int = 0;
      
      public function WarFlag(_flag:int, owner:int)
      {
         var o:DatabaseObject = null;
         super();
         addFrameScript(0,this.frame1);
         if(owner == -1)
         {
            owner = 0;
         }
         var side:int = StatsManager.getSide();
         if(this.currentflag == side)
         {
            return;
         }
         if(owner == side)
         {
            this.currentflag = side;
         }
         else
         {
            this.currentflag = _flag;
         }
         if(StatsManager.isCustomClan(this.currentflag))
         {
            gotoAndStop(7);
            if(this.currentflag == StatsManager.getSide())
            {
               this.flag.logo.gotoAndStop(StatsManager.getCustomClanLogoId());
               ColorCode.changeColor(this.flag.logo,StatsManager.getCustomClanLogoColor());
               ColorCode.changeColor(this.flag.flag,StatsManager.getCustomClanColor());
            }
            else
            {
               o = QueryManagerPIO.instance.getCustomClanData(this.currentflag);
               if(o == null)
               {
                  this.flag.logo.gotoAndStop(1);
                  ColorCode.changeColor(this.flag.logo,13421772);
                  ColorCode.changeColor(this.flag.flag,3355443);
               }
               else
               {
                  this.flag.logo.gotoAndStop(o.logo);
                  ColorCode.changeColor(this.flag.logo,o.logocolor);
                  ColorCode.changeColor(this.flag.flag,o.color);
               }
            }
         }
         else
         {
            gotoAndStop(this.currentflag);
         }
         if(StatsManager.isMobile)
         {
            this.stopFlag();
         }
      }
      
      public function stopFlag() : *
      {
         if(StatsManager.isCustomClan(this.currentflag))
         {
            this.flag.flag.stop();
         }
         this.flag.stop();
      }
      
      public function playFlag() : *
      {
         if(StatsManager.isMobile)
         {
            return;
         }
         if(StatsManager.isCustomClan(this.currentflag))
         {
            this.flag.flag.play();
         }
         this.flag.play();
      }
      
      public function getSide() : *
      {
         return this.currentflag;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

