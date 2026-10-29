package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2516")]
   public class Obj_ChestGoodLoot extends InteractiveStageObject
   {
      
      internal var lvl:int;
      
      internal var intstat:int = -1;
      
      public function Obj_ChestGoodLoot(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = props;
         if(objname == "")
         {
            objectName = "Good Loot Chest";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.lvl = strArray[0];
         if(strArray.length >= 2 && strArray[1] == "1")
         {
            gotoAndStop(2);
            canInteract = false;
         }
         if(strArray.length >= 3)
         {
            this.intstat = int(strArray[2]);
            if(this.intstat != -1 && StatsManager.getStat(this.intstat) == QueryManager.instance.getServerDate())
            {
               gotoAndStop(2);
               canInteract = false;
            }
         }
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         var movtx:int = 0;
         var movty:int = 0;
         var rot:int = 0;
         if(this.intstat != -1)
         {
            StatsManager.setStat(this.intstat,QueryManager.instance.getServerDate());
            StatsManager.reportAchievementStat(60021,1);
         }
         gotoAndStop(2);
         canInteract = false;
         StageManager.addToDeadList(objectName);
         OverworldHUD.instance.minimap.clearCurrentRoomIcon();
         OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl,true,true);
         OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl);
         OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl);
         OverworldHUD.instance.lootDialog.addLootCoins(Math.random() * this.lvl + this.lvl * 5);
         var max:int = OverworldHUD.instance.lootDialog.getLootCount();
         for(var i:int = 0; i < max; i++)
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
         max = OverworldHUD.instance.lootDialog.getCoinsCount();
         if(max > 20)
         {
            max = 0;
         }
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
            movty = -Math.random() * 10 - 20;
            ProjectileManager.createLootProjectile(x,y - 50,movtx,movty,rot,int(Math.random() * 2));
         }
         OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
         OverworldHUD.instance.lootDialog.show();
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(190);
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(!canInteract)
         {
            return false;
         }
         return abs(x - mc.x) < 100;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

