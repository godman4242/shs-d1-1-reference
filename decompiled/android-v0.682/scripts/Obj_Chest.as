package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2520")]
   public class Obj_Chest extends InteractiveStageObject
   {
      
      public function Obj_Chest(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = props;
         if(objname == "")
         {
            objectName = "Chest";
         }
         else
         {
            objectName = objname;
         }
         var xml:XMLList = XMLList(props);
         if(StatsManager.checkCondition(xml.condition,1))
         {
            gotoAndStop(2);
            canInteract = false;
         }
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         var loot:XMLLoot = null;
         var chance:int = 0;
         var lootType:int = 0;
         var qty:int = 0;
         var movtx:int = 0;
         var movty:int = 0;
         var rot:int = 0;
         var j:int = 0;
         gotoAndStop(2);
         canInteract = false;
         var xml:XMLList = XMLList(props);
         StatsManager.setStat(xml.condition,1);
         QueryManager.instance.saveModifiedCharData();
         var reward:XMLReward = new XMLReward(xml.reward);
         var level:int = StatsManager.getLevel();
         var max:int = int(reward.loot.length);
         for(var i:int = 0; i < max; i++)
         {
            loot = reward.loot[i];
            lootType = int(loot.id);
            qty = loot.qty;
            chance = loot.chance * 100;
            if(chance == 100 || Math.random() * 100 < chance)
            {
               for(j = 0; j < qty; j++)
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
                  if(lootType == 0)
                  {
                     movty = -Math.random() * 10 - 20;
                  }
                  else
                  {
                     movty = -Math.random() * 10 - 25;
                  }
                  ProjectileManager.createLootProjectile(x,y - 50,movtx,movty,rot,lootType);
               }
               if(lootType == 0)
               {
                  OverworldHUD.instance.lootDialog.addLootCoins(1 * qty);
               }
               else if(lootType == 1)
               {
                  OverworldHUD.instance.lootDialog.addLootCoins(5 * qty);
               }
               else
               {
                  OverworldHUD.instance.lootDialog.addLootItem(lootType,level,qty);
               }
            }
         }
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

