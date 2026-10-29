package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol1756")]
   public class FireballProjectile extends Projectile
   {
      
      public function FireballProjectile()
      {
         super();
         addFrameScript(0,this.frame1,7,this.frame8);
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
         damageObj = new Damage(0,0,0,-1,damage);
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
         rotation = Math.atan(velY / velX) * 57.2727;
         if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > StatsManager.stageWidth + 10)
         {
            this.removeProjectile();
            return;
         }
         if(y > StageManager.getGroundY())
         {
            flying = false;
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
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         ProjectileManager.unregister(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame8() : *
      {
      }
   }
}

