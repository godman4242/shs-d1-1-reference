package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1601")]
   public class WhiteOutFX extends Projectile
   {
      
      public function WhiteOutFX()
      {
         super();
      }
      
      public function FlashbangFX() : *
      {
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(skilllevel == 1)
         {
            ttlMax = 24 * 3;
         }
         else if(skilllevel == 2)
         {
            ttlMax = 24 * 4;
         }
         else if(skilllevel == 3)
         {
            ttlMax = 24 * 5;
         }
         ttl = ttlMax;
         alpha = 0;
      }
      
      override public function doScroll(dist:int) : *
      {
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl <= 0)
         {
            this.removeProjectile();
         }
         else if(ttl >= ttlMax - 5)
         {
            alpha = (ttlMax - ttl) / 5;
         }
         else if(ttl < 5)
         {
            alpha = ttl / 5;
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
   }
}

