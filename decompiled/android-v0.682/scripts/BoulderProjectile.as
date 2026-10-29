package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1863")]
   public class BoulderProjectile extends Projectile
   {
      
      public var inner:MovieClip;
      
      public function BoulderProjectile()
      {
         super();
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         ttl = ttlMax;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -1;
         }
         else
         {
            scaleX = 1;
         }
         damageObj = new Damage(0,0,Damage.LAUNCH_KNOCKDOWN,-1,0,0,0,damage);
      }
      
      override public function update() : *
      {
         x += velX;
         if(this.y != StageManager.getGroundY())
         {
            velY += 3;
         }
         y += velY;
         if(this.y >= StageManager.getGroundY() && velY != 0)
         {
            this.y = StageManager.getGroundY();
            velY = -velY / 2;
            if(velY >= -1 && velY <= 1)
            {
               velY = 0;
            }
         }
         if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj);
         }
         else
         {
            NPCManager.checkPlayerHitObject(this,damageObj);
         }
         if(y < -10 || velX < 0 && x < -50 || velX > 0 && x > StatsManager.stageWidth + 50)
         {
            this.removeProjectile();
            return;
         }
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

