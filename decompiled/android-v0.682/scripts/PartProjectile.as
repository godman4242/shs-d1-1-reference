package
{
   public class PartProjectile extends Projectile
   {
      
      internal var rotationValue:int;
      
      public function PartProjectile()
      {
         super();
      }
      
      public function initPart(velX:int, velY:int, rotationValue:int) : *
      {
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         this.rotationValue = rotationValue;
         ttl = ttlMax;
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            return;
         }
         x += velX;
         y += velY;
         rotation += this.rotationValue;
         velY += GRAVITY;
         if(this.y > StageManager.getGroundY() && velY > 0)
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
         var childmax:* = numChildren;
         for(var i:int = 0; i < childmax; i++)
         {
            removeChildAt(0);
         }
         ProjectileManager.unregister(this);
         ProjectilePool.returnPart(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
   }
}

