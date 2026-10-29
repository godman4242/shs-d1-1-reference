package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol1661")]
   public class RockProjectile extends Projectile
   {
      
      public function RockProjectile()
      {
         super();
      }
      
      public function initRock(velX:int, velY:int, damage:int, owner:NPC = null) : *
      {
         gotoAndStop(1);
         breakable = true;
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         ttl = ttlMax;
         if(velX > 0)
         {
            scaleX = -1;
         }
         else
         {
            scaleX = 1;
         }
         var atklevel:int = 0;
         if(owner != null)
         {
            atklevel = owner.getLevel();
         }
         damageObj = new Damage(damage,atklevel);
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            doDisappear();
            return;
         }
         x += velX;
         y += velY;
         if(breakable)
         {
            if(velX > 0)
            {
               rotation += 30;
            }
            else
            {
               rotation -= 30;
            }
            velY += GRAVITY;
            if(this.y > StageManager.getGroundY() && velY > 0)
            {
               flying = false;
               return;
            }
            if(isFriendly())
            {
               if(NPCManager.checkHitObject(this,damageObj))
               {
                  this.removeProjectile();
               }
            }
            else if(NPCManager.checkPlayerHitObject(this,damageObj))
            {
               this.removeProjectile();
            }
         }
         else
         {
            if(velX > 0)
            {
               rotation += 20;
            }
            else
            {
               rotation -= 20;
            }
            velY += GRAVITY;
            if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > StatsManager.stageWidth + 10)
            {
               this.removeProjectile();
               return;
            }
         }
      }
      
      override public function doBreak() : *
      {
         breakable = false;
         velX = Math.random() * 30 - 15;
         velY = -(Math.random() * 5 + 5);
         ProjectileManager.createBladeSlashFx(x,y);
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         ProjectileManager.unregister(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
   }
}

