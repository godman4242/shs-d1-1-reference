package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol1947")]
   public class ArrowProjectile extends Projectile
   {
      
      internal var canLaunch:Boolean;
      
      public function ArrowProjectile()
      {
         super();
      }
      
      public function initArrow(velX:int, velY:int, damage:int, canLaunch:Boolean, owner:NPC = null) : *
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
         if(canLaunch)
         {
            damageObj.launchType = Damage.LAUNCH_KNOCKDOWN;
         }
         this.owner = owner;
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
            rotation = Math.atan(velY / velX) * 57.2727 + 180;
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
         gotoAndStop("broken");
         ProjectileManager.createBladeSlashFx(x,y);
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         ProjectileManager.unregister(this);
         ProjectilePool.returnArrow(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
   }
}

