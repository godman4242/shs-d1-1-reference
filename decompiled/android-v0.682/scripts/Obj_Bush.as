package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2549")]
   public class Obj_Bush extends InteractiveStageObject
   {
      
      internal var lvl:int;
      
      public function Obj_Bush(props:String)
      {
         super();
         scaleX = Math.random() * 0.3 + 0.8;
         scaleY = Math.random() * 0.3 + 0.8;
         if(int(Math.random() * 2) == 0)
         {
            scaleX = -scaleX;
         }
         var strArray:Array = props.split(",");
         if(strArray.length == 0 || strArray[0] == "")
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(strArray[0]);
         }
         if(strArray.length > 1)
         {
            this.lvl = strArray[1];
         }
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         OverworldHUD.getInstance().getNodeUI().runSearch(this);
      }
      
      override public function interact2() : *
      {
         var max:int = 0;
         var movtx:int = 0;
         var movty:int = 0;
         var rot:int = 0;
         var i:int = 0;
         StatsManager.reportAchievementStat(60007,1);
         if(int(Math.random() * 10) <= StatsManager.getStat(1021))
         {
            OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl,false,true);
            max = OverworldHUD.instance.lootDialog.getLootCount();
            for(i = 0; i < max; i++)
            {
               movtx = Math.random() * 16 - 8;
               if(x < 100 && movtx < 0)
               {
                  movtx *= -1;
               }
               else if(x > StageManager.getGameStageWidth() - 100 && movtx > 0)
               {
                  movtx *= -1;
               }
               rot = 20;
               if(movtx < 0)
               {
                  rot = -20;
               }
               movty = -Math.random() * 10 - 25;
               ProjectileManager.createLootProjectile(x,y - 50,movtx,movty,rot,2);
            }
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
            OverworldHUD.instance.lootDialog.show();
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(101),LangManager.getString(5));
         }
      }
      
      override public function getDisplayText() : String
      {
         if(currentFrame <= 3)
         {
            return LangManager.getString(186);
         }
         if(currentFrame <= 6)
         {
            return LangManager.getString(425);
         }
         return LangManager.getString(426);
      }
      
      override public function getAPUse() : int
      {
         return 2;
      }
   }
}

