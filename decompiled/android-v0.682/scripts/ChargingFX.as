package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol1832")]
   public class ChargingFX extends Projectile
   {
      
      public function ChargingFX()
      {
         super();
         visible = true;
         flying = false;
         this.velX = 0;
         this.velY = 0;
         ttl = ttlMax;
      }
      
      override public function update() : *
      {
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         ProjectileManager.unregister(this);
         if(StageManager.getGameStageCanvas().contains(this))
         {
            StageManager.getGameStageCanvas().removeChild(this);
         }
      }
   }
}

