package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1698")]
   public class LootProjectile extends Projectile
   {
      
      internal static var LOOT_MONEY:int = 0;
      
      internal static var LOOT_ITEM:int = 1;
      
      internal static var LOOT_ITEM_SPECIAL:int = 2;
      
      internal static var LOOT_ITEM_UNIQUE:int = 3;
      
      internal var rotationValue:int;
      
      internal var lootType:int;
      
      public function LootProjectile()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initLoot(velX:int, velY:int, rotationValue:int, lootType:int) : *
      {
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         this.rotationValue = rotationValue;
         ttl = 10 * 24;
         this.lootType = lootType;
         if(lootType == 0)
         {
            gotoAndStop(1);
         }
         else if(lootType == 1)
         {
            gotoAndStop(2);
         }
         else
         {
            gotoAndStop(3);
         }
      }
      
      override public function update() : *
      {
         var mcs:MovieClip = StatsManager.getPlayer().mcs;
         if(!flying)
         {
            doDisappear();
            return;
         }
         x += velX;
         y += velY;
         rotation += this.rotationValue;
         velY += GRAVITY;
         if(this.y > StageManager.getGroundY() - 15 && velY > 0)
         {
            if(velY < 5)
            {
               this.removeProjectile();
            }
            else
            {
               velY = -velY / 3;
               velX = velX * 3 / 4;
               this.rotationValue /= 2;
            }
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         ProjectileManager.unregister(this);
         ProjectileManager.unregisterLoot(this);
         ProjectilePool.returnLoot(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

