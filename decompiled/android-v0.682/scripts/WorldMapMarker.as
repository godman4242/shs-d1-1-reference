package
{
   import flash.display.MovieClip;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol440")]
   public class WorldMapMarker extends MovieClip
   {
      
      public var base:MovieClip;
      
      public var flag:MovieClip;
      
      public function WorldMapMarker()
      {
         super();
         stop();
      }
      
      public function setTownState(num:int, leveltype:int, side:int) : *
      {
         var customClanObj:DatabaseObject = null;
         if(num < 0)
         {
            num = 0;
         }
         var isCustomSide:Boolean = StatsManager.isCustomClan(side);
         if(isCustomSide)
         {
            gotoAndStop(num * 10 + 7);
         }
         else
         {
            gotoAndStop(num * 10 + side);
         }
         this.base.gotoAndStop(leveltype + 1);
         if(this.flag != null)
         {
            this.flag.stop();
         }
         if(isCustomSide)
         {
            customClanObj = QueryManagerPIO.instance.getCustomClanData(side);
            if(customClanObj != null)
            {
               if(this.flag != null)
               {
                  ColorCode.changeColor(this.flag.flag,customClanObj.color);
                  this.flag.logo.gotoAndStop(customClanObj.logo);
                  ColorCode.changeColor(this.flag.logo,customClanObj.logocolor);
               }
            }
            else
            {
               gotoAndStop(num * 10 + 5);
            }
         }
         cacheAsBitmap = num != 0;
      }
   }
}

