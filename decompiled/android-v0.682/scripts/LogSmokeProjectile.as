package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol158")]
   public class LogSmokeProjectile extends Projectile
   {
      
      public function LogSmokeProjectile()
      {
         super();
         addFrameScript(5,this.frame6);
         visible = true;
         flying = false;
         this.velX = 0;
         this.velY = 0;
         ttl = ttlMax;
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            return;
         }
         y += velY;
         velY += GRAVITY;
         if(this.y > 480)
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
      
      internal function frame6() : *
      {
         stop();
         setFlying(true);
      }
   }
}

