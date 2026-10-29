package
{
   import flash.display.MovieClip;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol705")]
   public class WarMarker extends MovieClip
   {
      
      public var logo:MovieClip;
      
      public var customhexbg:MovieClip;
      
      public function WarMarker()
      {
         super();
         stop();
      }
      
      public function setOwner(num:*) : *
      {
         var o:DatabaseObject = null;
         if(num == -1)
         {
            num = 0;
         }
         if(StatsManager.isCustomClan(num))
         {
            gotoAndStop(7);
            if(num == StatsManager.getSide())
            {
               this.logo.gotoAndStop(StatsManager.getCustomClanLogoId());
               ColorCode.changeColor(this.logo,StatsManager.getCustomClanLogoColor());
               ColorCode.changeColor(this.customhexbg,StatsManager.getCustomClanColor());
            }
            else
            {
               o = QueryManagerPIO.instance.getCustomClanData(num);
               if(o == null)
               {
                  this.logo.gotoAndStop(1);
                  ColorCode.changeColor(this.logo,13421772);
                  ColorCode.changeColor(this.customhexbg,3355443);
               }
               else
               {
                  this.logo.gotoAndStop(o.logo);
                  ColorCode.changeColor(this.logo,o.logocolor);
                  ColorCode.changeColor(this.customhexbg,o.color);
               }
            }
         }
         else
         {
            gotoAndStop(num + 1);
         }
         cacheAsBitmap = num != 0;
      }
   }
}

